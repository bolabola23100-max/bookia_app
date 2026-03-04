import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/functions/validation.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/core/widgets/inputs/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/screens/login_screen.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_text_action.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AuthTextAction(
        text1: "Already have an account?",
        text2: " Login Now",
        onPressed: () {
          pushTo(context, LoginScreen());
        },
      ),
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
                  child: Text(
                    "Hello! Register to get started",
                    style: TextStyles.fs30,
                  ),
                ),
              ),
              Gap(32),

              CustomTextFormField(
                hintText: 'Username',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  } else if (!isName(value)) {
                    return "Enter a valid name";
                  }
                  return null;
                },
              ),
              Gap(11),

              CustomTextFormField(
                hintText: "Email",
                validator: (value) {
                  {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    } else if (!isEmailValid(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  }
                },
              ),

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
                child: MainButton(onPressed: () {}, text: "Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
