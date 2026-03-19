import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_cubit.dart';
import 'package:bookia/features/place_order/presentation/widgets/place_order_bottom_nav_widget.dart';
import 'package:bookia/features/place_order/presentation/widgets/place_order_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookia/core/routes/routes.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaceOrderCubit, PlaceOrderState>(
      listener: (context, state) {
        if (state is PlaceOrderSuccessState) {
          pop(context);
          pushTo(context, Routes.success);
        } else if (state is PlaceOrderErrorState) {
          pop(context);
          showAppSnackBar(
            context,
            "Place Order failed, please try again",
            type: DialogType.error,
          );
        } else if (state is PlaceOrderLoadingState) {
          showLoading(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const PlaceOrderBottomNavWidget(),
          appBar: AppBar(elevation: 0, leading: const CustomBackButton()),
          body: const SafeArea(
            child: SingleChildScrollView(
              child: PlaceOrderFormWidget(),
            ),
          ),
        );
      },
    );
  }
}
