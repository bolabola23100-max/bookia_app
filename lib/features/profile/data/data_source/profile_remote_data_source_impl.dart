import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/api/get_api.dart';
import 'package:bookia/core/services/dio/api/post_api.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:bookia/features/profile/data/model/order_history_response/order_history_response.dart';
import 'package:bookia/features/profile/data/model/profile_response/profile_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  @override
  Future<Either<Failure, OrderHistoryResponse>> getOrderHistory() async {
    var response = await GetApi.getApi(
      endpoint: Apis.orderHistory,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (r) {
        var data = OrderHistoryResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, ProfileResponse>> getProfile() async {
    var response = await GetApi.getApi(
      endpoint: Apis.profile,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (r) {
        var data = ProfileResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, ProfileResponse>> updateProfile({
    required String name,
    required String address,
    required String phone,
    required String? imagePath,
  }) async {
    FormData data = FormData.fromMap({
      "name": name,
      "address": address,
      "phone": phone,
    });

    if (imagePath != null) {
      data.files.add(
        MapEntry("image", await MultipartFile.fromFile(imagePath)),
      );
    }

    var response = await PostApi.postApi(
      endpoint: Apis.updateProfile,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      data: data,
    );
    return response.fold(
      (l) => Left(l),
      (r) {
        var profileData = ProfileResponse.fromJson({'data': r});
        return Right(profileData);
      },
    );
  }

  @override
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    var response = await PostApi.postApi(
      endpoint: Apis.updatePassword,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      data: {
        "current_password": currentPassword,
        "new_password": newPassword,
        "new_password_confirmation": confirmPassword,
      },
    );
    return response.fold(
      (l) => Left(l),
      (r) => const Right(true),
    );
  }

  @override
  Future<Either<Failure, bool>> deleteProfile({
    required String currentPassword,
  }) async {
    FormData data = FormData.fromMap({"current_password": currentPassword});
    var response = await PostApi.postApi(
      endpoint: Apis.deleteProfile,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      data: data,
    );
    return response.fold(
      (l) => Left(l),
      (r) => const Right(true),
    );
  }
}
