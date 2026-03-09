import 'package:bookia/features/auth/data/models/verification_params.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/data/repo/verification_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    var response = await AuthRepo.login(
      RegisterParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "failed to login"));
    }
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.register(
      RegisterParams(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        name: usernameController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "failed to register"));
    }
  }

  Future<void> forgetPassword() async {
    emit(AuthLoadingState());
    var response = await VerificationRepo.forgetPassword(
      VerificationParams(email: emailController.text),
    );
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Failed to send code. Please try again."));
    }
  }

  Future<void> otpCode() async {
    emit(AuthLoadingState());
    var response = await VerificationRepo.verifyCode(
      VerificationParams(
        email: emailController.text,
        verifyCode: pinController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Invalid verification code"));
    }
  }

  Future<void> createNewPassword() async {
    emit(AuthLoadingState());
    var response = await VerificationRepo.createNewPassword(
      VerificationParams(
        email: emailController.text,
        verifyCode: pinController.text,
        newPassword: passwordController.text,
        newPasswordConfirmation: confirmPasswordController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(
        AuthErrorState(message: "Failed to reset password. Please try again."),
      );
    }
  }
}
