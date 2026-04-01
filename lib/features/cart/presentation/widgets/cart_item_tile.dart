import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.item,
    this.onRemove,
    this.onUpdate,
  });

  final CartItem item;
  final Function()? onRemove;
  final Function(int)? onUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.itemProductImage ?? '',
                width: 100,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.itemProductName ?? '',
                          style: TextStyles.fs20.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: onRemove,
                        icon: SvgPicture.asset(AppIcons.close),
                      ),
                    ],
                  ),
                  const Gap(8),
                  Text(
                    item.itemProductPriceAfterDiscount != null
                        ? '\$${item.itemProductPriceAfterDiscount}'
                        : '\$${item.itemProductPrice}',
                    style: TextStyles.fs18.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(24),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          var quantity = (item.itemQuantity ?? 0);
                          if (quantity < (item.itemProductStock ?? 0)) {
                            var updateCount = quantity + 1;
                            onUpdate!(updateCount);
                          } else {
                            showAppSnackBar(
                              context,
                              "cannot_add_more_than".tr(
                                args: ["${item.itemProductStock}"],
                              ),
                              type: DialogType.error,
                            );
                          }
                        },
                        icon: SvgPicture.asset(
                          AppIcons.add,
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Gap(12),
                      Text(
                        '${item.itemQuantity}',
                        style: TextStyles.fs18.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(12),
                      IconButton(
                        onPressed: () {
                          var quantity = (item.itemQuantity ?? 0);
                          if (quantity > 1) {
                            var updateCount = quantity - 1;
                            onUpdate!(updateCount);
                          } else {
                            showAppSnackBar(
                              context,
                              "cannot_remove_less_than_1".tr(),
                              type: DialogType.error,
                            );
                          }
                        },
                        icon: SvgPicture.asset(
                          AppIcons.remove,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
