import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'wishlist_action_state.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  WishlistActionCubit() : super(WishlistActionInitialState());

  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var data = await getIt<AddToWishlistUseCase>().call(productId);
    data.fold(
      (l) {
        emit(WishlistActionErrorState());
      },
      (r) {
        try {
          var products = r.data?.data ?? [];
          SharedPref.cacheWishListIds(products);
          emit(WishlistActionSuccessState(message: "added_to_wishlist".tr()));
        } catch (e) {
          emit(WishlistActionErrorState());
        }
      },
    );
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var data = await getIt<RemoveFromWishlistUseCase>().call(productId);
    data.fold(
      (l) {
        emit(WishlistActionErrorState());
      },
      (r) {
        try {
          var products = r.data?.data ?? [];
          SharedPref.cacheWishListIds(products);
          emit(
            WishlistActionSuccessState(message: "removed_from_wishlist".tr()),
          );
        } catch (e) {
          emit(WishlistActionErrorState());
        }
      },
    );
  }

  bool isProductInWishlist(int productId) {
    var ids = SharedPref.getWishListIds();
    return ids.contains(productId);
  }
}
