import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateCartUseCase {
  final CartRepo cartRepo;
  UpdateCartUseCase(this.cartRepo);
  Future<Either<Failure, CartResponse>> call(int cartItemId, int quantity) async {
    return await cartRepo.updateCart(cartItemId, quantity);
  }
}
