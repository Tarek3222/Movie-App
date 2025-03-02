import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/theme/app_styles.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: AppStyles.font13BlueRegular,
          ),
          TextSpan(
            text: ' Login',
            style: AppStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context).pop();
              },
          ),
        ],
      ),
    );
  }
}
