import 'package:movies/core/firebase/firebase_constants.dart';

class UserModel {
  String uid;
  String email;
  String name;
  String? photoUrl;
  String phoneNumber;
  String password;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.password,
    this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json[FirebaseConstants.uidUser],
        email: json[FirebaseConstants.emailUser],
        name: json[FirebaseConstants.nameUser],
        photoUrl: json[FirebaseConstants.photoUrlUser],
        phoneNumber: json[FirebaseConstants.phoneNumberUser],
        password: json[FirebaseConstants.passwordUser],
      );

  Map<String, dynamic> toJson() {
    return {
      FirebaseConstants.uidUser: uid,
      FirebaseConstants.emailUser: email,
      FirebaseConstants.nameUser: name,
      FirebaseConstants.photoUrlUser: photoUrl,
      FirebaseConstants.phoneNumberUser: phoneNumber,
      FirebaseConstants.passwordUser: password
    };
  }
}
