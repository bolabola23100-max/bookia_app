import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/features/details/presentation/cubit/details_cubit.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailsCubit, DetailsState>(
      listener: (context, state) {
        if (state is DetailsSuccessState) {
          pop(context);
          showAppSnackBar(
            context,
            "Added to wishlist",
            type: DialogType.success,
          );
        } else if (state is DetailsErrorState) {
          pop(context);
          showAppSnackBar(
            context,
            "Failed to add to wishlist",
            type: DialogType.error,
          );
        } else if (state is DetailsLoadingState) {
          showLoading(context);
        }
      },
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${product.price}", style: TextStyles.fs30),
              MainButton(
                onPressed: () {},
                text: "Add To Cart",
                w: 180,
                h: 56,
                buttonColor: AppColors.dark,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.centerLeft,
            child: CustomBackButton(),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.read<DetailsCubit>().addToWishlist(product.id ?? 0);
              },
              icon: SvgPicture.asset(AppIcons.bookmark),
            ),
          ],
        ),

        body: SingleChildScrollView(
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
    );
  }
}
