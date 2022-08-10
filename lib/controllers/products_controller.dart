import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shatla/constants/firebase_consts.dart';

import 'package:shatla/data/models/product.dart';

class ProducsController extends GetxController {
  static ProducsController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "products";

  @override


  Stream<QuerySnapshot<Map<String,dynamic>>> getfloweringProducts() {
      return firestore.collection(collection).where('flowering', isEqualTo: true).snapshots();
  }

    Stream<QuerySnapshot<Map<String,dynamic>>> getNonfloweringProducts() {
      return firestore.collection(collection).where('flowering', isEqualTo: false
      ).snapshots();
  }
}