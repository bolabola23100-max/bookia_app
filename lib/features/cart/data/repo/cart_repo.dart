import 'package:bookia/core/services/dio/api/get_api.dart';
import 'package:bookia/core/services/dio/api/post_api.dart';
import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:dartz/dartz.dart';

class CartRepo {
  Future<Either<Failure, CartResponse>> getCart() async {
    var response = await GetApi.getApi(
      endpoint: Apis.cart,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        var data = CartResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }

  Future<Either<Failure, CartResponse>> addToCart(int productId) async {
    var response = await PostApi.postApi(
      endpoint: Apis.addToCart,
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        var data = CartResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }

  Future<Either<Failure, CartResponse>> removeFromCart(int cartItemId) async {
    var response = await PostApi.postApi(
      endpoint: Apis.removeFromCart,
      data: {"cart_item_id": cartItemId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        var data = CartResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }

  Future<Either<Failure, CartResponse>> updateCart(
    int cartItemId,
    int quantity,
  ) async {
    var response = await PostApi.postApi(
      endpoint: Apis.updateCart,
      data: {"cart_item_id": cartItemId, "quantity": quantity},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        var data = CartResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }
}
