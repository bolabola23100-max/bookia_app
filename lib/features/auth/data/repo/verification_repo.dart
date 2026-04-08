import 'dart:developer';

import 'package:bookia/core/services/dio/api/post_api.dart';
import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/verification_params.dart';
import 'package:dartz/dartz.dart';

class VerificationRepo {
  static Future<Either<Failure, AuthResponse>> forgetPassword(
    VerificationParams params,
  ) async {
    try {
      var response = await PostApi.postApi(
        endpoint: Apis.forgetPassword,
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

  static Future<Either<Failure, AuthResponse>> verifyCode(
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

  static Future<Either<Failure, AuthResponse>> createNewPassword(
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
}
