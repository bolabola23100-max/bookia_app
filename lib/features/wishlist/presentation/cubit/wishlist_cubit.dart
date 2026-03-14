import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  List<Product> products = [];
  WishlistCubit() : super(WishlistInitialState());
  Future<void> getWishlist() async {
    emit(WishlistLoadingState());
    var data = await WishlistRepo().getWishlist();
    if (data != null) {
      products = data.data!.data ?? [];
      emit(WishlistSuccessState());
    } else {
      emit(WishlistErrorState());
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistLoadingState());
    var data = await WishlistRepo().removeFromWishlist(productId);
    if (data != null) {
      products = data.data!.data ?? [];
      emit(WishlistSuccessState());
    } else {
      emit(WishlistErrorState());
    }
  }
}
