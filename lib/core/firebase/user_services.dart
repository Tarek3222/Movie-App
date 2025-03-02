// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable, depend_on_referenced_packages

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/core/firebase/auth_services.dart';
import 'package:movies/core/firebase/firebase_constants.dart';
import 'package:movies/core/firebase/user_model.dart';

class UserServices {
  CollectionReference users =
      FirebaseFirestore.instance.collection(FirebaseConstants.usersCollection);

  Future<void> addUser({
    required UserModel user,
  }) async {
    return await users
        .doc(user.uid)
        .set(user.toJson())
        .then(
          (value) => log('User Added'),
        )
        .catchError((error) => log('Failed to add user: $error'));
  }

  Future<void> deleteUser({
    required String uid,
  }) {
    return users.doc(uid).delete();
  }

  Stream<DocumentSnapshot> getCurrentUser() {
    return users
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .snapshots();
  }
}
