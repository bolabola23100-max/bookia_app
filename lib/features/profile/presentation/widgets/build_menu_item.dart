import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        title: Text(title, style: TextStyles.fs16),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.dark,
        ),
        onTap: onTap,
      ),
    );
  }
}
