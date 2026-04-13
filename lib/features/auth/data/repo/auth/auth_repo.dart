import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> register(AuthParams params);
  Future<Either<Failure, AuthResponse>> login(AuthParams params);
}

