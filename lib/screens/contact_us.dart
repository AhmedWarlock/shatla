import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_logo.dart';
import 'package:shatla/widgets/app_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shatla/widgets/nav_drawer.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavigationDrawerWidget(),
      body: SafeArea(
          child: Row(
        children: [
          Container(
            height: Dimensions.screenHeight,
            width: Dimensions.screenWidth * 0.4,
            color: AppColors.lightGreen,
            child: Center(
                child: AppLogo(
              size: Dimensions.height200,
            )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width15, vertical: Dimensions.height120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppLargeText(
                  text: 'Contact Us',
                  isBold: true,
                ),
                SizedBox(
                  height: Dimensions.height45,
                ),
                Row(
                  children: [
                    const Icon(Icons.mail_sharp),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    const AppRegText(text: 'shatla_app@shatla.info')
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Row(
                  children: [
                    const Icon(Icons.call_rounded),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    const AppRegText(text: '+249 999422212')
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.facebook),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    const AppRegText(text: 'ShatlaApp')
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.twitter),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    const AppRegText(text: '@ShatlaApp')
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Row(
                  children: [
                    const Icon(Icons.location_pin),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    const AppRegText(
                        text: 'Savannah Innovation\n Labs, Khartoum')
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
