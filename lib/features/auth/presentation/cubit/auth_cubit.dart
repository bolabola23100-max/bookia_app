import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/features/auth/data/models/verification_params.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/domain/usecases/login_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookia/features/auth/domain/usecases/register_usecases.dart';
import 'package:bookia/features/auth/domain/usecases/forget_password_usecases.dart';
import 'package:bookia/features/auth/domain/usecases/verifycode_usecases.dart';
import 'package:bookia/features/auth/domain/usecases/create_new_password_usecases.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final pinController = TextEditingController();

  Future<void> login() async {
    emit(AuthLoadingState());
    var response = await getIt<LoginUseCases>().call(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    var response = await getIt<RegisterUseCases>().call(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        name: usernameController.text,
      ),
    );
    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> forgetPassword() async {
    emit(AuthLoadingState());
    var response = await getIt<ForgetPasswordUseCases>().call(
      emailController.text,
    );
    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> otpCode() async {
    emit(AuthLoadingState());
    var response = await getIt<VerifyCodeUseCases>().call(
      VerificationParams(
        email: emailController.text,
        verifyCode: pinController.text,
      ),
    );
    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> createNewPassword() async {
    emit(AuthLoadingState());
    var response = await getIt<CreateNewPasswordUseCases>().call(
      VerificationParams(
        email: emailController.text,
        verifyCode: pinController.text,
        newPassword: passwordController.text,
        newPasswordConfirmation: confirmPasswordController.text,
      ),
    );
    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }
}
