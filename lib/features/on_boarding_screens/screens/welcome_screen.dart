import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //* bg image *//
          Image.asset(
            AppIcons.bgImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 0,
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 2),
                  SvgPicture.asset(AppIcons.logo),
                  Gap(28),
                  Text("order_your_book_now".tr(), style: TextStyles.fs20),
                  Spacer(flex: 3),
                  MainButton(
                    onPressed: () {
                      pushTo(context, Routes.login);
                    },
                    text: "login".tr(),
                    borderRadius: 10,
                  ),
                  SizedBox(height: 20),
                  MainButton(
                    onPressed: () {
                      // pushTo(context, RegisterScreen());
                      pushTo(context, Routes.register);
                    },
                    text: "register".tr(),
                    borderRadius: 10,
                    textColor: AppColors.dark,
                    buttonColor: AppColors.bgColor,
                    sideColor: AppColors.dark,
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
