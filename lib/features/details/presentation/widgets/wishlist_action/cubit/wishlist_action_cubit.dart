import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'wishlist_action_state.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  WishlistActionCubit() : super(WishlistActionInitialState());
  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var data = await WishlistRepo().addToWishlist(productId);
    if (data != null) {
      var products = data.data!.data ?? [];
      SharedPref.cacheWishListIds(products);

      emit(WishlistActionSuccessState(message: "Added to wishlist"));
    } else {
      emit(WishlistActionErrorState());
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var data = await WishlistRepo().removeFromWishlist(productId);
    if (data != null) {
      var products = data.data!.data ?? [];
      SharedPref.cacheWishListIds(products);

      emit(WishlistActionSuccessState(message: "Removed from wishlist"));
    } else {
      emit(WishlistActionErrorState());
    }
  }

  bool isProductInWishlist(int productId) {
    var ids = SharedPref.getWishListIds();
    return ids.contains(productId);
  }
}
