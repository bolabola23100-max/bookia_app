import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/place_order/data/models/governorates_response/governorates_response.dart';
import 'package:bookia/features/place_order/data/repo/place_order_repo.dart';
import 'package:dartz/dartz.dart';

class GetGovernoratesUseCase {
  final PlaceOrderRepo placeOrderRepo;
  GetGovernoratesUseCase(this.placeOrderRepo);
  Future<Either<Failure, GovernoratesResponse>> call() async {
    return await placeOrderRepo.getGovernorates();
  }
}
