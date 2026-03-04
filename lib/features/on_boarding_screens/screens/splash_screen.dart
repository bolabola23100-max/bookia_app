import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/on_boarding_screens/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      pushReplacement(context, WelcomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.logo),
            Gap(10),
            Text("Order Your Book Now!", style: TextStyles.fs18),
          ],
        ),
      ),
    );
  }
}
