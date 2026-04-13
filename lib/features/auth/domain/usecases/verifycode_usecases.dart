import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/verification_params.dart';
import 'package:bookia/features/auth/data/repo/verification/verification_repo.dart';
import 'package:dartz/dartz.dart';

class VerifyCodeUseCases {
  final VerificationRepo verificationRepo;
  VerifyCodeUseCases(this.verificationRepo);
  Future<Either<Failure, AuthResponse>> call(VerificationParams params) async {
    return await verificationRepo.verifyCode(params);
  }
}
