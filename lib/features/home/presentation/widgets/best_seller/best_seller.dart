import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/shimmer/best_seller_shimmer.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller/book_cart.dart';
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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Best Seller", style: TextStyles.fs20),
                ),
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
                  return BookCart(product: products[index]);
                },
              ),
            ],
          );
        } else if (state is HomeErrorState) {
          return const Text("error");
        } else {
          return const BestSellerShimmer();
        }
      },
    );
  }
}
