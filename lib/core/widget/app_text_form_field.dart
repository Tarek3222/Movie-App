import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';

class AppTextFormField extends StatelessWidget {
  final InputBorder? foundedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final bool? isObscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.foundedBorder,
    this.enabledBorder,
    this.validator,
    this.inputTextStyle,
    this.hintStyle,
    this.controller,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.keyboardType,
    this.backgroundColor,
    this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? AppStyles.font14BlueMedium,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        fillColor: backgroundColor ?? const Color.fromARGB(17, 253, 253, 255),
        filled: true,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.lighterGrey,
                width: 1.3,
              ),
            ),
        focusedBorder: foundedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.mainBlue,
                width: 1.3,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        hintStyle: hintStyle ?? AppStyles.font14LightGreyMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
