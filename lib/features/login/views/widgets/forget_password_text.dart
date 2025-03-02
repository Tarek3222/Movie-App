import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theme/app_styles.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRoutes.forgetPasswordView);
        },
        child: Text(
          'Forgot Password?',
          style: AppStyles.font13BlueRegular,
        ),
      ),
    );
  }
}
