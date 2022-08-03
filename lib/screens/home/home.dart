import 'package:flutter/material.dart';
import 'package:shatla/screens/home/home_components.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_buttons.dart';
import 'package:shatla/widgets/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(Dimensions.width10),
        children: [
          // Title And profile Picture
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Dimensions.width150,
                child: const AppLargeText(
                  text: 'Find a plant like you',
                ),
              ),
              Container(
                height: Dimensions.height60,
                width: Dimensions.width60,
                decoration: const BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Icon(
                  Icons.account_circle_sharp,
                  size: Dimensions.isconSize24 * 3,
                  color: Colors.white,
                ),
              )
            ],
          ),

          // Search bar
          SizedBox(
            height: Dimensions.height30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: Dimensions.height30 * (40 / 30),
                width: Dimensions.width150 * 2.2,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: AppColors.greyColor.withOpacity(0.8),
                  ),
                ),
              ),
              AppButton(
                onTap: () {},
                height: Dimensions.height30 * (40 / 30),
                width: Dimensions.width50,
                child: const Icon(Icons.search),
              )
            ],
          ),

          // Body
          const HomeBodyWidget()
        ],
      ),
    );
  }
}
