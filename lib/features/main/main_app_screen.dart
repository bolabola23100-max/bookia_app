import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/custom__svg__picture.dart';
import 'package:bookia/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [HomeScreen(), Text("dd"), Text("dd"), Text("dd")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: _navBar(),
    );
  }

  Container _navBar() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 27),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppIcons.home),
            activeIcon: CustomSvgPicture(
              path: AppIcons.home,
              color: AppColors.primaryColor,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppIcons.bookmark),
            activeIcon: CustomSvgPicture(
              path: AppIcons.bookmark,
              color: AppColors.primaryColor,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppIcons.category),
            activeIcon: CustomSvgPicture(
              path: AppIcons.category,
              color: AppColors.primaryColor,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppIcons.profile),
            activeIcon: CustomSvgPicture(
              path: AppIcons.profile,
              color: AppColors.primaryColor,
            ),
            label: "Shop",
          ),
        ],
      ),
    );
  }
}
