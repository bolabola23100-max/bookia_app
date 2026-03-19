import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_action_state.dart';

class CartActionCubit extends Cubit<CartActionState> {
  CartActionCubit() : super(CartActionInitialState());
  Future<void> addToCart(int productId) async {
    emit(CartActionLoadingState());
    var data = await CartRepo().addToCart(productId);
    if (data != null) {
      var products = data.data!.cartItems ?? [];
      SharedPref.cacheCartItems(products);

      emit(CartActionSuccessState(message: "Added to Cart"));
    } else {
      emit(CartActionErrorState());
    }
  }

  Future<void> removeFromCart(int productId) async {
    emit(CartActionLoadingState());
    var data = await CartRepo().removeFromCart(productId);
    if (data != null) {
      var products = data.data!.cartItems ?? [];
      SharedPref.cacheCartItems(products);

      emit(CartActionSuccessState(message: "Removed from Cart"));
    } else {
      emit(CartActionErrorState());
    }
  }

  bool isProductInCart(int productId) {
    var ids = SharedPref.getCartItemsIds();
    return ids.contains(productId);
  }
}
