import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/verification_params.dart';
import 'package:bookia/features/auth/data/repo/verification/verification_repo.dart';
import 'package:bookia/features/auth/data/data_source/remote_data_source.dart';
import 'package:dartz/dartz.dart';

class VerificationRepoImpl implements VerificationRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  VerificationRepoImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, AuthResponse>> createNewPassword(
    VerificationParams params,
  ) {
    return authRemoteDataSource.createNewPassword(params);
  }

  @override
  Future<Either<Failure, AuthResponse>> forgetPassword(String email) {
    return authRemoteDataSource.forgetPassword(email);
  }

  @override
  Future<Either<Failure, AuthResponse>> verifyCode(VerificationParams params) {
    return authRemoteDataSource.verifyCode(params);
  }
}
