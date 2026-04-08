import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
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
    var data = await ProfileRepo().getProfile();
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
    var data = await ProfileRepo().updateProfile(
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
    var isSuccess = await ProfileRepo().changePassword(
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
    await ProfileRepo().logout();
    emit(LogoutSuccessState());
  }

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoadingState());
    var isSuccess = await ProfileRepo().deleteProfile(
      currentPassword: currentPasswordController.text,
    );
    isSuccess.fold(
      (l) {
        emit(DeleteAccountErrorState());
      },
      (r) async {
        await ProfileRepo().logout();
        emit(DeleteAccountSuccessState());
      },
    );
  }
}
