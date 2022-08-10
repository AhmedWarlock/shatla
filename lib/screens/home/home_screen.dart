import 'package:flutter/material.dart';
import 'package:shatla/screens/home/components/title_more_btn.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/widgets/app_text.dart';

import '../../utils/dimensions.dart';
import '../../widgets/nav_drawer.dart';
import 'components/home_cards.dart';
import 'components/home_header.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
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
          // Recommended Title
          TitlewithMorebtnWidget(
            title: 'Flowering ',
            onMoreTap: () {},
          ),
          SizedBox(
            height: Dimensions.height10,
          ),

          // Recommeded Cards
          SizedBox(
            height: Dimensions.height200 * 1.1,
            width: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, i) {
                return HomeItemCardsWidget(
                  image: 'assets/images/product.jpg',
                  title: 'Aloe Vera',
                  subtitle: 'Subtitle',
                  onPress: () {
                    Get.toNamed('/product');
                  },
                  price: 440,
                  size: 0.4,
                );
              },
            ),
          ),
          //  Featured Plants
          SizedBox(
            height: Dimensions.height10,
          ),
          TitlewithMorebtnWidget(title: 'Non Flowering', onMoreTap: () {}),
          SizedBox(
            height: Dimensions.height10,
          ),
          SizedBox(
            height: Dimensions.height200 * 1.1,
            width: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, i) {
                return HomeItemCardsWidget(
                  image: 'assets/images/product.jpg',
                  title: 'Aloe Vera',
                  subtitle: 'Subtitle',
                  onPress: () {
                    Get.toNamed('/info');
                  },
                  price: 440,
                  size: 0.8,
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
