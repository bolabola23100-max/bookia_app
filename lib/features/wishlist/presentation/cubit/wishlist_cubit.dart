import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:bookia/features/wishlist/domain/usecases/get_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  List<Product> products = [];
  WishlistCubit() : super(WishlistInitialState());

  Future<void> getWishlist() async {
    emit(WishlistLoadingState());
    var data = await getIt<GetWishlistUseCase>().call();
    data.fold(
      (l) {
        emit(WishlistErrorState());
      },
      (r) {
        products = r.data!.data ?? [];
        SharedPref.cacheWishListIds(products);
        emit(WishlistSuccessState());
      },
    );
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistLoadingState());
    var data = await getIt<RemoveFromWishlistUseCase>().call(productId);
    data.fold(
      (l) {
        emit(WishlistErrorState());
      },
      (r) {
        products = r.data!.data ?? [];
        SharedPref.cacheWishListIds(products);
        emit(WishlistSuccessState());
      },
    );
  }
}
