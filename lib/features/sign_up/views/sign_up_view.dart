import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/widget/app_eleveted_button.dart';
import 'package:movies/features/login/views/widgets/terms_and_conditions_text.dart';
import 'package:movies/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:movies/features/sign_up/views/widgets/already_have_an_account.dart';
import 'package:movies/features/sign_up/views/widgets/sign_up_bloc_listener.dart';
import 'package:movies/features/sign_up/views/widgets/sign_up_forms.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                  'Create Account',
                  style: AppStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: AppStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                const SignUpForms(),
                verticalSpace(40),
                AppElevatedButton(
                  onPressed: () {
                    sginUpThenLogin(context);
                  },
                  text: 'Sign Up',
                ),
                verticalSpace(16),
                const TermsAndConditionsText(),
                verticalSpace(60),
                const Align(
                  alignment: Alignment.center,
                  child: AlreadyHaveAnAccountText(),
                ),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sginUpThenLogin(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUpUser();
    } else {
      context.read<SignUpCubit>().autoValidate = AutovalidateMode.always;
    }
  }
}
