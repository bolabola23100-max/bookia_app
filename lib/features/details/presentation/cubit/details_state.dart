part of 'details_cubit.dart';

sealed class DetailsState {}

final class DetailsInitialState extends DetailsState {}

final class DetailsLoadingState extends DetailsState {}

final class DetailsSuccessState extends DetailsState {
  final String message;
  DetailsSuccessState({required this.message});
}

final class DetailsErrorState extends DetailsState {
}
