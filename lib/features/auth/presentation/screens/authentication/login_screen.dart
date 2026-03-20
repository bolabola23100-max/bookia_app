import 'dart:developer';

import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/routes/routes.dart';

import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/core/widgets/inputs/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_text_action.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        bottomNavigationBar: AuthTextAction(
          text1: 'Don\'t have an account? ',
          text2: 'Register Now',
          onPressed: () {
            pushTo(context, Routes.register);
          },
        ),
        appBar: AppBar(leading: CustomBackButton()),
        body: _loginBody(),
      ),
    );
  }

  Widget _loginBody() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          pop(context);
          context.go(Routes.mainAppScreen);
          log("success");
        } else if (state is AuthErrorState) {
          pop(context);
          showAppSnackBar(context, state.message);
        } else if (state is AuthLoadingState) {
          showLoading(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
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
                  controller: cubit.emailController,
                  hintText: "Enter your email",
                  validator: Validators().validatorEmail,
                ),
                Gap(15),
                PasswordTextFormField(
                  text: 'Password',
                  controller: cubit.passwordController,
                  validator: Validators().validatorPassword,
                ),
                Align(
                  alignment: AlignmentGeometry.topRight,
                  child: TextButton(
                    style: TextButton.styleFrom(minimumSize: Size.zero),
                    onPressed: () {
                      pushTo(context, Routes.forgotPassword);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyles.fs14.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MainButton(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.login();
                      }
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
                      style: TextStyles.fs14.copyWith(
                        color: AppColors.darkGray,
                      ),
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
        );
      },
    );
  }
}
