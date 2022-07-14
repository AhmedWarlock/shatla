import 'package:get/get.dart';
import 'package:shatla/screens/home/home.dart';
import 'package:shatla/screens/onboarding_screen.dart';
import 'package:shatla/screens/registeration_pages/login.dart';
import 'package:shatla/screens/registeration_pages/signup.dart';

import '../screens/registeration_pages/login.dart';
import '../screens/registeration_pages/signup.dart';

class AppRouter {
  //routes names
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';

//methods returns routes names
  static String getOnboarding() => onboarding;
  static String getLogin() => login;
  static String getSignup() => signup;
  static String getHome() => home;

//list of GetPages one for each route
  static List<GetPage> routes = [
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: signup, page: () => SignupScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
  ];
}
