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
import 'package:easy_localization/easy_localization.dart';

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
          text1: 'dont_have_an_account'.tr(),
          text2: 'register_now'.tr(),
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
                  padding: const EdgeInsetsDirectional.only(start: 24, top: 15),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "welcome_back_glad_to_see_you_again".tr(),
                      style: TextStyles.fs20.copyWith(fontSize: 30),
                    ),
                  ),
                ),
                Gap(32),
                CustomTextFormField(
                  controller: cubit.emailController,
                  hintText: "email".tr(),
                  validator: Validators().validatorEmail,
                ),
                Gap(15),
                PasswordTextFormField(
                  text: 'password'.tr(),
                  controller: cubit.passwordController,
                  validator: Validators().validatorPassword,
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: TextButton(
                    style: TextButton.styleFrom(minimumSize: Size.zero),
                    onPressed: () {
                      pushTo(context, Routes.forgotPassword);
                    },
                    child: Text(
                      "forgot_password".tr(),
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
                    text: "login".tr(),
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
                      "or".tr(),
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
                        text: "sign_in_with_google".tr(),
                        borderRadius: 10,
                        textColor: AppColors.darkGray,
                        buttonColor: AppColors.bgColor,
                        sideColor: AppColors.darkGray,
                        icon: AppIcons.google,
                      ),
                      Gap(15),

                      MainButton(
                        onPressed: () {},
                        text: "sign_in_with_apple".tr(),
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
