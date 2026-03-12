import 'package:bookia/core/widgets/shimmer/book_cart_shimmer.dart';
import 'package:bookia/core/widgets/shimmer/shimmer_container.dart';
import 'package:flutter/material.dart';

class BestSellerShimmer extends StatelessWidget {
  const BestSellerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ShimmerContainer(width: 100, height: 30),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 250,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return const BookCartShimmer();
          },
        ),
      ],
    );
  }
}
