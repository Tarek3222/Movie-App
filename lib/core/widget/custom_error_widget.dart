import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/core/theme/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        children: [
          Lottie.asset(
            'assets/json_files/error.json',
          ),
          SizedBox(height: 10.h),
          Text(
            errorMessage,
            style: AppStyles.font16RedSemiBold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
