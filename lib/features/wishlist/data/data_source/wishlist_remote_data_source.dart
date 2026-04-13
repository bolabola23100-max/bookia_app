import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/wishlist/data/models/wishlist_response/wishlist_response.dart';
import 'package:dartz/dartz.dart';

abstract class WishlistRemoteDataSource {
  Future<Either<Failure, WishlistResponse>> getWishlist();
  Future<Either<Failure, WishlistResponse>> addToWishlist(int productId);
  Future<Either<Failure, WishlistResponse>> removeFromWishlist(int productId);
}
