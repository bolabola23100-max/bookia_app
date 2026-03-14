import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitialState());
  Future<void> addToWishlist(int productId) async {
    emit(DetailsLoadingState());
    var data = await WishlistRepo().addToWishlist(productId);
    if (data != null) {
      var products = data.data!.data ?? [];
      SharedPref.cacheWishListIds(products);

      emit(DetailsSuccessState(message: "Added to wishlist"));
    } else {
      emit(DetailsErrorState());
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(DetailsLoadingState());
    var data = await WishlistRepo().removeFromWishlist(productId);
    if (data != null) {
      var products = data.data!.data ?? [];
      SharedPref.cacheWishListIds(products);

      emit(DetailsSuccessState(message: "Removed from wishlist"));
    } else {
      emit(DetailsErrorState());
    }
  }

  bool isProductInWishlist(int productId) {
    var ids = SharedPref.getWishListIds();
    return ids.contains(productId);
  }
}
