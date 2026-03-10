import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    String? token = SharedPref.getToken();
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (token != null && token.isNotEmpty) {
        context.go(Routes.mainAppScreen);
      } else {
        context.go(Routes.welcome);
      }
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
