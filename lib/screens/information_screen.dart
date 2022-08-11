import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/utils/sample_text.dart';
import 'package:shatla/widgets/app_text.dart';
import 'package:shatla/widgets/underlined_title.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/app_icon.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key, required this.snapshot}) : super(key: key);
  final QueryDocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Item Image
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
          // Top Buttons
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

          // Details container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.productImgHeight - Dimensions.height30,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.height20,
                  right: Dimensions.height20,
                  bottom: Dimensions.height20,
                  top: Dimensions.height45),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius30 * 1.2),
                    topRight: Radius.circular(Dimensions.radius30 * 1.2),
                  ),
                  color: AppColors.greyColor),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UnderLinedTitleWidget(
                        title: 'Sun Light ', icon: Icons.wb_sunny_outlined),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    AppRegText(text: snapshot['sunLight']),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    const UnderLinedTitleWidget(
                        title: 'Irrigation', icon: Icons.water_drop_outlined),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    AppRegText(text: snapshot['irrigation']),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    const UnderLinedTitleWidget(
                        title: 'Fertilization',
                        icon: Icons.local_florist_outlined),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    AppRegText(text: snapshot['fertilization']),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    // More Info Section
                    snapshot['more'] != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const UnderLinedTitleWidget(
                                  title: 'More Info', icon: Icons.info_outline),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              AppRegText(text: snapshot['more']),
                            ],
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                  ],
                ),
              ),
            ),
          ),
          // Header Contaier
          Positioned(
            left: 30,
            right: 30,
            top: Dimensions.productImgHeight - Dimensions.height60 * 1.8,
            height: Dimensions.height120,
            child: Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        offset: Offset(0, Dimensions.height5),
                        blurRadius: 5,
                        spreadRadius: 1)
                  ],
                  borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius30 * 1.2)),
                  color: AppColors.lightGreen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppMediumText(
                    text: snapshot['name'],
                    color: Colors.white,
                    isBold: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      AppRegText(
                        text: ' ${Random().nextInt(100)} likes',
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
