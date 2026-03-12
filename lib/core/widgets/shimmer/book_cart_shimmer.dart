import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/shimmer/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCartShimmer extends StatelessWidget {
  const BookCartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentColor,
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ShimmerContainer(
              width: double.infinity,
              height: double.infinity,
              borderRadius: 10,
            ),
          ),
          Gap(8),
          ShimmerContainer(width: 100, height: 14, borderRadius: 4),
          Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerContainer(width: 40, height: 14, borderRadius: 4),
              ShimmerContainer(width: 62, height: 28, borderRadius: 4),
            ],
          ),
        ],
      ),
    );
  }
}
