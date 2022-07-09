import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/helper/dependencies.dart' as dep;
import 'package:shatla/routes/route_helper.dart';
import 'package:shatla/screens/login.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Pacifico",
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      // initialRoute: AppRouter.getOnboarding(),
      getPages: AppRouter.routes,
    );
  }
}
