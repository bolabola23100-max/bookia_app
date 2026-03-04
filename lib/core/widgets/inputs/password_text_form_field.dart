import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    required this.text,
    this.validator,
    required this.controller,
  });
  final String text;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: TextFormField(
        textInputAction: TextInputAction.next,

        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: TextStyles.fs14.copyWith(color: AppColors.darkGray),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText
                  ? Icons.remove_red_eye_outlined
                  : Icons.visibility_off_outlined,
            ),
          ),
        ),
        validator: widget.validator,
        controller: widget.controller,
      ),
    );
  }
}
