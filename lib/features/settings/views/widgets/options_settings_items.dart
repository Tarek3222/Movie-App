// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/core/firebase/auth_services.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/widget/app_loading_indecator.dart';
import 'package:movies/features/settings/views/widgets/build_item_in_settings.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OptionsSettingsItems extends StatelessWidget {
  const OptionsSettingsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 33, 32, 44),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          BuildItemInSettings(
            title: 'Theme Mode',
            trailing: Switch(
              value: false,
              activeColor: AppColors.mainDarkBlue,
              inactiveTrackColor: AppColors.grey,
              inactiveThumbColor: AppColors.lighterLighterGrey,
              activeTrackColor: AppColors.mainBlue,
              onChanged: (value) {},
            ),
          ),
          BuildItemInSettings(
            title: 'Watchlist',
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          BuildItemInSettings(
            title: 'Contact Support',
            trailing: IconButton(
              onPressed: () {
                launchUrlString('mailto:tarekahmebelal@gmail.com');
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          BuildItemInSettings(
            title: 'About',
            trailing: IconButton(
              onPressed: () {
                showAboutDialog(context);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          BuildItemInSettings(
            title: 'Logout',
            titleColor: Colors.red,
            trailing: IconButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (_) => const AppLoadingIndecator());
                await getIt.get<AuthServices>().logout();
                await GoogleSignIn().signOut();
                await FacebookAuth.instance.logOut();
                GoRouter.of(context).pop();
                GoRouter.of(context).pushReplacement(AppRoutes.loginView);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.red,
                size: 24,
              ),
            ),
          ),
          BuildItemInSettings(
            title: 'Delete Account',
            titleColor: Colors.red,
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.red,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor: AppColors.mainDarkBlue,
          title: Text(
            'About',
            style: AppStyles.font18LighterGreySemiBold,
          ),
          content: Text(
            "Welcome to Movies App, your go-to app for discovering and exploring movies! Browse through a vast collection of films, watch trailers, read user reviews, and get personalized recommendations. Whether you're into action, comedy, or drama, we have got something for everyone.Enjoy the best movie experience with My App!",
            style: AppStyles.font14GreyRegular,
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                surfaceTintColor: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
