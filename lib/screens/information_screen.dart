import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/utils/sample_text.dart';
import 'package:shatla/widgets/app_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/app_icon.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/product.jpg"),
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
                  color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppMediumText(
                      text: 'Light ',
                      color: AppColors.darkGreyColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const AppRegText(text: sampleText),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    const AppMediumText(
                      text: 'Water',
                      color: AppColors.darkGreyColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const AppRegText(text: sampleText),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    const AppMediumText(
                      text: 'Fertilizer',
                      color: AppColors.darkGreyColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const AppRegText(text: sampleText),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    const AppMediumText(
                      text: 'Temprature',
                      color: AppColors.darkGreyColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const AppRegText(text: sampleText),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    const AppMediumText(
                      text: 'Humidity',
                      color: AppColors.darkGreyColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const AppRegText(text: sampleText),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    const AppMediumText(
                      text: 'Flowering',
                      color: AppColors.darkGreyColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const AppRegText(text: sampleText),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    const AppMediumText(
                      text: 'Soil',
                      color: AppColors.darkGreyColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const AppRegText(text: sampleText),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    const AppMediumText(
                      text: 'Pot size',
                      color: AppColors.darkGreyColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    const AppRegText(text: sampleText),
                    SizedBox(
                      height: Dimensions.height5,
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
                  const AppMediumText(
                    text: 'ALOE VERA',
                    color: Colors.white,
                    isBold: true,
                  ),
                  const AppRegText(
                    text: 'Medicine Plant',
                    color: AppColors.greyColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      AppRegText(
                        text: ' 248 likes',
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
