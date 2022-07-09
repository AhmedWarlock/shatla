

import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/onboarding_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: Dimensions.bottomSheetHeight),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children:const [
            OnboardingPage(
                image: "assets/images/onboarding1.png",
                text:
                    "Planting a tree is one of the easiest ways to improve the environment and beautify your surroundings.",
                textColor: AppColors.blackColor,
                color: AppColors.bbColor),
            OnboardingPage(
                image: 'assets/images/onboarding2.png',
                text:
                    "Our app provides you with all you need to start your green journey",

                textColor: AppColors.blackColor,
                color: AppColors.greyColor),
            OnboardingPage(
                image: "assets/images/onboarding3.jpg",
                text:
                    "Are you ready to get your hands dirty?",
                textColor: AppColors.blackColor,
                color: Colors.white),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? GestureDetector(
            onTap: ()async{
            // SharedPreferences pref = await SharedPreferences.getInstance();
            // pref.setBool("showHome", true);
            },
            child: Container(
              margin:EdgeInsets.symmetric(horizontal: Dimensions.width30,vertical: Dimensions.height15),
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
              height: Dimensions.loginContainerHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.circular(Dimensions.height15),
              ),
              child: Center(
                child: Text("Get Started ",
                   
                style: TextStyle(
                  
                  color: Colors.white,
                  fontSize: Dimensions.font16*1.4,
                  
                ),
                ),
              ),
            ),
          )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
              height: Dimensions.bottomSheetHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text(
                        "SKIP",
                        style: TextStyle(
                            color: AppColors.greenColor,
                            fontSize: Dimensions.font16*1.2,
                            fontWeight: FontWeight.bold),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: SwapEffect(
                          spacing: Dimensions.height15,
                          dotColor: AppColors.greyColor,
                          activeDotColor: AppColors.greenColor,
                        ),
                        onDotClicked: (index) {
                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            color: AppColors.greenColor,
                            fontSize: Dimensions.font16*1.2,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
    );
  }
}
