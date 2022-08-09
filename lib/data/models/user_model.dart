import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String phoneNum;
  final String id;
  final String email;
  String profileURL;
  UserModel({
    required this.name,
    required this.phoneNum,
    required this.id,
    required this.email,
    this.profileURL =
        'https://www.maxpixel.net/static/photo/1x/Insta-Instagram-Instagram-Icon-User-3814081.png',
  });

  Map<String, String> toJson() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'profileURL': profileURL,
      'phoneNum': phoneNum,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> snapshot) {
    return UserModel(
        name: snapshot['name'],
        email: snapshot['email'],
        phoneNum: snapshot['phoneNum'],
        id: snapshot['id'],
        profileURL: snapshot['profileURL']);
  }
}
