import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shatla/repositories/firebase_repo.dart';
import 'package:shatla/constants/firebase_consts.dart';

class AuthController extends GetxController {
  AuthController({
    required this.fireBaseRepo,
  });
  final FireBaseRepo fireBaseRepo;
  // late Rx<User> firebaseUser;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? userName;
  String? profileURL;
  String? email;

  @override
  void onReady() async {
    super.onReady();
     print("inside");
    var user = await getUserInfo();
   
   
    userName = user['name'];
    profileURL = user['url'];
    email = user['email'];
  }

  String setInitialScreen() {
    bool isLoggedIn = auth.currentUser != null;
    if (isLoggedIn) {
      return '/main';
    } else {
      return '/login';
    }
  }

  Future<void> signIn() async => await fireBaseRepo.SignIn(
      email: emailController.text, password: passwordController.text);

  Future<void> signUp() async => fireBaseRepo.signUp(
      name: nameController.text,
      phoneNum: phoneNumberController.text,
      email: emailController.text,
      password: passwordController.text);

  Future<void> signOut() async => await fireBaseRepo.signOut();

  Future<Map<String,String>> getUserInfo()async {
return await fireBaseRepo.getUserInfo();
  }
    
  Future<String> uploadProfilePic(
          {required File image}) async {
      return await fireBaseRepo.uploadImageToStorage(childName: "ProfilePics", file: image, isPost: false);
          }
  // Clear text Controller
  void _clearControllers() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    phoneNumberController.clear();
  }
}
