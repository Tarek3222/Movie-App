// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/core/firebase/auth_services.dart';
import 'package:movies/core/firebase/user_model.dart';
import 'package:movies/core/firebase/user_services.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/widget/app_loading_indecator.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignInWithGoogleOrFacebookButtons extends StatelessWidget {
  const SignInWithGoogleOrFacebookButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            handleSignInWithGoogle(context);
          },
          style: IconButton.styleFrom(
            backgroundColor: AppColors.lighterLighterGrey,
          ),
          icon: SvgPicture.asset(
            'assets/svgs/google.svg',
            width: 35,
          ),
        ),
        IconButton(
          onPressed: () {
            handelSignInWithFacebook(context);
          },
          style: IconButton.styleFrom(
            backgroundColor: AppColors.lighterLighterGrey,
          ),
          icon: SvgPicture.asset(
            'assets/svgs/facebook.svg',
            width: 35,
          ),
        ),
      ],
    );
  }

  void handleSignInWithGoogle(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => const AppLoadingIndecator(),
    );
    UserCredential? userCredential =
        await getIt.get<AuthServices>().signInWithGoogle(context);

    if (userCredential != null) {
      log('User Signed In: ${userCredential.user!.displayName}');
      GoRouter.of(context).pop();
      if (userCredential.additionalUserInfo!.isNewUser) {
        await getIt.get<UserServices>().addUser(
              user: UserModel(
                uid: userCredential.user!.uid,
                email: userCredential.user!.email!,
                name: userCredential.user!.displayName ?? 'User',
                phoneNumber:
                    userCredential.user!.phoneNumber ?? 'No Phone Number',
                photoUrl: userCredential.user!.photoURL,
                password: '',
              ),
            );
        GoRouter.of(context).pushReplacement(AppRoutes.mainView);
      } else {
        GoRouter.of(context).pushReplacement(AppRoutes.mainView);
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.success(
            message: 'Welcome back ${userCredential.user!.displayName}',
          ),
        );
      }
    } else {
      GoRouter.of(context).pop();
    }
  }

  void handelSignInWithFacebook(BuildContext context) async {
    try {
      UserCredential? userCredential =
          await getIt.get<AuthServices>().signInWithFacebook();
      if (userCredential != null) {
        log('User Signed In: ${userCredential.user!.displayName}');

        if (userCredential.additionalUserInfo!.isNewUser) {
          await getIt.get<UserServices>().addUser(
                user: UserModel(
                  uid: userCredential.user!.uid,
                  email: userCredential.user!.email!,
                  name: userCredential.user!.displayName ?? 'User',
                  phoneNumber:
                      userCredential.user!.phoneNumber ?? 'No Phone Number',
                  photoUrl: userCredential.user!.photoURL,
                  password: '',
                ),
              );
          GoRouter.of(context).pushReplacement(AppRoutes.mainView);
        } else {
          GoRouter.of(context).pushReplacement(AppRoutes.mainView);
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: 'Welcome back ${userCredential.user!.displayName}',
            ),
          );
        }
      }
    } catch (e) {
      log(e.toString());
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message:
              'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address',
        ),
      );
    }
  }
}
