import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/on_boarding/views/widgets/get_started_button.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              Image.asset(
                'assets/images/on_boarding_image.png',
              ),
              verticalSpace(16),
              Text(
                'Onboarding',
                style: AppStyles.font32WhiteBold,
              ),
              verticalSpace(16),
              Text(
                'Watch everything you want',
                style: AppStyles.font16WhiteRegular,
              ),
              Text(
                'for free!',
                style: AppStyles.font16WhiteRegular.copyWith(
                  height: 2,
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: const GetStartedButton(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
