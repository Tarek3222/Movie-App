import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final OutlinedBorder? shape;
  final double? horizontalPadding;
  final double? verticalPadding;
  final String text;
  final TextStyle? textStyle;
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.height,
    this.width,
    this.shape,
    required this.text,
    this.textStyle,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h),
        backgroundColor: backgroundColor ?? AppColors.mainBlue,
        fixedSize: Size(width ?? double.maxFinite, height ?? 55),
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: textStyle ?? AppStyles.font16WhiteSemiBold,
      ),
    );
  }
}
