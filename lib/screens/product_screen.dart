import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/screens/information_screen.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_icon.dart';
import 'package:shatla/widgets/app_text.dart';

import '../widgets/underlined_title.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.snapshot}) : super(key: key);
  final QueryDocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //product image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.productImgHeight,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(snapshot['url']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //action icons
          Positioned(
            top: Dimensions.height30 * 1.1,
            left: Dimensions.height20,
            right: Dimensions.height20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_sharp,
                  onPressed: () => Get.back(),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_sharp,
                  onPressed: () {},
                ),
              ],
            ),
          ),

          //product details container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.productImgHeight - Dimensions.height30,
            child: Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius30 * 1.5),
                    topRight: Radius.circular(Dimensions.radius30 * 1.5),
                  ),
                  color: AppColors.greyColor),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          snapshot['name'],
                          style: TextStyle(
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: Dimensions.width15,
                        ),
                        Text(
                          snapshot['flowering']
                              ? '(Flowering)'
                              : '(Non-Flowering)',
                          style: TextStyle(
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const UnderLinedTitleWidget(
                        title: 'Sun Light', icon: Icons.wb_sunny_outlined),
                    AppRegText(text: snapshot['sunLight']),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const UnderLinedTitleWidget(
                        title: 'Irrigation', icon: Icons.water_drop_outlined),
                    AppRegText(text: snapshot['irrigation']),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const UnderLinedTitleWidget(
                        title: 'Fertilization',
                        icon: Icons.local_florist_outlined),
                    AppRegText(text: snapshot['fertilization']),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          elevation: 0,
                          color: AppColors.lightGreen,
                          onPressed: () => Get.to(() => InformationScreen(
                                snapshot: snapshot,
                              )),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dimensions.radius30))),
                          child: AppRegText(
                            text: 'Read more',
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      //add to cart
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.height15 * 2),
        height: Dimensions.bottomHeightBar,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                color: AppColors.darkGreyColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.remove,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  Text(
                    '0',
                    style: TextStyle(fontSize: Dimensions.font22),
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.lightGreen,
              ),
              child: Text(
                "\$${snapshot['price']} | Add to cart",
                style: TextStyle(
                  fontSize: Dimensions.font20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
