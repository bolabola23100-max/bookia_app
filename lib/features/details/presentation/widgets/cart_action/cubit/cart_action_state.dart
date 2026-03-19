part of 'cart_action_cubit.dart';

sealed class CartActionState {}

final class CartActionInitialState extends CartActionState {}

final class CartActionLoadingState extends CartActionState {}

final class CartActionSuccessState extends CartActionState {
  final String message;
  CartActionSuccessState({required this.message});
}

final class CartActionErrorState extends CartActionState {}
