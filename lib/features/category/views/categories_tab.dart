import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/category/views/widgets/build_categories_grid_view.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browse Categories',
              style: AppStyles.font24WhiteBold,
            ).animate().fade().slide(curve: Curves.easeInExpo),
            verticalSpace(16),
            const Expanded(
              child: BuildCategoriesGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
