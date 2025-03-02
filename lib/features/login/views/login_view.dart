import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/widget/app_eleveted_button.dart';
import 'package:movies/features/login/logic/cubit/login_cubit.dart';
import 'package:movies/features/login/views/widgets/dont_have_an_account_text.dart';
import 'package:movies/features/login/views/widgets/email_and_password_fields.dart';
import 'package:movies/features/login/views/widgets/forget_password_text.dart';
import 'package:movies/features/login/views/widgets/login_bloc_listener.dart';
import 'package:movies/features/login/views/widgets/or_sign_in_with_widget.dart';
import 'package:movies/features/login/views/widgets/sign_in_with_google_or_facebook_buttons.dart';
import 'package:movies/features/login/views/widgets/terms_and_conditions_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: AppStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: AppStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                const EmailAndPasswordFields(),
                verticalSpace(24),
                const ForgetPasswordText(),
                verticalSpace(40),
                AppElevatedButton(
                  onPressed: () {
                    verifyThenLogin(context);
                  },
                  text: 'Login',
                ),
                verticalSpace(16),
                const OrSignInWithWidget(),
                verticalSpace(16),
                const SignInWithGoogleOrFacebookButtons(),
                verticalSpace(16),
                const TermsAndConditionsText(),
                verticalSpace(60),
                const Align(
                  alignment: Alignment.center,
                  child: DontHaveAnAccountText(),
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().loginUser();
    } else {
      context.read<LoginCubit>().autoValidate = AutovalidateMode.always;
    }
  }
}
