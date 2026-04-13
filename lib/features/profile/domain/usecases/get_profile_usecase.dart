import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/data/model/profile_response/profile_response.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';

class GetProfileUseCase {
  final ProfileRepo profileRepo;
  GetProfileUseCase(this.profileRepo);
  Future<Either<Failure, ProfileResponse>> call() async {
    return await profileRepo.getProfile();
  }
}
