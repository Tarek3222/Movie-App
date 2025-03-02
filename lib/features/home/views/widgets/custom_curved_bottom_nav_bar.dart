import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';

class CustomCurvedBottomNavBar extends StatelessWidget {
  const CustomCurvedBottomNavBar(
      {super.key, required this.currentIndex, this.onTap});
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: AppColors.mainBlue,
      index: currentIndex,
      onTap: onTap,
      animationDuration: const Duration(milliseconds: 200),
      animationCurve: Curves.linear,
      height: 60.h,
      items: const [
        Icon(
          Icons.home,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.search,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.movie,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.settings,
          size: 30,
          color: Colors.white,
        ),
      ],
    );
  }
}
