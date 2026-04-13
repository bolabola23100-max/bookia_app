import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/place_order/data/data_source/place_order_remote_data_source.dart';
import 'package:bookia/features/place_order/data/models/governorates_response/governorates_response.dart';
import 'package:bookia/features/place_order/data/repo/place_order_repo.dart';
import 'package:dartz/dartz.dart';

class PlaceOrderRepoImpl extends PlaceOrderRepo {
  final PlaceOrderRemoteDataSource placeOrderRemoteDataSource;
  PlaceOrderRepoImpl({required this.placeOrderRemoteDataSource});

  @override
  Future<Either<Failure, GovernoratesResponse>> getGovernorates() async {
    return await placeOrderRemoteDataSource.getGovernorates();
  }

  @override
  Future<Either<Failure, bool>> placeOrder({
    required String name,
    required String email,
    required String address,
    required String phone,
    required int governorateId,
  }) async {
    return await placeOrderRemoteDataSource.placeOrder(
      name: name,
      email: email,
      address: address,
      phone: phone,
      governorateId: governorateId,
    );
  }
}
