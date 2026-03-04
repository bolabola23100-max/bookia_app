import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        pop(context);
      },
      icon: SvgPicture.asset(AppIcons.back),
    );
  }
}
