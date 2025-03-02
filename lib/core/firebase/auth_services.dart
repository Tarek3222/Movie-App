// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/core/firebase/auth_model.dart';
import 'package:movies/core/firebase/firebase_constants.dart';
import 'package:movies/core/firebase/user_services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> login({required AuthModel authModel}) async {
    return await auth.signInWithEmailAndPassword(
        email: authModel.email, password: authModel.password);
  }

  Future<UserCredential> register({required AuthModel authModel}) async {
    return await auth.createUserWithEmailAndPassword(
        email: authModel.email, password: authModel.password);
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> verifyEmail() async {
    await auth.currentUser!.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    return auth.currentUser!.emailVerified;
  }

  Future<void> deleteAccount() async {
    await auth.currentUser!.delete();
    await getIt.get<UserServices>().deleteUser(
          uid: auth.currentUser!.uid,
        );
  }

  Future<void> updatePassword({required String password}) async {
    await auth.currentUser!.updatePassword(password);
  }

  Future<bool> userExists({required String email}) async {
    final data = await getIt
        .get<UserServices>()
        .users
        .where(FirebaseConstants.emailUser, isEqualTo: email)
        .get();
    return data.docs.isNotEmpty;
  }

  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      log(e.toString());
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: 'No internet connection',
        ),
      );
      return null;
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    // Trigger the sign-in flow
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status != LoginStatus.success) return null;
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
