import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shatla/controllers/auth_controller.dart';
import 'package:shatla/controllers/posts_controller.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../widgets/app_text.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final PostsController _postsController = Get.find();
  final AuthController _authController = Get.find();

  File? _file;
  String? _pathName;

  ImagePicker imagePicker = ImagePicker();

  void _selectImage(ImageSource imageSource) async {
    var pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      setState(() {
        _file = File(pickedImage.path);
        _pathName = basename(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _authController.getUserInfo();
          String userName = _authController.userName!;
          await _postsController.uploadPost(
              image: _file as File,
              imageName: _pathName as String,
              userName: userName);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            child: Column(children: [
              // User Info
              ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  title: const AppMediumText(
                    text: 'UserName',
                  ),
                  trailing: IconButton(
                      onPressed: () => Get.back(),
                      icon: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.darkGreyColor,
                        ),
                      ))),
              // Input Field
              Container(
                width: double.maxFinite,
                height: Dimensions.height250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      controller: _postsController.postController,
                      maxLines: 8,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () => _selectImage(ImageSource.gallery),
                            icon: const Icon(
                              Icons.photo_album,
                              color: AppColors.darkGreyColor,
                            )),
                        IconButton(
                            onPressed: () => _selectImage(ImageSource.camera),
                            icon: const Icon(
                              Icons.camera_alt,
                              color: AppColors.darkGreyColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.emoji_emotions_outlined,
                                color: AppColors.darkGreyColor)),
                      ],
                    )
                  ],
                ),
              ),
              // picked image preview
              _file != null
                  ? Container(
                      margin: EdgeInsets.all(Dimensions.height20),
                      height: Dimensions.height250,
                      width: Dimensions.width150 * 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius20)),
                        image: DecorationImage(
                            image: FileImage(_file as File), fit: BoxFit.cover),
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    )
            ]),
          ),
        ),
      ),
    );
  }
}
