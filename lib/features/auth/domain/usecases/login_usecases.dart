import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/repo/auth/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCases {
  final AuthRepo authRepo;
  LoginUseCases(this.authRepo);
  Future<Either<Failure, AuthResponse>> call(AuthParams params) async {
    return await authRepo.login(params);
  }
}
