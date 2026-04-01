import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/features/details/presentation/widgets/cart_action/cart_action.dart';
import 'package:bookia/features/details/presentation/widgets/cart_action/cubit/cart_action_cubit.dart';
import 'package:bookia/features/details/presentation/widgets/wishlist_action/cubit/wishlist_action_cubit.dart';
import 'package:bookia/features/details/presentation/widgets/wishlist_action/wishlist_action.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WishlistActionCubit, WishlistActionState>(
          listener: (context, state) {
            if (state is WishlistActionSuccessState) {
              context.read<WishlistCubit>().getWishlist();
              pop(context);
              showAppSnackBar(context, state.message, type: DialogType.success);
            } else if (state is WishlistActionErrorState) {
              pop(context);
              showAppSnackBar(
                context,
                "failed_to_add_to_wishlist".tr(),
                type: DialogType.error,
              );
            } else if (state is WishlistActionLoadingState) {
              showLoading(context);
            }
          },
        ),
        BlocListener<CartActionCubit, CartActionState>(
          listener: (context, state) {
            if (state is CartActionSuccessState) {
              context.read<CartCubit>().getCart();
              pop(context);
              showAppSnackBar(context, state.message, type: DialogType.success);
            } else if (state is CartActionErrorState) {
              pop(context);
              showAppSnackBar(
                context,
                "failed_to_add_to_cart".tr(),
                type: DialogType.error,
              );
            } else if (state is CartActionLoadingState) {
              showLoading(context);
            }
          },
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.priceAfterDiscount != null
                    ? "\$${product.priceAfterDiscount}"
                    : "\$${product.price}",
                style: TextStyles.fs30,
              ),
              CartAction(id: product.id ?? 0),
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const CustomBackButton(),
          actions: [WishlistAction(id: product.id ?? 0)],
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(30),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: "image${product.id}",
                      child: Image.network(
                        product.image ?? "",
                        width: 183,
                        height: 271,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Gap(11),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    product.name ?? "",
                    style: TextStyles.fs30,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    product.category ?? "",
                    style: TextStyles.fs14.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    (product.description ?? "").replaceAll(
                      RegExp(r'<[^>]*>'),
                      '',
                    ),
                    style: TextStyles.fs14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
