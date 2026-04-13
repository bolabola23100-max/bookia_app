import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteProfileUseCase {
  final ProfileRepo profileRepo;
  DeleteProfileUseCase(this.profileRepo);
  Future<Either<Failure, bool>> call({required String currentPassword}) async {
    return await profileRepo.deleteProfile(currentPassword: currentPassword);
  }
}
