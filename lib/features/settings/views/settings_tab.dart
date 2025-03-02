import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/settings/views/widgets/build_profile_image_with_name_and_email.dart';
import 'package:movies/features/settings/views/widgets/options_settings_items.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settigns',
              style: AppStyles.font24WhiteBold,
            ).animate().fade().slide(curve: Curves.easeInExpo),
            verticalSpace(20),
            const BuildProfileImageWithNameAndEmail(),
            verticalSpace(20),
            const Expanded(
              child: OptionsSettingsItems(),
            ),
          ],
        ),
      ),
    );
  }
}
