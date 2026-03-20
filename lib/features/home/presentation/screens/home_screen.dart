import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller/best_seller.dart';
import 'package:bookia/features/home/presentation/widgets/slider/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(AppIcons.logo, height: 30),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: IconButton(
                onPressed: () {
                  pushTo(context, Routes.search);
                },
                icon: SvgPicture.asset(AppIcons.search, height: 24),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [Gap(25), HomeSlider(), Gap(31), BestSeller()],
            ),
          ),
        ),
    );
  }
}
