import 'package:bookia/features/place_order/data/models/governorates_response/governorate.dart';
import 'package:bookia/features/place_order/data/repo/place_order_repo.dart';
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
    var response = await PlaceOrderRepo.getGovernorates();
    if (response != null && response.data != null) {
      governorates = response.data!;
      emit(GetGovernoratesSuccessState());
    } else {
      emit(GetGovernoratesErrorState());
    }
  }

  Future<void> placeOrder() async {
    if (selectedGovernorateId == null) {
      emit(PlaceOrderErrorState());
      return;
    }

    emit(PlaceOrderLoadingState());
    var success = await PlaceOrderRepo.placeOrder(
      name: nameController.text,
      email: emailController.text,
      address: addressController.text,
      phone: phoneController.text,
      governorateId: selectedGovernorateId!,
    );

    if (success) {
      emit(PlaceOrderSuccessState());
    } else {
      emit(PlaceOrderErrorState());
    }
  }
}
