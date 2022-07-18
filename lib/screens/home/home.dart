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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
              top: Dimensions.height30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title And profile Picture
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
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
                      size: Dimensions.isconSize24,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    height: Dimensions.height30 * (40 / 30),
                    width: Dimensions.width150 * 2,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20,
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
        ),
      ),
    );
  }
}
