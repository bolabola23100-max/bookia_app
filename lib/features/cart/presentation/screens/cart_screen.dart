import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          var cubit = context.read<CartCubit>();
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'total'.tr(),
                      style: TextStyles.fs20.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                    Text("\$${cubit.total}", style: TextStyles.fs20),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainButton(
                  onPressed: () {
                    pushTo(context, Routes.checkout);
                  },
                  text: 'checkout'.tr(),
                  borderRadius: 5,
                ),
              ),
            ],
          );
        },
      ),
      appBar: AppBar(title: Center(child: Text('my_cart'.tr()))),
      body: CartItemWidget(),
    );
  }
}
