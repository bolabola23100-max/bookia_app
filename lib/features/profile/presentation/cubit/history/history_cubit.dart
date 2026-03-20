import 'package:bookia/features/profile/data/model/order_history_response/order.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  List<Order> orders = [];

  Future<void> getOrderHistory() async {
    emit(GetOrderHistoryLoadingState());
    var response = await ProfileRepo().getOrderHistory();
    if (response != null && response.data != null) {
      orders = response.data!.orders ?? [];
      emit(GetOrderHistorySuccessState());
    } else {
      emit(GetOrderHistoryErrorState());
    }
  }
}
