import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/core/widgets/inputs/password_text_form_field.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileCubit>();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const CustomBackButton(),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            Navigator.pop(context);
            showAppSnackBar(
              context,
              'new_password_success'.tr(),
              type: DialogType.success,
            );
            pop(context);
          } else if (state is ChangePasswordErrorState) {
            Navigator.pop(context);
            showAppSnackBar(context, 'new_password_error'.tr());
          } else if (state is ChangePasswordLoadingState) {
            showLoading(context);
          }
        },
        builder: (context, state) {
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(40),
                        Center(
                          child: Text(
                            'new_password'.tr(),
                            style: TextStyles.fs30,
                          ),
                        ),
                        const Gap(40),
                        PasswordTextFormField(
                          text: 'current_password'.tr(),
                          controller: cubit.currentPasswordController,
                          validator: Validators().validatorPassword,
                        ),
                        const Gap(16),
                        PasswordTextFormField(
                          text: 'new_password'.tr(),
                          controller: cubit.newPasswordController,
                          validator: Validators().validatorPassword,
                        ),
                        const Gap(16),
                        PasswordTextFormField(
                          text: 'confirm_password'.tr(),
                          controller: cubit.confirmPasswordController,
                          validator: (input) =>
                              Validators().validatorConfirmPassword(
                                input,
                                cubit.newPasswordController.text,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: MainButton(
                    text: 'update_password'.tr(),
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.submitNewPassword();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
