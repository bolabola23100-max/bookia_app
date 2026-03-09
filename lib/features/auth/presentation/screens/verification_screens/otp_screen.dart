import 'dart:async';
import 'dart:developer';

import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/screens/verification_screens/create_new_password.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_text_action.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.text});
  final String text;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  void startTimeDown() {
    _timer?.cancel();
    setState(() {
      _remainingTime = 60;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  int _remainingTime = 60;
  @override
  void initState() {
    super.initState();
    startTimeDown();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: AuthTextAction(
            text1: "Didn’t received code?",
            text2: _remainingTime > 0 ? "($_remainingTime)" : "Resend",
            onPressed: () {
              if (_remainingTime == 0) {
                startTimeDown();
              }
            },
          ),
        ),
        appBar: AppBar(leading: CustomBackButton()),
        body: _otpCode(),
      ),
    );
  }

  BlocConsumer<AuthCubit, AuthState> _otpCode() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        var cubit = context.read<AuthCubit>();
        if (state is AuthSuccessState) {
          pop(context);
          pushReplacement(
            context,
            CreateNewPassword(
              email: cubit.emailController.text,
              otpCode: cubit.pinController.text,
            ),
          );


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
                Gap(28),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text("OTP Verification", style: TextStyles.fs30),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Row(
                      children: [
                        Text(
                          "Enter the verification code we just sent\n on your email address.",
                          style: TextStyles.fs16.copyWith(
                            color: AppColors.darkGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(35),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Pinput(
                    length: 6,
                    controller: cubit.pinController,
                    keyboardType: TextInputType.number,

                    focusedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(fontSize: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                    ),

                    errorPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(fontSize: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.errorColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),

                Gap(27),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MainButton(
                    onPressed: () {
                      cubit.otpCode();
                    },
                    text: "Verify",
                  ),
                ),

                Gap(24),
              ],
            ),
          ),
        );
      },
    );
  }
}
