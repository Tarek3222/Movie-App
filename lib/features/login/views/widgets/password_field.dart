import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widget/app_text_form_field.dart';
import 'package:movies/features/login/logic/cubit/login_cubit.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
  });
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Password',
      isObscureText: isObscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        return null;
      },
      suffixIcon: IconButton(
        icon: Icon(
          isObscureText ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: () {
          setState(
            () {
              isObscureText = !isObscureText;
            },
          );
        },
      ),
      controller: context.read<LoginCubit>().passwordController,
    );
  }
}
