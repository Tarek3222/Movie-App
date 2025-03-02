import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';

class ItemProfileWithInformationWithDivider extends StatelessWidget {
  const ItemProfileWithInformationWithDivider(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppStyles.font14GreyRegular,
            ).animate().fade().slide(),
            const Spacer(),
            Text(
              value,
              style: AppStyles.font16WhiteSemiBold,
            ).animate().fade().slide(),
          ],
        ),
        Divider(
          height: 50.h,
          thickness: 0.2,
          color: AppColors.lighterGrey,
        ),
      ],
    );
  }
}
