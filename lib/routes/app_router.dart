import 'package:get/get.dart';
import 'package:shatla/screens/onboarding_screen.dart';

class AppRouter {
  //routes names
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';

//methods returns routes names
  static String getOnboarding() => onboarding;
  static String getLogin() => login;
  static String getSignup() => signup;

//list of GetPages one for each route
  static List<GetPage> routes = [
    GetPage(
      name: onboarding,
      page: () => const OnboardingScreen(),
      GetPage(name: login, page: () => LoginScreen()),
      GetPage(name: signup, page: () => SignupScreen()),
    )
  ];
}
