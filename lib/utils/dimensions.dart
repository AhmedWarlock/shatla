import 'package:get/get.dart';

//making the app responsive by calculating dimensions for each device

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double height5 = screenHeight / 136;
  static double height10 = screenHeight / 68.3;
  static double height15 = screenHeight / 45.56;
  static double height20 = screenHeight / 34.17;
  static double height30 = screenHeight / 22.78;
  static double height45 = screenHeight / 15.18;
  static double height50 = screenHeight / 13.668;
  static double height60 = screenHeight / 11.4;

  static double width5 = screenWidth / 82.28;
  static double width10 = screenWidth / 41.1;
  static double width15 = screenWidth / 27.4;
  static double width20 = screenWidth / 20.57;
  static double width30 = screenWidth / 13.7;
  static double width45 = screenWidth / 9.14;
  static double width50 = screenWidth / 8.228;
  static double width60 = screenWidth / 6.8566;
  static double width150 = screenWidth / 2.74;

  static double font12 = screenHeight / 57.5;
  static double font16 = screenHeight / 43.125;
  static double font20 = screenHeight / 34.46;
  static double font22 = screenHeight / 31.363636;
  static double font26 = screenHeight / 26.538;

  static double radius6 = screenHeight / 140.67;
  static double radiu20 = screenHeight / 42.2;
  static double radiu15 = screenHeight / 56.27;
  static double radius30 = screenHeight / 28.13;

  static double bottomSheetHeight = screenHeight / 8.5;
  static double loginContainer = screenHeight / 2;
  static double loginContainerHeight = screenHeight / 14;

  static double isconSize24 = screenHeight / 35.17;
  static double isconSize16 = screenHeight / 52.7;
}
