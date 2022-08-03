import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_icon.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/product.jpg"),
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
              children: const [
                AppIcon(
                  icon: Icons.arrow_back_sharp,
                ),
                AppIcon(icon: Icons.shopping_cart_sharp),
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
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Plant Name",
                    style: TextStyle(
                        fontSize: Dimensions.font26,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Text(
                    "Discription",
                    style: TextStyle(
                      fontSize: Dimensions.font16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      //add to cart
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.height30, vertical: Dimensions.height15),
        padding: EdgeInsets.symmetric(horizontal: Dimensions.height30),
        height: Dimensions.loginContainerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(Dimensions.height30),
        ),
        child: Center(
          child: Text(
            "Add to cart | \$15",
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.font16 * 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
