import 'package:get/get.dart';
import 'package:shatla/screens/cart/cart_screen.dart';
import 'package:shatla/screens/home/home.dart';
import 'package:shatla/screens/onboarding_screen.dart';
import 'package:shatla/screens/product_screen.dart';
import 'package:shatla/screens/registeration_pages/login.dart';
import 'package:shatla/screens/registeration_pages/signup.dart';
import 'package:shatla/screens/splash/splash_screen.dart';

class AppRouter {
  //routes names
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String product = '/product';
  static const String splash = '/splash';

//methods returns routes names
  static String getOnboarding() => onboarding;
  static String getLogin() => login;
  static String getSignup() => signup;
  static String getHome() => home;
  static String getCart() => cart;
  static String getProdcut() => product;
  static String getSplash() => splash;

//list of GetPages one for each route
  static List<GetPage> routes = [
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: signup, page: () => SignupScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: cart, page: () => const CartScreen()),
    GetPage(name: product, page: () => const ProductScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
  ];
}
