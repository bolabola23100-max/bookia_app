import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/features/details/presentation/widgets/cart_action/cubit/cart_action_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartAction extends StatelessWidget {
  const CartAction({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartActionCubit, CartActionState>(
      builder: (context, state) {
        var cubit = context.read<CartActionCubit>();
        return MainButton(
          onPressed: () {
            if (cubit.isProductInCart(id)) {
              showAppSnackBar(
                context,
                "product_already_in_cart".tr(),
                type: DialogType.success,
              );
            } else {
              cubit.addToCart(id);
            }
          },
          text: "add_to_cart".tr(),
          w: 180,
          h: 56,
          buttonColor: AppColors.dark,
        );
      },
    );
  }
}
