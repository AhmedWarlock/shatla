import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';

import '../../../widgets/app_logo.dart';

class HomeScreenHeaderWidget extends StatelessWidget {
  const HomeScreenHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.screenHeight / 5,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width10, bottom: Dimensions.height60),
            height: Dimensions.screenHeight / 5 - Dimensions.height20,
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimensions.radius36),
                bottomRight: Radius.circular(Dimensions.radius36),
              ),
            ),
            child: Row(
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Find a plant\n',
                        style: TextStyle(fontSize: Dimensions.font26),
                        children: [
                      TextSpan(
                          text: 'like you!',
                          style: TextStyle(fontSize: Dimensions.font16))
                    ]))
              ],
            ),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: AppLogo(size: Dimensions.height120 * 0.8)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(Dimensions.width5),
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              height: Dimensions.height45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius20)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: Dimensions.height45,
                        color: AppColors.lightGreen.withOpacity(.23))
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: AppColors.darkGreyColor.withOpacity(.8))),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: AppColors.lightGreen,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
