import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const CustomBackButton(),
        title: const Text('Edit Profile', style: TextStyles.fs20),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: const CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColors.gray,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          shape: BoxShape.circle,
                          boxShadow: [],
                        ),
                        child: SvgPicture.asset(AppIcons.camera),
                      ),
                    ],
                  ),
                  const Gap(45),
                  const CustomTextFormField(hintText: 'Full Name'),
                  const Gap(16),
                  const CustomTextFormField(
                    hintText: 'Phone',
                    keyboardType: TextInputType.phone,
                  ),
                  const Gap(16),
                  const CustomTextFormField(hintText: 'Address'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: MainButton(text: 'Update Profile', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
