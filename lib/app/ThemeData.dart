import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    dividerColor: Colors.transparent,
    fontFamily: AppFonts.dMSerif,
    scaffoldBackgroundColor: AppColors.bgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgColor,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.accentColor,
      hintStyle: TextStyle(color: AppColors.darkGray),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.border),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.dark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.darkGray,
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, height: 2),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, height: 2),
    ),
  );
}
