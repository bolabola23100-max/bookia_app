import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/core/widgets/inputs/password_text_form_field.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/features/profile/presentation/cubit/profile/profile_cubit.dart';
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
              'Password Updated Successfully',
              type: DialogType.success,
            );
            pop(context);
          } else if (state is ChangePasswordErrorState) {
            Navigator.pop(context);
            showAppSnackBar(context, 'Failed to update password');
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
                        const Center(
                          child: Text('New Password', style: TextStyles.fs30),
                        ),
                        const Gap(40),
                        PasswordTextFormField(
                          text: 'Current Password',
                          controller: cubit.currentPasswordController,
                          validator: Validators().validatorPassword,
                        ),
                        const Gap(16),
                        PasswordTextFormField(
                          text: 'New Password',
                          controller: cubit.newPasswordController,
                          validator: Validators().validatorPassword,
                        ),
                        const Gap(16),
                        PasswordTextFormField(
                          text: 'Confirm password',
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
                    text: 'Update Password',
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
