import 'package:get/get.dart';
import 'package:shatla/screens/registeration_pages/login.dart';
import 'package:shatla/screens/onboarding_screen.dart';
import 'package:shatla/screens/registeration_pages/signup.dart';

class AppRouter {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';

  static String getOnboarding() => onboarding;
  static String getLogin() => login;
  static String getSignup() => signup;

  static List<GetPage> routes = [
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: signup, page: () => SignupScreen()),
  ];
}
