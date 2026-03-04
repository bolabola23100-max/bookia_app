import 'dart:io';

import 'package:bookia/app/ThemeData.dart';
import 'package:bookia/features/on_boarding_screens/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: themeData(),

      builder: (context, child) {
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: child ?? Scaffold(),
        );
      },
      home: SplashScreen(),
    );
  }
}
