import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/app_text.dart';

class HomeItemCardsWidget extends StatelessWidget {
  const HomeItemCardsWidget({
    Key? key,
    required this.image,
    required this.onPress,
    required this.title,
    required this.subtitle,
    this.price,
    required this.size,
  }) : super(key: key);

  final String image;
  final Function() onPress;
  final String title;
  final String subtitle;
  final price;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: Dimensions.width15),
            width: Dimensions.screenWidth * size,
            height: Dimensions.height50 * 3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius15),
                  topRight: Radius.circular(Dimensions.radius15),
                )),
          ),
          Container(
            padding: EdgeInsets.all(Dimensions.height5),
            margin: EdgeInsets.only(left: Dimensions.width15),
            width: Dimensions.screenWidth * size,
            height: Dimensions.height50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimensions.radius15),
                bottomRight: Radius.circular(Dimensions.radius15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '$title\n',
                      style: TextStyle(
                          fontSize: Dimensions.font16, color: Colors.black)),
                  TextSpan(
                      text: subtitle,
                      style: TextStyle(
                          fontSize: Dimensions.font12,
                          color: AppColors.darkGreyColor))
                ])),
                AppRegText(
                  text: '\$$price',
                  color: AppColors.lightGreen,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
