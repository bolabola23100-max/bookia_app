import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/features/profile/data/model/order_history_response/order.dart';
import 'package:bookia/features/profile/domain/usecases/get_order_history_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  List<Order> orders = [];

  Future<void> getOrderHistory() async {
    emit(GetOrderHistoryLoadingState());
    var response = await getIt<GetOrderHistoryUseCase>().call();
    response.fold(
      (l) {
        emit(GetOrderHistoryErrorState());
      },
      (r) {
        orders = r.data!.orders ?? [];
        emit(GetOrderHistorySuccessState());
      },
    );
  }
}
