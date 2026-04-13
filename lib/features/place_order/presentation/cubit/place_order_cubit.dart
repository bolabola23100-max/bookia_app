import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/features/place_order/data/models/governorates_response/governorate.dart';
import 'package:bookia/features/place_order/domain/usecases/get_governorates_usecase.dart';
import 'package:bookia/features/place_order/domain/usecases/place_order_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderInitial());

  static PlaceOrderCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final governorateController = TextEditingController();

  List<Governorate> governorates = [];
  int? selectedGovernorateId;

  Future<void> getGovernorates() async {
    emit(GetGovernoratesLoadingState());
    var response = await getIt<GetGovernoratesUseCase>().call();
    response.fold(
      (l) {
        emit(GetGovernoratesErrorState());
      },
      (r) {
        governorates = r.data ?? [];
        emit(GetGovernoratesSuccessState());
      },
    );
  }

  Future<void> placeOrder() async {
    if (selectedGovernorateId == null) {
      emit(PlaceOrderErrorState());
      return;
    }

    emit(PlaceOrderLoadingState());
    var success = await getIt<PlaceOrderUseCase>().call(
      name: nameController.text,
      email: emailController.text,
      address: addressController.text,
      phone: phoneController.text,
      governorateId: selectedGovernorateId!,
    );

    success.fold(
      (l) {
        emit(PlaceOrderErrorState());
      },
      (r) {
        emit(PlaceOrderSuccessState());
      },
    );
  }
}
