import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class GetCartUseCase {
  final CartRepo cartRepo;
  GetCartUseCase(this.cartRepo);
  Future<Either<Failure, CartResponse>> call() async {
    return await cartRepo.getCart();
  }
}
