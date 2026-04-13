import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:dartz/dartz.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failure, CartResponse>> getCart();
  Future<Either<Failure, CartResponse>> addToCart(int productId);
  Future<Either<Failure, CartResponse>> removeFromCart(int cartItemId);
  Future<Either<Failure, CartResponse>> updateCart(int cartItemId, int quantity);
}
