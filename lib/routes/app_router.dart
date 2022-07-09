import 'package:get/get.dart';
import 'package:shatla/screens/onboarding_screen.dart';

class AppRouter {
  //routes names
  static const String onboarding = '/onboarding';

//methods returns routes names
  static String getOnboarding() => onboarding;

//list of GetPages one for each route
  static List<GetPage> routes = [
    GetPage(name: onboarding, page: () => const OnboardingScreen())
  ];
}
