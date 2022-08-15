import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shatla/controllers/products_controller.dart';
import 'package:shatla/screens/home/components/home_cards.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:get/get.dart';

import '../product_screen.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key, required this.snapshots}) : super(key: key);
  final List<QueryDocumentSnapshot> snapshots;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width5, vertical: Dimensions.height15),
        child: Column(
          children: [
            // Search

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: Dimensions.isconSize24 * 1.8,
                    )),
                SizedBox(
                    width: Dimensions.screenWidth * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.radius20)),
                            borderSide: BorderSide(
                                color:
                                    AppColors.darkGreyColor.withOpacity(0.5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.radius20)),
                            borderSide: BorderSide(
                                color:
                                    AppColors.darkGreyColor.withOpacity(0.5))),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),

            // Grid
            SizedBox(
              height: Dimensions.height250 * 2.25,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: Dimensions.height10, crossAxisCount: 2),
                itemCount: snapshots.length,
                itemBuilder: (context, i) {
                  QueryDocumentSnapshot snap = snapshots[i];
                  return HomeItemCardsWidget(
                    image: '${snap["url"]}',
                    title: '${snap["name"]}',
                    subtitle: 'flowering',
                    onPress: () => Get.to(() => ProductScreen(snapshot: snap)),
                    price: '${snap["price"]}',
                    size: 0.5,
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
