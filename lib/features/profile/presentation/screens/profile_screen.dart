import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:bookia/features/profile/presentation/widgets/build_menu_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          showAppSnackBar(context, 'delete_account_error'.tr());
        }
      },
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileErrorState) {
          return Center(child: Text('error'.tr()));
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
              title: Text('profile'.tr(), style: TextStyles.fs20),
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
                                  child: CachedNetworkImage(
                                    imageUrl: user.image!,
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
                        title: 'my_orders'.tr(),
                        onTap: () => pushTo(context, Routes.myOrders),
                      ),
                      BuildMenuItem(
                        title: 'edit_profile'.tr(),
                        onTap: () => pushTo(context, Routes.editProfile),
                      ),
                      BuildMenuItem(
                        title: 'reset_password'.tr(),
                        onTap: () => pushTo(context, Routes.newPassword),
                      ),
                      BuildMenuItem(title: 'faq'.tr(), onTap: () {}),
                      BuildMenuItem(title: 'contact_us'.tr(), onTap: () {}),
                      BuildMenuItem(title: 'privacy_terms'.tr(), onTap: () {}),
                      BuildMenuItem(
                        title: 'language'.tr(),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('language'.tr()),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // en
                                  ListTile(
                                    title: Text('english'.tr()),
                                    trailing:
                                        context.locale.languageCode == 'en'
                                        ? const Icon(Icons.check)
                                        : null,
                                    onTap: () {
                                      context.setLocale(const Locale('en'));
                                      pop(context);
                                    },
                                  ),
                                  // ar
                                  ListTile(
                                    title: Text('arabic'.tr()),
                                    trailing:
                                        context.locale.languageCode == 'ar'
                                        ? const Icon(Icons.check)
                                        : null,
                                    onTap: () {
                                      context.setLocale(const Locale('ar'));
                                      pop(context);
                                    },
                                  ),
                                  // zh
                                  ListTile(
                                    title: Text('chinese'.tr()),
                                    trailing:
                                        context.locale.languageCode == 'zh'
                                        ? const Icon(Icons.check)
                                        : null,
                                    onTap: () {
                                      context.setLocale(const Locale('zh'));
                                      pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      BuildMenuItem(
                        title: 'delete_account'.tr(),
                        onTap: () {
                          context
                              .read<ProfileCubit>()
                              .currentPasswordController
                              .clear();
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('delete_account'.tr()),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('delete_account_message'.tr()),
                                  Gap(16),
                                  CustomTextFormField(
                                    controller: context
                                        .read<ProfileCubit>()
                                        .currentPasswordController,

                                    hintText: 'password'.tr(),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => pop(context),
                                  child: Text('cancel'.tr()),
                                ),
                                TextButton(
                                  onPressed: () {
                                    pop(context);
                                    context
                                        .read<ProfileCubit>()
                                        .deleteAccount();
                                  },
                                  child: Text(
                                    'delete'.tr(),
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
