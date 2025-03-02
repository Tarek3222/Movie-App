import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: AppStyles.font13GreyRegular,
          ),
          TextSpan(
            text: '  Terms & Conditions',
            style: AppStyles.font13BlueMedium,
          ),
          TextSpan(
            text: ' and',
            style: AppStyles.font13GreyRegular,
          ),
          TextSpan(
            text: ' PrivacyPolicy.',
            style: AppStyles.font13BlueMedium.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }
}
