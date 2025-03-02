import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/helper/app_regex.dart';
import 'package:movies/core/widget/app_text_form_field.dart';
import 'package:movies/features/login/logic/cubit/login_cubit.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      controller: controller ?? context.read<LoginCubit>().emailController,
    );
  }
}
