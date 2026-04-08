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
    var response = await AuthRepo.register(
      RegisterParams(
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
    var response = await VerificationRepo.forgetPassword(
      VerificationParams(email: emailController.text),
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
    var response = await VerificationRepo.verifyCode(
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
    var response = await VerificationRepo.createNewPassword(
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
