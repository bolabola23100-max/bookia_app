import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class AddToCartUseCase {
  final CartRepo cartRepo;
  AddToCartUseCase(this.cartRepo);
  Future<Either<Failure, CartResponse>> call(int productId) async {
    return await cartRepo.addToCart(productId);
  }
}
