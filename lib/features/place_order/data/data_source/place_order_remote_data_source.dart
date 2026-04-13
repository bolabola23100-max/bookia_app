import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/place_order/data/models/governorates_response/governorates_response.dart';
import 'package:dartz/dartz.dart';

abstract class PlaceOrderRemoteDataSource {
  Future<Either<Failure, GovernoratesResponse>> getGovernorates();
  Future<Either<Failure, bool>> placeOrder({
    required String name,
    required String email,
    required String address,
    required String phone,
    required int governorateId,
  });
}
