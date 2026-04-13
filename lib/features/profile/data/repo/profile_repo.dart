import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/data/model/order_history_response/order_history_response.dart';
import 'package:bookia/features/profile/data/model/profile_response/profile_response.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, OrderHistoryResponse>> getOrderHistory();
  Future<Either<Failure, ProfileResponse>> getProfile();
  Future<Either<Failure, ProfileResponse>> updateProfile({
    required String name,
    required String address,
    required String phone,
    required String? imagePath,
  });
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<Either<Failure, bool>> deleteProfile({required String currentPassword});
  Future<void> logout();
}
