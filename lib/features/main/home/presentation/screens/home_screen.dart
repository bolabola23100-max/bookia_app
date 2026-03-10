import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/main/home/presentation/widgets/book_card.dart';
import 'package:bookia/features/main/home/presentation/widgets/image_carousel.dart';
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
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.search, height: 24),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(25),
              ImageCarousel(),
              Gap(31),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Best Seller", style: TextStyles.fs20),
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 24,
                  mainAxisExtent: 210,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return BookCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
