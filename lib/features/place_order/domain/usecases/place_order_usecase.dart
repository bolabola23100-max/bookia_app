import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/place_order/data/repo/place_order_repo.dart';
import 'package:dartz/dartz.dart';

class PlaceOrderUseCase {
  final PlaceOrderRepo placeOrderRepo;
  PlaceOrderUseCase(this.placeOrderRepo);
  Future<Either<Failure, bool>> call({
    required String name,
    required String email,
    required String address,
    required String phone,
    required int governorateId,
  }) async {
    return await placeOrderRepo.placeOrder(
      name: name,
      email: email,
      address: address,
      phone: phone,
      governorateId: governorateId,
    );
  }
}
