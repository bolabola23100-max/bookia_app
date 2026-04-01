import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/features/home/data/models/best_sellers_response/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.details, extra: product);
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
                  tag: product.id!,
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const Gap(5),
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.priceAfterDiscount != null
                        ? "\$${product.priceAfterDiscount}"
                        : "\$${product.price}",
                    style: TextStyles.fs14.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MainButton(
                  buttonColor: AppColors.dark,
                  onPressed: () {},
                  text: "buy".tr(),
                  borderRadius: 4,
                  w: 62,
                  h: 28,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
