import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/firebase/auth_model.dart';
import 'package:movies/features/login/data/repos/login_repo.dart';
import 'package:movies/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  Future<void> loginUser() async {
    emit(const LoginState.loading());
    AuthModel authModel = AuthModel(
      email: emailController.text,
      password: passwordController.text,
    );
    final user = await loginRepo.login(authModel: authModel);
    user.fold(
      (failure) => emit(
        LoginState.error(
          failure.errorMessege,
        ),
      ),
      (userCredential) => emit(
        LoginState.success(userCredential),
      ),
    );
  }
}
