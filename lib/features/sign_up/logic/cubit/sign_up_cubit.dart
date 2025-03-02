import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/firebase/user_model.dart';
import 'package:movies/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:movies/features/sign_up/logic/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;
  SignUpCubit({required this.signUpRepo}) : super(const SignUpState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  Future<void> signUpUser() async {
    emit(const SignUpState.loading());

    UserModel userModel = UserModel(
      email: emailController.text,
      uid: "",
      password: passwordController.text,
      name: nameController.text,
      phoneNumber: phoneNumberController.text,
    );

    final user = await signUpRepo.signUp(user: userModel);
    user.fold(
      (failure) => emit(
        SignUpState.error(
          failure.errorMessege,
        ),
      ),
      (userCredential) => emit(
        SignUpState.success(userCredential),
      ),
    );
  }
}
