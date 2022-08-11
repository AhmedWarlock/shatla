import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shatla/controllers/products_controller.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_text.dart';
import 'package:path/path.dart';
import 'package:shatla/widgets/show_loading.dart';

import '../utils/colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final ProductsController _productsController = Get.find();
  File? _image;
  bool _flowering = true;
  String? _pathName;

  void _selectImage(ImageSource imageSource) async {
    var pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _pathName = basename(pickedImage.path);
      });
    }
  }

  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_image == null) {
            showSnackBar(title: 'Error', message: 'Please upload an image');
          } else {
            await _productsController.uploadProduct(
                image: _image as File,
                imageName: _pathName as String,
                flowering: _flowering);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10, vertical: Dimensions.height10),
          child: Column(
            children: [
              const AppMediumText(text: 'Add product details in form below'),
              SizedBox(
                height: Dimensions.height45,
              ),
              TextField(
                controller: _productsController.nameController,
                decoration: InputDecoration(
                    labelText: 'Product Name',
                    labelStyle: TextStyle(fontSize: Dimensions.font26)),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              const AppMediumText(text: 'Product Describtion'),

              TextField(
                controller: _productsController.irrigationController,
                decoration: InputDecoration(
                    labelText: 'Irrigation',
                    labelStyle: TextStyle(fontSize: Dimensions.font26)),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextField(
                controller: _productsController.sunController,
                decoration: InputDecoration(
                    labelText: 'Sun Light',
                    labelStyle: TextStyle(fontSize: Dimensions.font26)),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextField(
                controller: _productsController.fertController,
                decoration: InputDecoration(
                    labelText: 'Fertilization',
                    labelStyle: TextStyle(fontSize: Dimensions.font26)),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextField(
                controller: _productsController.moreController,
                decoration: InputDecoration(
                    labelText: 'More Info',
                    labelStyle: TextStyle(fontSize: Dimensions.font26)),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              // Plant type
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => setState(() => _flowering = true),
                    child: Container(
                      width: Dimensions.width150,
                      height: Dimensions.height50,
                      decoration: BoxDecoration(
                          color:
                              _flowering ? AppColors.lightGreen : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius15),
                            bottomLeft: Radius.circular(Dimensions.radius15),
                          )),
                      child: Center(
                        child: AppRegText(
                            text: 'Flowering',
                            color: _flowering
                                ? Colors.white
                                : AppColors.darkGreen),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => _flowering = false),
                    child: Container(
                      height: Dimensions.height50,
                      width: Dimensions.width150,
                      decoration: BoxDecoration(
                          color:
                              _flowering ? Colors.white : AppColors.lightGreen,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius15),
                            bottomRight: Radius.circular(Dimensions.radius15),
                          )),
                      child: Center(
                        child: AppRegText(
                          text: 'Non-Flowering',
                          color:
                              _flowering ? AppColors.darkGreen : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextField(
                controller: _productsController.priceController,
                decoration: InputDecoration(
                    labelText: 'Unit price',
                    labelStyle: TextStyle(fontSize: Dimensions.font26)),
              ),
              SizedBox(height: Dimensions.height20),
              TextField(
                controller: _productsController.quantityController,
                decoration: InputDecoration(
                    labelText: 'Product Quantity',
                    labelStyle: TextStyle(fontSize: Dimensions.font26)),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              // Add Photo Section
              const AppMediumText(text: 'Add a photo'),
              _image != null
                  ? Container(
                      height: Dimensions.height200,
                      width: Dimensions.screenWidth * 0.8,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(_image as File),
                              fit: BoxFit.cover),
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius20))),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                width: Dimensions.width150 * 1.5,
                height: Dimensions.height50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => _selectImage(ImageSource.gallery),
                        icon: const Icon(
                          Icons.photo_album,
                          color: AppColors.darkGreyColor,
                        )),
                    Container(
                      height: Dimensions.height50,
                      width: 1,
                      color: AppColors.lightGreen,
                    ),
                    IconButton(
                        onPressed: () => _selectImage(ImageSource.camera),
                        icon: const Icon(
                          Icons.camera_alt,
                          color: AppColors.darkGreyColor,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
