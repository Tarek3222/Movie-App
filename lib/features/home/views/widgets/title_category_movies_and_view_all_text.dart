import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_styles.dart';

class TitleCategoryMoviesAndViewAllText extends StatelessWidget {
  const TitleCategoryMoviesAndViewAllText(
      {super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                title,
                style: AppStyles.font24WhiteBold,
              ).animate().fade().slide(),
              const Spacer(),
              InkWell(
                onTap: onTap,
                child: Text(
                  'View All',
                  style: AppStyles.font14BlueMedium,
                ).animate().fade().slide(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
