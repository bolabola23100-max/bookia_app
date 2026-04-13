import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/delete_profile_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/logout_usecase.dart';
import 'package:bookia/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? imagePath;

  User? getUserInfo() {
    return SharedPref.getUserInfo();
  }

  void pickImage() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      imagePath = image.path;
      emit(ProfileInitialState());
    }
  }

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    var data = await getIt<GetProfileUseCase>().call();
    data.fold(
      (l) {
        emit(ProfileErrorState());
      },
      (r) {
        var user = User.fromJson(r.data!.toJson());
        nameController.text = user.name ?? '';
        addressController.text = user.address ?? '';
        phoneController.text = user.phone ?? '';
        SharedPref.setUserInfo(user);
        emit(ProfileSuccessState(user: user));
      },
    );
  }

  Future<void> updateProfile() async {
    emit(UpdateProfileLoadingState());
    var data = await getIt<UpdateProfileUseCase>().call(
      name: nameController.text,
      address: addressController.text,
      phone: phoneController.text,
      imagePath: imagePath,
    );
    data.fold(
      (l) {
        emit(UpdateProfileErrorState());
      },
      (r) {
        emit(UpdateProfileSuccessState(user: User.fromJson(r.data!.toJson())));
        getProfile();
      },
    );
  }

  Future<void> submitNewPassword() async {
    emit(ChangePasswordLoadingState());
    var isSuccess = await getIt<ChangePasswordUseCase>().call(
      currentPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    isSuccess.fold(
      (l) {
        emit(ChangePasswordErrorState());
      },
      (r) {
        emit(ChangePasswordSuccessState());
      },
    );
  }

  Future<void> logout() async {
    emit(LogoutLoadingState());
    await getIt<LogoutUseCase>().call();
    emit(LogoutSuccessState());
  }

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoadingState());
    var isSuccess = await getIt<DeleteProfileUseCase>().call(
      currentPassword: currentPasswordController.text,
    );
    isSuccess.fold(
      (l) {
        emit(DeleteAccountErrorState());
      },
      (r) async {
        await getIt<LogoutUseCase>().call();
        emit(DeleteAccountSuccessState());
      },
    );
  }
}
