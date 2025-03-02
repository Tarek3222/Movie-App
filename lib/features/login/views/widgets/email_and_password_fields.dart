import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/features/login/logic/cubit/login_cubit.dart';
import 'package:movies/features/login/views/widgets/email_field.dart';
import 'package:movies/features/login/views/widgets/password_field.dart';

class EmailAndPasswordFields extends StatelessWidget {
  const EmailAndPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      autovalidateMode: context.read<LoginCubit>().autoValidate,
      child: Column(
        children: [
          const EmailField(),
          verticalSpace(18),
          const PasswordField(),
          verticalSpace(24),
        ],
      ),
    );
  }
}
