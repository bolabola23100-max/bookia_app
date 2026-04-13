import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/wishlist/data/models/wishlist_response/wishlist_response.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';

class AddToWishlistUseCase {
  final WishlistRepo wishlistRepo;
  AddToWishlistUseCase(this.wishlistRepo);
  Future<Either<Failure, WishlistResponse>> call(int productId) async {
    return await wishlistRepo.addToWishlist(productId);
  }
}
