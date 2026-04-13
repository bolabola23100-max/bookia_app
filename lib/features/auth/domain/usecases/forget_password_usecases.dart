import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/repo/verification/verification_repo.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUseCases {
  final VerificationRepo verificationRepo;
  ForgetPasswordUseCases(this.verificationRepo);
  Future<Either<Failure, AuthResponse>> call(String email) async {
    return await verificationRepo.forgetPassword(email);
  }
}
