// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/core/firebase/auth_services.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/widget/app_eleveted_button.dart';
import 'package:movies/core/widget/app_loading_indecator.dart';
import 'package:movies/features/login/views/widgets/email_field.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: AppStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                'At our app, we take the security of your information seriously.',
                style: AppStyles.font14GreyRegular,
              ),
              verticalSpace(36),
              Form(
                key: formKey,
                autovalidateMode: autoValidate,
                child: EmailField(
                  controller: emailController,
                ),
              ),
              const Spacer(),
              isLoading
                  ? const AppLoadingIndecator()
                  : AppElevatedButton(
                      onPressed: () {
                        verfiyThenResetPassword(context);
                      },
                      text: 'Reset Password',
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void verfiyThenResetPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        // reset password logic
        if (await getIt
            .get<AuthServices>()
            .userExists(email: emailController.text)) {
          await getIt
              .get<AuthServices>()
              .resetPassword(email: emailController.text);
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              message: 'Password reset link sent to your email',
            ),
          );
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: 'User not found',
            ),
          );
        }
      } catch (e) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: e.toString(),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        autoValidate = AutovalidateMode.always;
      });
    }
  }
}
