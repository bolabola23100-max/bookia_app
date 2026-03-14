part of 'wishlist_cubit.dart';

sealed class WishlistState {}

final class WishlistInitialState extends WishlistState {}

final class WishlistLoadingState extends WishlistState {}

final class WishlistSuccessState extends WishlistState {}

final class WishlistErrorState extends WishlistState {}
