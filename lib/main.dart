import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/helper/dependencies.dart' as dep;
<<<<<<< HEAD
import 'package:shatla/routes/route_helper.dart';
import 'package:shatla/screens/registeration_pages/login.dart';
import 'package:shatla/utils/style.dart';
=======
import 'package:shatla/routes/app_router.dart';
>>>>>>> 52f57be033ce80dc9577486ceb32f452ba83f05d

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
<<<<<<< HEAD
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: MyInputTheme().theme(),
        fontFamily: 'Quicksandmed',
=======
      title: 'Shatla',
      theme: ThemeData(
        fontFamily: 'Roboto',
>>>>>>> 52f57be033ce80dc9577486ceb32f452ba83f05d
      ),
      initialRoute: AppRouter.getLogin(),
      getPages: AppRouter.routes,
    );
  }
}
