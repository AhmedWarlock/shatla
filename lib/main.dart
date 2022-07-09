import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/helper/dependencies.dart' as dep;
import 'package:shatla/routes/app_router.dart';

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
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      title: 'Shatla',
     
=======
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
      ),
>>>>>>> 2a0193f75d2f2d9e38f356c0a3b18682d766553b
      initialRoute: AppRouter.getOnboarding(),
      getPages: AppRouter.routes,
    );
  }
}
