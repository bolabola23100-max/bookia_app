part of 'wishlist_action_cubit.dart';

sealed class WishlistActionState {}

final class WishlistActionInitialState extends WishlistActionState {}

final class WishlistActionLoadingState extends WishlistActionState {}

final class WishlistActionSuccessState extends WishlistActionState {
  final String message;
  WishlistActionSuccessState({required this.message});
}

final class WishlistActionErrorState extends WishlistActionState {}
