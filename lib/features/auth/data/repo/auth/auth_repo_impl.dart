import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/repo/auth/auth_repo.dart';
import 'package:bookia/features/auth/data/data_source/remote_data_source.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, AuthResponse>> register(AuthParams params) {
    return authRemoteDataSource.register(params);
  }

  @override
  Future<Either<Failure, AuthResponse>> login(AuthParams params) {
    return authRemoteDataSource.login(params);
  }
}
