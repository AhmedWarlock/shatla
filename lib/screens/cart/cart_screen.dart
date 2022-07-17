import 'package:flutter/material.dart';

import 'package:shatla/utils/dimensions.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 2.3,
              left: Dimensions.height20,
              right: Dimensions.height20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back_ios),
                  Text(
                    "Cart",
                    style: TextStyle(
                        fontSize: Dimensions.font20 * 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.shopping_cart_checkout_outlined),
                ],
              )),

        ],
      ),
    );
  }
}
