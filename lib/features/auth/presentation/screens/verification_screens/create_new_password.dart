import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/functions/validation.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/core/widgets/inputs/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/password_changed.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomBackButton()),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Gap(28),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: Text("Create New Password", style: TextStyles.fs30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Text(
                  "Your new password must be unique from those previously used.",
                  style: TextStyles.fs16.copyWith(color: AppColors.darkGray),
                ),
              ),
              Gap(32),

              Gap(11),

              PasswordTextFormField(
                controller: passwordController,
                text: 'Password',
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

              Gap(12),
              PasswordTextFormField(
                controller: confirmPasswordController,
                text: 'Confirm password',
                validator: (input) {
                  if (input == null || input.isEmpty) {
                    return "Please confirm your password";
                  } else if (input != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              Gap(30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: MainButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      pushTo(context, PasswordChanged());
                    }
                  },
                  text: "Reset Password",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
