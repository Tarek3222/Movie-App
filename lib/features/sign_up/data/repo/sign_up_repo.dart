import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/core/firebase/auth_error_model.dart';
import 'package:movies/core/firebase/auth_model.dart';
import 'package:movies/core/firebase/auth_services.dart';
import 'package:movies/core/firebase/user_model.dart';
import 'package:movies/core/firebase/user_services.dart';

class SignUpRepo {
  final AuthServices authServices;
  final UserServices userServices;

  SignUpRepo({required this.userServices, required this.authServices});
  Future<Either<AuthErrorModel, UserCredential>> signUp(
      {required UserModel user}) async {
    try {
      var userCred = await authServices.register(
          authModel: AuthModel(email: user.email, password: user.password));
      if (userCred.user != null) {
        userCred.user!.updateDisplayName(user.name);
        user.uid = userCred.user!.uid;
        await userServices.addUser(
          user: user,
        );
      }
      return Right(userCred);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const Left(AuthErrorModel('Email already in use'));
      } else if (e.code == 'invalid-email') {
        return const Left(AuthErrorModel('Invalid email'));
      } else if (e.code == 'weak-password') {
        return const Left(AuthErrorModel('Weak password'));
      } else {
        return const Left(AuthErrorModel('Something went wrong'));
      }
    } catch (e) {
      return const Left(AuthErrorModel('Something went wrong'));
    }
  }
}
