import 'package:get/get.dart';

//making the app responsive by calculating dimensions for each device

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double height5 = screenHeight / 180;
  static double height10 = screenHeight / 93;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;
  static double height60 = screenHeight / 14;

  static double width5 = screenHeight / 180;
  static double width10 = screenHeight / 93;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;
  static double width60 = screenHeight / 14;

  static double font20 = screenHeight / 42.2;
  static double font12 = screenHeight / 70.2;
  static double font16 = screenHeight / 52.75;
  static double font26 = screenHeight / 32.46;

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
