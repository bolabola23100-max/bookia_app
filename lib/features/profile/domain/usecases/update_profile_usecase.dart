import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/data/model/profile_response/profile_response.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUseCase {
  final ProfileRepo profileRepo;
  UpdateProfileUseCase(this.profileRepo);
  Future<Either<Failure, ProfileResponse>> call({
    required String name,
    required String address,
    required String phone,
    required String? imagePath,
  }) async {
    return await profileRepo.updateProfile(
      name: name,
      address: address,
      phone: phone,
      imagePath: imagePath,
    );
  }
}
