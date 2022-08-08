import 'package:get/get.dart';
import 'package:shatla/screens/add_product_screen.dart';
import 'package:shatla/screens/community_pages/add_post_screen.dart';
import 'package:shatla/screens/cart/cart_screen.dart';
import 'package:shatla/screens/community_pages/community_posts_screen.dart';
import 'package:shatla/screens/community_pages/view_comment_screen.dart';
import 'package:shatla/screens/information_screen.dart';
import 'package:shatla/screens/main_screen.dart';
import 'package:shatla/screens/onboarding_screen.dart';
import 'package:shatla/screens/product_screen.dart';
import 'package:shatla/screens/registeration_pages/add_profile_pic.dart';
import 'package:shatla/screens/registeration_pages/login_screen.dart';
import 'package:shatla/screens/registeration_pages/signup_screen.dart';
import 'package:shatla/screens/splash/splash_screen.dart';

class AppRouter {
  //routes names
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String main = '/main';
  static const String cart = '/cart';
  static const String product = '/product';
  static const String info = '/info';
  static const String posts = '/posts';
  static const String comment = '/comment';
  static const String addPost = '/add_post';
  static const String addProduct = '/add_product';
  static const String splash = '/splash';
  static const String proPic = '/picture';

//methods returns routes names
  static String getOnboarding() => onboarding;
  static String getLogin() => login;
  static String getSignup() => signup;
  static String getMain() => main;
  static String getCart() => cart;
  static String getProdcut() => product;
  static String getInfo() => info;
  static String getPosts() => posts;
  static String getComment() => comment;
  static String getAddPost() => addPost;
  static String getAddProduct() => addProduct;
  static String getSplash() => splash;
  static String getProPic() => proPic;

//list of GetPages one for each route
  static List<GetPage> routes = [
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => SignupScreen()),
    GetPage(name: main, page: () => const MainPage()),
    GetPage(name: cart, page: () => const CartScreen()),
    GetPage(name: product, page: () => const ProductScreen()),
    GetPage(name: info, page: () => const InformationScreen()),
    GetPage(name: posts, page: () => const PostsScreen()),
    GetPage(name: comment, page: () => const CommentView()),
    GetPage(name: addPost, page: () => const AddPostScreen()),
    GetPage(name: addProduct, page: () => const AddProductScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: proPic, page: () => const AddProfilePicture()),
  ];
}
