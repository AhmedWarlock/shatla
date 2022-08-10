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
    userName = await getUserInfo();
    profileURL = await getUserInfo(isName: false, isPic: true);
    email = await getUserInfo(isName: false, isEmail: true);
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

  Future<String> getUserInfo(
          {bool isName = true,
          bool isPic = false,
          bool isEmail = false}) async =>
      await fireBaseRepo.getUserInfo(
          isPic: isPic, isEmail: isEmail, isName: isName);

  Future<void> uploadProfilePic(
          {required File image, required String imageName}) async =>
      await fireBaseRepo.uploadProfilePic(image: image, imageName: imageName);

  // Clear text Controller
  void _clearControllers() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    phoneNumberController.clear();
  }
}
