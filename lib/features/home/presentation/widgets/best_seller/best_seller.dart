import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/shimmer/best_seller_shimmer.dart';
import 'package:bookia/core/widgets/shimmer/shimmer_container.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller/book_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          var products = context.read<HomeCubit>().products;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text("best_seller".tr(), style: TextStyles.fs20),
              ),

              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 250,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return BookCard(product: products[index]);
                },
              ),
            ],
          );
        } else if (state is HomeErrorState) {
          return Text("error".tr());
        } else {
          return BestSellerShimmer(
            sh: ShimmerContainer(width: 100, height: 30),
          );
        }
      },
    );
  }
}
