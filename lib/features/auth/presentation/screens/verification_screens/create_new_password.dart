import 'dart:developer';

import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/core/widgets/inputs/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({
    super.key,
    required this.email,
    required this.otpCode,
  });
  final String email;
  final String otpCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = AuthCubit();
        cubit.emailController.text = email;
        cubit.pinController.text = otpCode;
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(leading: CustomBackButton()),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              pop(context);
              context.pushReplacement(Routes.passwordChanged);
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
                      padding: const EdgeInsets.only(left: 24),
                      child: Align(
                        alignment: AlignmentGeometry.topLeft,
                        child: Text(
                          "create_new_password".tr(),
                          style: TextStyles.fs30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Text(
                        "your_new_password_must_be_unique_from_those_previously_used"
                            .tr(),
                        style: TextStyles.fs16.copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                    ),
                    Gap(32),

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
                      validator: (input) =>
                          Validators().validatorConfirmPassword(
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
                            cubit.createNewPassword();
                          }
                        },
                        text: "reset_password".tr(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
