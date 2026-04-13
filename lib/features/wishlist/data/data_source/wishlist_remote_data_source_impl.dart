import 'package:bookia/core/services/dio/api/get_api.dart';
import 'package:bookia/core/services/dio/api/post_api.dart';
import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:bookia/features/wishlist/data/models/wishlist_response/wishlist_response.dart';
import 'package:dartz/dartz.dart';

class WishlistRemoteDataSourceImpl extends WishlistRemoteDataSource {
  @override
  Future<Either<Failure, WishlistResponse>> getWishlist() async {
    var response = await GetApi.getApi(
      endpoint: Apis.wishlist,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (r) {
        var data = WishlistResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, WishlistResponse>> addToWishlist(int productId) async {
    var response = await PostApi.postApi(
      endpoint: Apis.addToWishlist,
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (r) {
        var data = WishlistResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, WishlistResponse>> removeFromWishlist(
    int productId,
  ) async {
    var response = await PostApi.postApi(
      endpoint: Apis.removeFromWishlist,
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
    return response.fold(
      (l) => Left(l),
      (r) {
        var data = WishlistResponse.fromJson({'data': r});
        return Right(data);
      },
    );
  }
}
