import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theme/app_styles.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: AppStyles.font13BlueRegular,
          ),
          TextSpan(
            text: ' Sign Up',
            style: AppStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context).push(AppRoutes.signUpView);
              },
          ),
        ],
      ),
    );
  }
}
