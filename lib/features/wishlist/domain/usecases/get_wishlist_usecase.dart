import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/wishlist/data/models/wishlist_response/wishlist_response.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';

class GetWishlistUseCase {
  final WishlistRepo wishlistRepo;
  GetWishlistUseCase(this.wishlistRepo);
  Future<Either<Failure, WishlistResponse>> call() async {
    return await wishlistRepo.getWishlist();
  }
}
