import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/features/details/presentation/widgets/wishlist_action/cubit/wishlist_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WishlistAction extends StatelessWidget {
  const WishlistAction({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistActionCubit, WishlistActionState>(
      builder: (context, state) {
        var cubit = context.read<WishlistActionCubit>();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              if (cubit.isProductInWishlist(id)) {
                cubit.removeFromWishlist(id);
              } else {
                cubit.addToWishlist(id);
              }
            },
            icon: SvgPicture.asset(
              AppIcons.bookmark,
              colorFilter: ColorFilter.mode(
                cubit.isProductInWishlist(id)
                    ? AppColors.primaryColor
                    : AppColors.dark,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
      },
    );
  }
}
