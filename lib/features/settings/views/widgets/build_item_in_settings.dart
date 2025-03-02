import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_styles.dart';

class BuildItemInSettings extends StatelessWidget {
  const BuildItemInSettings(
      {super.key, required this.title, this.trailing, this.titleColor});
  final String title;
  final Color? titleColor;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 33, 32, 44),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 6.w),
        title: Text(
          title,
          style: AppStyles.font18LighterGreySemiBold.copyWith(
            color: titleColor,
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}
