import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/helper/cache_helper.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/widget/app_eleveted_button.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: 'Get Started',
      onPressed: () {
        CacheHelper.saveData(key: 'isFirstLaunch', value: false);
        GoRouter.of(context).pushReplacement(AppRoutes.loginView);
      },
    );
  }
}
