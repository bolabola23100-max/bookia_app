import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;
  CartRepoImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, CartResponse>> getCart() async {
    return await cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failure, CartResponse>> addToCart(int productId) async {
    return await cartRemoteDataSource.addToCart(productId);
  }

  @override
  Future<Either<Failure, CartResponse>> removeFromCart(int cartItemId) async {
    return await cartRemoteDataSource.removeFromCart(cartItemId);
  }

  @override
  Future<Either<Failure, CartResponse>> updateCart(
    int cartItemId,
    int quantity,
  ) async {
    return await cartRemoteDataSource.updateCart(cartItemId, quantity);
  }
}
