import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key, required this.product, this.onRefresh});

  final Product product;
  final Function()? onRefresh;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.details, extra: product).then((value) {
          onRefresh?.call();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGray,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: "image${product.id}",
                  child: Image.network(
                    product.image ?? "",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Gap(8),
            Text(
              product.name ?? "",
              style: TextStyles.fs14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(5),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "\$${product.price}",
                    style: TextStyles.fs14.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (product.id != null) {
                      context.read<WishlistCubit>().removeFromWishlist(
                        product.id!,
                      );
                    }
                  },
                  icon: Icon(Icons.delete_forever, color: AppColors.redColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
