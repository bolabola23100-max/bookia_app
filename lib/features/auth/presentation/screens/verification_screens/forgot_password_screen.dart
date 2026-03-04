import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/functions/validation.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/features/auth/presentation/screens/login_screen.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/otp_screen.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_text_action.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: AuthTextAction(
          text1: 'Remember Password?',
          text2: "Login",
          onPressed: () {
            pushTo(context, LoginScreen());
          },
        ),
      ),
      appBar: AppBar(leading: CustomBackButton()),
      body: ListView(
        children: [
          Form(
            key: formKey,
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
                SizedBox(height: 46),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MainButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        pushTo(context, OtpScreen(text: controller.text));
                      }
                    },
                    text: "Send Code",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
