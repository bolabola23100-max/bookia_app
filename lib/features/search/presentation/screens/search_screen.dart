import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/features/search/presentation/widgets/search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 70,
        leading: const CustomBackButton(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Gap(15),
            CustomTextFormField(
              hintText: 'Search Store',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(AppIcons.search),
              ),
            ),
            const Gap(25),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return SearchCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
