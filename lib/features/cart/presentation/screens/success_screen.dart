import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
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
                'SUCCESS!',
                style: TextStyles.fs30.copyWith(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              Text(
                'Your order will be delivered soon.',
                style: TextStyles.fs16.copyWith(color: AppColors.darkGray),
              ),
              const Gap(5),
              Text(
                'Thank you for choosing our app!',
                style: TextStyles.fs16.copyWith(color: AppColors.darkGray),
              ),
              const Gap(20),
              MainButton(
                onPressed: () {
                  context.go(Routes.mainAppScreen);
                },
                text: 'Back To Home',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
