import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shatla/controllers/products_controller.dart';
import 'package:shatla/data/models/product.dart';
import 'package:shatla/screens/home/components/title_more_btn.dart';
import 'package:shatla/screens/home/product_grid.dart';
import 'package:shatla/screens/product_screen.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/widgets/app_text.dart';

import '../../utils/dimensions.dart';
import '../../widgets/nav_drawer.dart';
import 'components/home_cards.dart';
import 'components/home_header.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<ProductModel>? floweringProducts;
  List<ProductModel>? nonFloweringProducts;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () => Get.toNamed('add_product'),
      ),
      drawer: const NavigationDrawerWidget(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          // Header Widget
          const HomeScreenHeaderWidget(),
          SizedBox(
            height: Dimensions.height10,
          ),
          // Products Text
          SizedBox(
              height: Dimensions.height20,
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width5),
                  child: AppMediumText(
                    text: 'Products',
                    isBold: true,
                    size: Dimensions.font20,
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        margin: EdgeInsets.only(right: Dimensions.width5),
                        height: Dimensions.height5,
                        color: AppColors.lightGreen.withOpacity(0.4)))
              ])),
          SizedBox(
            height: Dimensions.height10,
          ),

          // Recommeded Cards
          StreamBuilder(
              stream: _productsController.getfloweringProducts(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.lightGreen,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      // Recommended Title
                      TitlewithMorebtnWidget(
                        title: 'Flowering ',
                        onMoreTap: () => Get.to(() => ProductGrid(
                              snapshots: snapshot.data!.docs,
                            )),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SizedBox(
                        height: Dimensions.height200 * 1.1,
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            QueryDocumentSnapshot snap = snapshot.data!.docs[i];
                            return HomeItemCardsWidget(
                              image: '${snap["url"]}',
                              title: '${snap["name"]}',
                              subtitle: 'flowering',
                              onPress: () =>
                                  Get.to(() => ProductScreen(snapshot: snap)),
                              price: '${snap["price"]}',
                              size: 0.43,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              }),
          //  Featured Plants

          SizedBox(
            height: Dimensions.height10,
          ),

          StreamBuilder(
              stream: _productsController.getNonfloweringProducts(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.lightGreen,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      TitlewithMorebtnWidget(
                          title: 'Non Flowering',
                          onMoreTap: () => Get.to(() =>
                              ProductGrid(snapshots: snapshot.data!.docs))),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SizedBox(
                        height: Dimensions.height200 * 1.1,
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            QueryDocumentSnapshot snap = snapshot.data!.docs[i];
                            return HomeItemCardsWidget(
                              image: '${snap["url"]}',
                              title: '${snap["name"]}',
                              subtitle: 'non-flowering',
                              onPress: () =>
                                  Get.to(() => ProductScreen(snapshot: snap)),
                              price: '${snap["price"]}',
                              size: 0.43,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              }),
        ],
      )),
    );
  }
}
