import 'dart:developer';

import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
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

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        bottomNavigationBar: AuthTextAction(
          text1: "already_have_an_account".tr(),
          text2: "login_now".tr(),
          onPressed: () {
            pop(context);
          },
        ),
        appBar: AppBar(leading: CustomBackButton()),
        body: _registerBody(),
      ),
    );
  }

  Widget _registerBody() {
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
                Gap(28),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 24),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "hello_register_to_get_started".tr(),
                      style: TextStyles.fs30,
                    ),
                  ),
                ),
                Gap(32),

                CustomTextFormField(
                  controller: cubit.usernameController,
                  hintText: 'username'.tr(),
                  validator: Validators().validatorName,
                ),
                Gap(11),

                CustomTextFormField(
                  controller: cubit.emailController,
                  hintText: "email".tr(),
                  validator: Validators().validatorEmail,
                ),
                Gap(11),

                PasswordTextFormField(
                  controller: cubit.passwordController,
                  text: 'password'.tr(),
                  validator: Validators().validatorPassword,
                ),

                Gap(12),
                PasswordTextFormField(
                  controller: cubit.confirmPasswordController,
                  text: 'confirm_password'.tr(),
                  validator: (input) => Validators().validatorConfirmPassword(
                    input,
                    cubit.passwordController.text,
                  ),
                ),
                Gap(30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: MainButton(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.register();
                      }
                    },
                    text: "register".tr(),
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
