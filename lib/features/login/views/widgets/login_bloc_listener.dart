// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/core/firebase/auth_services.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/widget/app_loading_indecator.dart';
import 'package:movies/features/login/logic/cubit/login_cubit.dart';
import 'package:movies/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userCredential) async {
            GoRouter.of(context).pop();
            if (await getIt.get<AuthServices>().isEmailVerified()) {
              GoRouter.of(context).pushReplacement(AppRoutes.mainView);
            } else {
              getIt.get<AuthServices>().verifyEmail();
              coniformEmailVerfication(context);
            }
          },
          error: (errorMessage) {
            setupErrorState(context, errorMessage);
          },
          loading: () {
            showDialog(
              context: context,
              builder: (_) => const AppLoadingIndecator(),
            );
          },
        );
      },
      listenWhen: (previous, current) =>
          current is Success || current is Error || current is Loading,
      child: const SizedBox.shrink(),
    );
  }

  void coniformEmailVerfication(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Email Verification'),
        content: const Text(
            'Please check your email to verify your account and login.'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: AppStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }

  void setupErrorState(BuildContext context, String errorMessage) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        content: Text(
          errorMessage,
          style: AppStyles.font14BlueMedium,
        ),
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: AppStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
