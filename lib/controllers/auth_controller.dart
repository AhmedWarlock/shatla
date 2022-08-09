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

  // @override
  // void onReady() {
  //   super.onReady();
  //   firebaseUser = Rx<User>(auth.currentUser!);
  //   firebaseUser.bindStream(auth.userChanges()??null);
  //   ever(firebaseUser, setInitialScreen);
  // }

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

  Future<void> uploadProfilePic(File image) async =>
      await fireBaseRepo.uploadProfilePic(image);

  // Clear text Controller
  void _clearControllers() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    phoneNumberController.clear();
  }
}
