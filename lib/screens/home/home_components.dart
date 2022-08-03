import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_text.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: AppColors.greyColor,
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
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius30))),
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
                            Radius.circular(Dimensions.radiu20)),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/product.jpg'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
