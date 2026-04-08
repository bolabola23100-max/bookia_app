import 'package:bookia/core/services/dio/api/post_api.dart';
import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  static Future<Either<Failure, AuthResponse>> register(
    RegisterParams params,
  ) async {
    var response = await PostApi.postApi(
      endpoint: Apis.register,
      data: params.toJson(),
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        var data = AuthResponse.fromJson(r);
        SharedPref.setToken(data.token ?? "");
        SharedPref.setUserInfo(data.user);
        return Right(data);
      },
    );
  }

  static Future<Either<Failure, AuthResponse>> login(
    RegisterParams params,
  ) async {
    var response = await PostApi.postApi(
      endpoint: Apis.login,
      data: params.toJson(),
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        var data = AuthResponse.fromJson(r);
        SharedPref.setToken(data.token ?? "");
        SharedPref.setUserInfo(data.user);
        return Right(data);
      },
    );
  }
}
