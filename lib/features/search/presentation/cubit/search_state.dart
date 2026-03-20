part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitialState extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchSuccessState extends SearchState {final List<dynamic> products; // خليها dynamic زي ما هي في الـ Model
  SearchSuccessState({required this.products});}

final class SearchErrorState extends SearchState {}
