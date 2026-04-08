import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<CartItem> products = [];
  String total = "";
  CartCubit() : super(CartInitialState());

  Future<void> getCart() async {
    emit(CartLoadingState());
    var data = await CartRepo().getCart();
    data.fold(
      (l) {
        emit(CartErrorState());
      },
      (r) {
        products = r.data!.cartItems ?? [];
        total = r.data?.total?.toString() ?? "";
        SharedPref.cacheCartItems(products);
        emit(CartSuccessState());
      },
    );
  }

  Future<void> removeFromCart(int cartItemId) async {
    var data = await CartRepo().removeFromCart(cartItemId);
    data.fold(
      (l) {
        emit(CartErrorState());
      },
      (r) {
        products = r.data!.cartItems ?? [];
        total = r.data?.total?.toString() ?? "";
        SharedPref.cacheCartItems(products);
        emit(CartSuccessState());
      },
    );
  }

  Future<void> updateCart(int cartItemId, int quantity) async {
    var data = await CartRepo().updateCart(cartItemId, quantity);
    data.fold(
      (l) {
        emit(CartErrorState());
      },
      (r) {
      products = r.data!.cartItems ?? [];
      total = r.data?.total?.toString() ?? "";
      SharedPref.cacheCartItems(products);

      emit(CartSuccessState());
    }
 );
 }
}
