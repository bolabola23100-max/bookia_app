import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PlaceOrderBottomNavWidget extends StatelessWidget {
  const PlaceOrderBottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = PlaceOrderCubit.get(context);
    var cartCubit = context.read<CartCubit>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'total'.tr(),
                        style: TextStyles.fs20.copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                      Text('\$${cartCubit.total}', style: TextStyles.fs20),
                    ],
                  ),
                );
              },
            ),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MainButton(
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.placeOrder();
                  }
                },
                text: 'submit_order'.tr(),
                borderRadius: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
