import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/data/model/order_history_response/order_history_response.dart';
import 'package:bookia/features/profile/data/model/profile_response/profile_response.dart';
import 'package:dio/dio.dart';

class ProfileRepo {
  Future<OrderHistoryResponse?> getOrderHistory() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.orderHistory,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return OrderHistoryResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<ProfileResponse?> getProfile() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.profile,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<ProfileResponse?> updateProfile({
    required String name,
    required String address,
    required String phone,
    required String? imagePath,
  }) async {
    try {
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

      var response = await DioProvider.post(
        endpoint: Apis.updateProfile,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
        data: data,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.updatePassword,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
        data: {
          "current_password": currentPassword,
          "new_password": newPassword,
          "new_password_confirmation": confirmPassword,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteProfile({required String currentPassword}) async {
    try {
      FormData data = FormData.fromMap({
        "current_password": currentPassword,
      });
      var response = await DioProvider.post(
        endpoint: Apis.deleteProfile,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
        data: data,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    await SharedPref.clearData();
  }
}
