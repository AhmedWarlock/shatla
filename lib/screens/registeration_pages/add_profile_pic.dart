import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:shatla/controllers/auth_controller.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/sample_text.dart';
import 'package:shatla/widgets/app_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';
import '../../widgets/show_loading.dart';

class AddProfilePicture extends StatefulWidget {
  const AddProfilePicture({Key? key}) : super(key: key);

  @override
  State<AddProfilePicture> createState() => _AddProfilePictureState();
}

class _AddProfilePictureState extends State<AddProfilePicture> {
  final AuthController _authController = Get.find();
  File? _img;
  final imagePicker = ImagePicker();

  Future<void> _selectImage(ImageSource imageSource) async {
    var pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      setState(() {
        _img = File(pickedImage.path);
      });
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppMediumText(
          text: 'Upload a profile picture',
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.width30),
          child: Column(
            children: [
              _img == null
                  ? CircleAvatar(
                      radius: Dimensions.radius30 * 4,
                      backgroundImage: const NetworkImage(stockPictureURL),
                    )
                  : CircleAvatar(
                      radius: Dimensions.radius30 * 2.2,
                      backgroundImage: FileImage(_img as File),
                    ),
              // Choose Image button
              MaterialButton(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height10,
                    horizontal: Dimensions.width10),
                color: AppColors.lightGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius15))),
                onPressed: () {
                  // Show Bottom sheet method
                  Get.bottomSheet(Container(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.height20,
                        horizontal: Dimensions.width15),
                    height: Dimensions.height50 * 3,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppMediumText(text: 'Choose from'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      await _selectImage(ImageSource.gallery);
                                    },
                                    icon: const Icon(
                                      Icons.album_outlined,
                                      color: AppColors.lightGreen,
                                    )),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                const AppRegText(text: 'Gallery'),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      await _selectImage(ImageSource.camera);
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: AppColors.lightGreen,
                                    )),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                const AppRegText(text: 'Camera'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ));
                },
                child: const AppMediumText(
                  text: 'Choose a photo',
                  color: Colors.white,
                ),
              ),
              _img != null
                  ? MaterialButton(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.height10,
                          horizontal: Dimensions.width10),
                      color: AppColors.lightGreen,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius15))),
                      onPressed: () async {
                        await _authController.uploadProfilePic(_img!);
                      },
                      child: const AppMediumText(
                        text: 'Confirm',
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              // Skip Button
              MaterialButton(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height10,
                    horizontal: Dimensions.width10),
                color: AppColors.lightGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius15))),
                onPressed: () => Get.offAllNamed('/main'),
                child: const AppMediumText(
                  text: 'Skip',
                  color: Colors.white,
                ),
              ),
            ]
                .map((child) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.height10,
                          horizontal: Dimensions.width15),
                      child: child,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
