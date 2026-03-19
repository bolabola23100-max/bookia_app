import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGray,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: "search",
                  child: Image.asset(
                    AppIcons.bgImage,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Gap(8),
            Text(
              "aaaaaaaaaaaaa",
              style: TextStyles.fs14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const Gap(5),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "\$10",
                    style: TextStyles.fs14.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MainButton(
                  buttonColor: AppColors.dark,
                  onPressed: () {},
                  text: "Buy",
                  borderRadius: 4,
                  w: 62,
                  h: 28,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
