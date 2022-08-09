import 'package:flutter/material.dart';
import 'package:shatla/screens/home/components/title_more_btn.dart';

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
            height: Dimensions.height20,
          ),
          // Recommended Title
          TitlewithMorebtnWidget(
            title: 'Recommended',
            onMoreTap: () {},
          ),
          SizedBox(
            height: Dimensions.height10,
          ),

          // Recommeded Cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeItemCardsWidget(
                  image: 'assets/images/product.jpg',
                  title: 'Aloe Vera',
                  subtitle: 'Subtitle',
                  onPress: () {
                    Get.toNamed('/product');
                  },
                  price: 440,
                  size: 0.4,
                ),
                HomeItemCardsWidget(
                  image: 'assets/images/product.jpg',
                  title: 'Aloe Vera',
                  subtitle: 'Subtitle',
                  onPress: () {},
                  price: 440,
                  size: 0.4,
                ),
                HomeItemCardsWidget(
                  image: 'assets/images/product.jpg',
                  title: 'Aloe Vera',
                  subtitle: 'Subtitle',
                  onPress: () {},
                  price: 440,
                  size: 0.4,
                ),
              ],
            ),
          ),
          //  Featured Plants
          SizedBox(
            height: Dimensions.height10,
          ),
          TitlewithMorebtnWidget(title: 'Featured Plants', onMoreTap: () {}),
          SizedBox(
            height: Dimensions.height10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeItemCardsWidget(
                  image: 'assets/images/product.jpg',
                  title: 'Aloe Vera',
                  subtitle: 'Subtitle',
                  onPress: () {
                    Get.toNamed('/info');
                  },
                  price: 440,
                  size: 0.8,
                ),
                HomeItemCardsWidget(
                  image: 'assets/images/product.jpg',
                  title: 'Aloe Vera',
                  subtitle: 'Subtitle',
                  onPress: () {},
                  price: 440,
                  size: 0.8,
                ),
                HomeItemCardsWidget(
                  image: 'assets/images/product.jpg',
                  title: 'Aloe Vera',
                  subtitle: 'Subtitle',
                  onPress: () {},
                  price: 440,
                  size: 0.8,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
