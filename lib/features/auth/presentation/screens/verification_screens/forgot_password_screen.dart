import 'dart:developer';

import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_text_action.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AuthTextAction(
            text1: 'remember_password'.tr(),
            text2: "login".tr(),
            onPressed: () {
              pop(context);
            },
          ),
        ),
        appBar: AppBar(leading: CustomBackButton()),
        body: _forgotPassword(),
      ),
    );
  }

  Widget _forgotPassword() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          pop(context);
          pushTo(context, Routes.otp);
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
                Gap(30),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text("forgot_password".tr(), style: TextStyles.fs30),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                      "dont_worry_it_occurs_please_enter_the_email_address_linked_with_your_account".tr(),
                      style: TextStyles.fs16.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36),

                CustomTextFormField(
                  hintText: "enter_your_email".tr(),
                  controller: cubit.emailController,
                  validator: Validators().validatorEmail,
                ),
                SizedBox(height: 46),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MainButton(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.forgetPassword();
                      }
                    },
                    text: "send_code".tr(),
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
