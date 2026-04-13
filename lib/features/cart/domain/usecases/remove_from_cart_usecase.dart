import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class RemoveFromCartUseCase {
  final CartRepo cartRepo;
  RemoveFromCartUseCase(this.cartRepo);
  Future<Either<Failure, CartResponse>> call(int cartItemId) async {
    return await cartRepo.removeFromCart(cartItemId);
  }
}
