import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/core/firebase/auth_error_model.dart';
import 'package:movies/core/firebase/auth_model.dart';
import 'package:movies/core/firebase/auth_services.dart';

class LoginRepo {
  final AuthServices authServices;

  LoginRepo({required this.authServices});

  Future<Either<AuthErrorModel, UserCredential>> login(
      {required AuthModel authModel}) async {
    try {
      return Right(
        await authServices.login(authModel: authModel),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left(AuthErrorModel('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return const Left(
            AuthErrorModel('Wrong password provided for that user.'));
      } else {
        return Left(AuthErrorModel(e.toString()));
      }
    } catch (e) {
      return const Left(AuthErrorModel('Something went wrong'));
    }
  }
}
