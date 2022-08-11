import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:shatla/constants/firebase_consts.dart';
import 'package:shatla/data/models/product.dart';
import 'package:shatla/repositories/firebase_repo.dart';
import 'package:shatla/widgets/show_loading.dart';

class ProductsController extends GetxController {
  final FireBaseRepo fireBaseRepo;
  // Text Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController irrigationController = TextEditingController();
  TextEditingController fertController = TextEditingController();
  TextEditingController sunController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController moreController = TextEditingController();
  static ProductsController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "products";
  ProductsController({
    required this.fireBaseRepo,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>> getfloweringProducts() {
    return firestore
        .collection(collection)
        .where('flowering', isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getNonfloweringProducts() {
    return firestore
        .collection(collection)
        .where('flowering', isEqualTo: false)
        .snapshots();
  }

  Future<void> uploadProduct(
      {required File image,
      required String imageName,
      required bool flowering}) async {
    if (nameController.text.isNotEmpty &&
        fertController.text.isNotEmpty &&
        irrigationController.text.isNotEmpty &&
        sunController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        quantityController.text.isNotEmpty) {
      await fireBaseRepo.uploadProduct(
          productName: nameController.text,
          irrigation: irrigationController.text,
          fertilization: fertController.text,
          sunLight: sunController.text,
          price: priceController.text.toString(),
          quantity: quantityController.text.toString(),
          imageName: imageName,
          image: image,
          flowering: flowering,
          more: moreController.text);
    } else {
      showSnackBar(title: 'Error', message: 'Please fill all fields');
    }
  }
}
