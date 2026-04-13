import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:bookia/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/update_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<CartItem> products = [];
  String total = "";
  CartCubit() : super(CartInitialState());

  Future<void> getCart() async {
    emit(CartLoadingState());
    var data = await getIt<GetCartUseCase>().call();
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
    var data = await getIt<RemoveFromCartUseCase>().call(cartItemId);
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
    var data = await getIt<UpdateCartUseCase>().call(cartItemId, quantity);
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
}
