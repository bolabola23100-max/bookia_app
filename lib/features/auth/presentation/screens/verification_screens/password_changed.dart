import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/features/auth/presentation/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Gap(240),
              SvgPicture.asset(AppIcons.successMark),
              Gap(35),
              Center(child: Text("Password Changed!", style: TextStyles.fs30)),
              Center(
                child: Text(
                  "Your password has been changed",
                  style: TextStyles.fs16.copyWith(color: AppColors.darkGray),
                ),
              ),
              Center(
                child: Text(
                  "successfully.",
                  style: TextStyles.fs16.copyWith(color: AppColors.darkGray),
                ),
              ),
              Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: MainButton(
                  onPressed: () {
                    pushReplacement(context, LoginScreen());
                  },
                  text: "Back to Login",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
