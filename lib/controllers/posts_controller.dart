import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shatla/repositories/firebase_repo.dart';

class PostsController extends GetxController {
  final FireBaseRepo fireBaseRepo;
  PostsController({
    required this.fireBaseRepo,
  });

  TextEditingController postController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  Future<void> uploadPost({
    required File image,
    required String imageName,
    required String userName,
  }) async =>
      await fireBaseRepo.uploadPost(
        image: image,
        imageName: imageName,
        text: postController.text,
        userName: userName,
      );
}
