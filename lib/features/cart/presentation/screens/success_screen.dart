import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.successMark, width: 120),
              const Gap(30),
              Text(
                'success'.tr(),
                style: TextStyles.fs30.copyWith(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              Text(
                'your_order_will_be_delivered_soon'.tr(),
                style: TextStyles.fs16.copyWith(color: AppColors.darkGray),
              ),
              const Gap(5),
              Text(
                'thank_you_for_choosing_our_app'.tr(),
                style: TextStyles.fs16.copyWith(color: AppColors.darkGray),
              ),
              const Gap(20),
              MainButton(
                onPressed: () {
                  context.go(Routes.mainAppScreen);
                },
                text: 'back_to_home'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
