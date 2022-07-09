import 'package:get/get.dart';
import 'package:shatla/screens/onboarding_screen.dart';

class AppRouter{
static const String onboarding = '/onboarding';

static String getOnboarding() => onboarding;

static List<GetPage> routes = [
  GetPage(name: onboarding, page:()=> const OnboardingScreen())
];


}