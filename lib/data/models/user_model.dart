// import 'package:cloud_firestore/cloud_firestore.dart';

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

  Map<String, String> toDocument() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'profileURL': profileURL,
      'phoneNum': phoneNum,
    };
  }

  // factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   return UserModel(
  //       name: (snapshot.data() as Map)['name'],
  //       email: (snapshot.data() as Map)['email'],
  //       phoneNum: (snapshot.data() as Map)['phoneNum'],
  //       id: (snapshot.data() as Map)['id'],
  //       profileURL: (snapshot.data() as Map)['profileURL']);
  // }
}
