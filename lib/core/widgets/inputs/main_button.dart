import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.w = 319,
    this.h = 58,
    this.borderRadius = 8,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.bgColor,
    this.sideColor = Colors.transparent,
    this.icon,
  });
  final Function() onPressed;
  final String text;
  final double w;
  final double h;
  final double borderRadius;
  final Color buttonColor;
  final Color textColor;
  final Color sideColor;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: sideColor),
        backgroundColor: buttonColor,
        minimumSize: Size(w, h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        foregroundColor: AppColors.bgColor,
      ),

      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            SvgPicture.asset(icon!),
            const SizedBox(width: 15),
          ],
          Text(text, style: TextStyles.fs14.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
