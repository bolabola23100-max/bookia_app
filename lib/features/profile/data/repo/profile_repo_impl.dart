import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:bookia/features/profile/data/model/order_history_response/order_history_response.dart';
import 'package:bookia/features/profile/data/model/profile_response/profile_response.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, OrderHistoryResponse>> getOrderHistory() async {
    return await profileRemoteDataSource.getOrderHistory();
  }

  @override
  Future<Either<Failure, ProfileResponse>> getProfile() async {
    return await profileRemoteDataSource.getProfile();
  }

  @override
  Future<Either<Failure, ProfileResponse>> updateProfile({
    required String name,
    required String address,
    required String phone,
    required String? imagePath,
  }) async {
    return await profileRemoteDataSource.updateProfile(
      name: name,
      address: address,
      phone: phone,
      imagePath: imagePath,
    );
  }

  @override
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    return await profileRemoteDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }

  @override
  Future<Either<Failure, bool>> deleteProfile({
    required String currentPassword,
  }) async {
    return await profileRemoteDataSource.deleteProfile(
      currentPassword: currentPassword,
    );
  }

  @override
  Future<void> logout() async {
    await SharedPref.clearData();
  }
}
