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
            text1: 'Remember Password?',
            text2: "Login",
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

          showErrorDialog(context, state.message);
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
                    child: Text("Forgot Password?", style: TextStyles.fs30),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                      "Don't worry! It occurs. Please enter the email address linked with your account.",
                      style: TextStyles.fs16.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36),

                CustomTextFormField(
                  hintText: "Enter your email",
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
                    text: "Send Code",
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
