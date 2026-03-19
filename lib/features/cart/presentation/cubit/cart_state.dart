part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartSuccessState extends CartState {}

final class CartErrorState extends CartState {}
