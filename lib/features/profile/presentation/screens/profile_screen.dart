import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: const Text('Profile', style: TextStyles.fs20),
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 35, backgroundColor: AppColors.gray),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sayed Abdul-Aziz',
                      style: TextStyles.fs20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'sayed@gmail.com',
                      style: TextStyles.fs14.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(
                    'My Orders',
                    () => pushTo(context, Routes.myOrders),
                  ),
                  _buildMenuItem(
                    'Edit Profile',
                    () => pushTo(context, Routes.editProfile),
                  ),
                  _buildMenuItem(
                    'Reset Password',
                    () => pushTo(context, Routes.newPassword),
                  ),
                  _buildMenuItem('FAQ', () {}),
                  _buildMenuItem('Contact Us', () {}),
                  _buildMenuItem('Privacy & Terms', () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, Function() onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        title: Text(title, style: TextStyles.fs16),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.dark,
        ),
        onTap: onTap,
      ),
    );
  }
}
