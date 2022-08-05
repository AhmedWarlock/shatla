import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/helper/dependencies.dart' as dep;
import 'package:shatla/routes/app_router.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.lightGreen),
        scaffoldBackgroundColor: AppColors.greyColor,
        appBarTheme: MyAppBartheme().appBarTheme(),
        inputDecorationTheme: MyInputTheme().theme(),
        fontFamily: 'Quicksandmed',
      ),
      initialRoute: AppRouter.getProdcut(),
      getPages: AppRouter.routes,
    );
  }
}
