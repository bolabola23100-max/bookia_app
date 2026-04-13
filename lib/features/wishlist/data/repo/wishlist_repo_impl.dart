import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:bookia/features/wishlist/data/models/wishlist_response/wishlist_response.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';

class WishlistRepoImpl extends WishlistRepo {
  final WishlistRemoteDataSource wishlistRemoteDataSource;
  WishlistRepoImpl({required this.wishlistRemoteDataSource});

  @override
  Future<Either<Failure, WishlistResponse>> getWishlist() async {
    return await wishlistRemoteDataSource.getWishlist();
  }

  @override
  Future<Either<Failure, WishlistResponse>> addToWishlist(int productId) async {
    return await wishlistRemoteDataSource.addToWishlist(productId);
  }

  @override
  Future<Either<Failure, WishlistResponse>> removeFromWishlist(
    int productId,
  ) async {
    return await wishlistRemoteDataSource.removeFromWishlist(productId);
  }
}
