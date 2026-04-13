import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_action_state.dart';

class CartActionCubit extends Cubit<CartActionState> {
  CartActionCubit() : super(CartActionInitialState());

  Future<void> addToCart(int productId) async {
    emit(CartActionLoadingState());
    var data = await getIt<AddToCartUseCase>().call(productId);
    data.fold(
      (l) {
        emit(CartActionErrorState());
      },
      (r) {
        try {
          var products = r.data?.cartItems ?? [];
          SharedPref.cacheCartItems(products);
          emit(CartActionSuccessState(message: "added_to_cart".tr()));
        } catch (e) {
          emit(CartActionErrorState());
        }
      },
    );
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(CartActionLoadingState());
    var data = await getIt<RemoveFromCartUseCase>().call(cartItemId);
    data.fold(
      (l) {
        emit(CartActionErrorState());
      },
      (r) {
        try {
          var products = r.data?.cartItems ?? [];
          SharedPref.cacheCartItems(products);
          emit(CartActionSuccessState(message: "removed_from_cart".tr()));
        } catch (e) {
          emit(CartActionErrorState());
        }
      },
    );
  }

  bool isProductInCart(int productId) {
    var ids = SharedPref.getCartItemsIds();
    return ids.contains(productId);
  }
}
