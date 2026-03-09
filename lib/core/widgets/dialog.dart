import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showErrorDialog(BuildContext context, String errorMsg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: AppColors.errorColor,
      content: Text(errorMsg),
    ),
  );
}

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: AppColors.dark.withValues(alpha: .8),
    barrierDismissible: false,
    builder: (context) => Center(child: Lottie.asset(AppIcons.loading)),
  );
}
