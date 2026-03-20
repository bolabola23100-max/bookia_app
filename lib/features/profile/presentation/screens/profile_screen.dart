import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:bookia/features/profile/presentation/widgets/build_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Navigator.pop(context);
          context.go(Routes.login);
        } else if (state is LogoutLoadingState) {
          showLoading(context);
        } else if (state is DeleteAccountLoadingState) {
          showLoading(context);
        } else if (state is DeleteAccountSuccessState) {
          Navigator.pop(context);
          context.go(Routes.login);
        } else if (state is DeleteAccountErrorState) {
          Navigator.pop(context);
          showAppSnackBar(context, 'Failed to delete account');
        }
      },
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileErrorState) {
          return const Center(child: Text('Error'));
        } else if (state is ProfileSuccessState ||
            state is LogoutLoadingState ||
            state is LogoutSuccessState ||
            state is ChangePasswordLoadingState ||
            state is ChangePasswordSuccessState ||
            state is ChangePasswordErrorState ||
            state is UpdateProfileLoadingState ||
            state is UpdateProfileSuccessState ||
            state is UpdateProfileErrorState ||
            state is DeleteAccountLoadingState ||
            state is DeleteAccountSuccessState ||
            state is DeleteAccountErrorState) {
          var user = state is ProfileSuccessState
              ? state.user
              : context.read<ProfileCubit>().getUserInfo();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile', style: TextStyles.fs20),
              centerTitle: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<ProfileCubit>().logout();
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: AppColors.gray,
                          child:
                              (user?.image != null && user!.image!.isNotEmpty)
                              ? ClipOval(
                                  child: Image.network(
                                    user.image!,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : null,
                        ),
                        const Gap(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user?.name ?? '',
                              style: TextStyles.fs20.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              user?.email ?? '',
                              style: TextStyles.fs14.copyWith(
                                color: AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(32),
                    ...[
                      BuildMenuItem(
                        title: 'My Orders',
                        onTap: () => pushTo(context, Routes.myOrders),
                      ),
                      BuildMenuItem(
                        title: 'Edit Profile',
                        onTap: () => pushTo(context, Routes.editProfile),
                      ),
                      BuildMenuItem(
                        title: 'Reset Password',
                        onTap: () => pushTo(context, Routes.newPassword),
                      ),
                      BuildMenuItem(title: 'FAQ', onTap: () {}),
                      BuildMenuItem(title: 'Contact Us', onTap: () {}),
                      BuildMenuItem(title: 'Privacy & Terms', onTap: () {}),
                      BuildMenuItem(
                        title: 'Delete Account',
                        onTap: () {
                          context
                              .read<ProfileCubit>()
                              .currentPasswordController
                              .clear();
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Delete Account'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Are you sure you want to delete your account? This action cannot be undone. Please enter your password to confirm.',
                                  ),
                                  Gap(16),
                                  CustomTextFormField(
                                    controller: context
                                        .read<ProfileCubit>()
                                        .currentPasswordController,

                                    hintText: 'Password',
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => pop(context),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    pop(context);
                                    context
                                        .read<ProfileCubit>()
                                        .deleteAccount();
                                  },
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(color: AppColors.redColor),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
