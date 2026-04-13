import 'dart:developer';

import 'package:bookia/core/services/dio/api/post_api.dart';
import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/models/verification_params.dart';
import 'package:bookia/features/auth/data/data_source/remote_data_source.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, AuthResponse>> register(AuthParams params) async {
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

  @override
  Future<Either<Failure, AuthResponse>> login(AuthParams params) async {
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

  @override
  Future<Either<Failure, AuthResponse>> createNewPassword(
    VerificationParams params,
  ) async {
    try {
      var response = await PostApi.postApi(
        endpoint: Apis.resetPassword,
        data: params.toJson(),
      );
      return response.fold(
        (l) {
          return Left(l);
        },
        (r) {
          var data = AuthResponse.fromJson(r);
          return Right(data);
        },
      );
    } on Exception catch (e) {
      log(e.toString());
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> forgetPassword(String email) async {
    try {
      var response = await PostApi.postApi(
        endpoint: Apis.forgetPassword,
        data: {"email": email},
      );
      return response.fold(
        (l) {
          return Left(l);
        },
        (r) {
          var data = AuthResponse.fromJson(r);
          return Right(data);
        },
      );
    } on Exception catch (e) {
      log(e.toString());
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> verifyCode(
    VerificationParams params,
  ) async {
    try {
      var response = await PostApi.postApi(
        endpoint: Apis.verifyCode,
        data: params.toJson(),
      );
      return response.fold(
        (l) {
          return Left(l);
        },
        (r) {
          var data = AuthResponse.fromJson(r);
          return Right(data);
        },
      );
    } on Exception catch (e) {
      log(e.toString());
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
