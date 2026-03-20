part of 'history_cubit.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class GetOrderHistoryLoadingState extends HistoryState {}

class GetOrderHistorySuccessState extends HistoryState {}

class GetOrderHistoryErrorState extends HistoryState {}
