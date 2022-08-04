import 'package:flutter/material.dart';
import 'package:shatla/screens/home/components/home_header.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_buttons.dart';
import 'package:shatla/widgets/app_text.dart';

class Unused extends StatelessWidget {
  const Unused({Key? key}) : super(key: key);

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
                    fillColor: Colors.white.withOpacity(0.8),
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
          Container(
            padding: EdgeInsets.symmetric(vertical: Dimensions.width15),
            width: double.maxFinite,
            height: Dimensions.height10 * 47,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, i) {
                  // Main Container
                  return Container(
                    padding: EdgeInsets.all(Dimensions.width15),
                    margin: EdgeInsets.symmetric(
                      vertical: Dimensions.height10,
                    ),
                    width: Dimensions.width60,
                    height: Dimensions.height50 * 2,
                    //Decoration
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: AppColors.lightGreen.withOpacity(0.3),
                        //       offset:
                        //           Offset(-Dimensions.width5, Dimensions.height5),
                        //       blurRadius: 3,
                        //       spreadRadius: 2)
                        // ],
                        // gradient: const LinearGradient(
                        //     colors: [Colors.white, AppColors.greyColor],
                        //     begin: Alignment.topCenter,
                        //     end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title and number of plants
                        Container(
                          padding: const EdgeInsets.all(0),
                          width: Dimensions.width60 * 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppMediumText(text: 'Decorative Plant'),
                              SizedBox(
                                height: Dimensions.height15,
                              ),
                              AppRegText(
                                text: '$i Plants',
                              )
                            ],
                          ),
                        ),

                        // Picture Container
                        Container(
                          height: Dimensions.height60 * 2.3,
                          width: Dimensions.width60 * 1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dimensions.radius20)),
                              image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/product.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
