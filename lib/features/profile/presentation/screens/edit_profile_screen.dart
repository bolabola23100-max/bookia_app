import 'dart:io';

import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const CustomBackButton(),
        title: Text('edit_profile'.tr(), style: TextStyles.fs20),
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccessState) {
            Navigator.pop(context); // Pop loading dialog
            showAppSnackBar(
              context,
              'edit_profile_success'.tr(),
              type: DialogType.success,
            );
            Navigator.pop(context); // Pop current screen (EditProfileScreen)
          } else if (state is UpdateProfileErrorState) {
            Navigator.pop(context); // Pop loading dialog
            showAppSnackBar(context, 'edit_profile_error'.tr());
          } else if (state is UpdateProfileLoadingState) {
            showLoading(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<ProfileCubit>();
          return Column(
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
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: AppColors.gray,
                              backgroundImage: cubit.imagePath != null
                                  ? FileImage(File(cubit.imagePath!))
                                  : (state is ProfileSuccessState &&
                                            state.user.image != null &&
                                            state.user.image!.isNotEmpty
                                        ? NetworkImage(state.user.image!)
                                        : null),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              cubit.pickImage();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: AppColors.bgColor,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(AppIcons.camera),
                            ),
                          ),
                        ],
                      ),
                      const Gap(45),
                      CustomTextFormField(
                        controller: cubit.nameController,
                        hintText: 'full_name'.tr(),
                      ),
                      const Gap(16),
                      CustomTextFormField(
                        controller: cubit.phoneController,
                        hintText: 'phone'.tr(),
                        keyboardType: TextInputType.phone,
                      ),
                      const Gap(16),
                      CustomTextFormField(
                        controller: cubit.addressController,
                        hintText: 'address'.tr(),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: MainButton(
                  text: 'update_profile'.tr(),
                  onPressed: () {
                    cubit.updateProfile();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
