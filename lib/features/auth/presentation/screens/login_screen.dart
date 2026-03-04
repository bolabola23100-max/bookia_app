import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/functions/validation.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/core/widgets/inputs/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/screens/register_screen.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/forgot_password_screen.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_text_action.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AuthTextAction(
        text1: 'Don\'t have an account? ',
        text2: 'Register Now',
        onPressed: () {
          pushTo(context, RegisterScreen());
        },
      ),
      appBar: AppBar(leading: CustomBackButton()),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 15),
                child: Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: Text(
                    "Welcome back! Glad!\n to see you, Again!",
                    style: TextStyles.fs20.copyWith(fontSize: 30),
                  ),
                ),
              ),
              Gap(32),
              CustomTextFormField(
                hintText: "Enter your email",
                validator: (value) {
                  {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    } else if (!isEmailValid(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  }
                },
              ),
              Gap(15),
              PasswordTextFormField(
                text: 'Password',
                controller: TextEditingController(),
                validator: (input) {
                  if (input!.isEmpty) {
                    return "Please enter your password";
                  } else if (input.length < 6) {
                    return "Password must be at least 6 characters";
                  } else if (!isPassword(input)) {
                    return "Password must contain at least one uppercase letter and one number";
                  }
                  return null;
                },
              ),
              Align(
                alignment: AlignmentGeometry.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(minimumSize: Size.zero),
                  onPressed: () {
                    pushTo(context, ForgotPasswordScreen());
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyles.fs14.copyWith(color: AppColors.darkGray),
                  ),
                ),
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MainButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  text: "LogIn",
                ),
              ),
              Gap(20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(20),

                  Expanded(child: Divider(color: AppColors.border)),
                  Gap(45),
                  Text(
                    "Or",
                    style: TextStyles.fs14.copyWith(color: AppColors.darkGray),
                  ),
                  Gap(45),

                  Expanded(child: Divider(color: AppColors.border)),
                  Gap(20),
                ],
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    MainButton(
                      onPressed: () {},
                      text: "Sign in with Google",
                      borderRadius: 10,
                      textColor: AppColors.darkGray,
                      buttonColor: AppColors.bgColor,
                      sideColor: AppColors.darkGray,
                      icon: AppIcons.google,
                    ),
                    Gap(15),

                    MainButton(
                      onPressed: () {},
                      text: "Sign in with Apple",
                      borderRadius: 10,
                      textColor: AppColors.darkGray,
                      buttonColor: AppColors.bgColor,
                      sideColor: AppColors.darkGray,
                      icon: AppIcons.apple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
