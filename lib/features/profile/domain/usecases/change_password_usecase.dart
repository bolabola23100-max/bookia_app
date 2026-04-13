import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  final ProfileRepo profileRepo;
  ChangePasswordUseCase(this.profileRepo);
  Future<Either<Failure, bool>> call({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    return await profileRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }
}
