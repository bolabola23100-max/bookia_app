import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/core/widgets/inputs/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const CustomBackButton(),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(40),
                    Center(
                      child: const Text('New Password', style: TextStyles.fs30),
                    ),
                    Gap(40),
                    PasswordTextFormField(
                      text: 'Current Password',
                      controller: currentPasswordController,
                      validator: Validators().validatorPassword,
                    ),
                    Gap(16),
                    PasswordTextFormField(
                      text: 'New Password',
                      controller: newPasswordController,
                      validator: Validators().validatorPassword,
                    ),
                    Gap(16),
                    PasswordTextFormField(
                      text: 'Confirm password',
                      controller: confirmPasswordController,
                      validator: (input) =>
                          Validators().validatorConfirmPassword(
                            input,
                            newPasswordController.text,
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
                  if (formKey.currentState!.validate()) {}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
