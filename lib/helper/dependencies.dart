import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shatla/controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shatla/controllers/posts_controller.dart';
import 'package:shatla/controllers/products_controller.dart';
import 'package:shatla/repositories/firebase_repo.dart';
//Loading dependencies

Future<void> init() async {
  FireBaseRepo fireBaseRepo = FireBaseRepo();
  await Firebase.initializeApp();
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.put(AuthController(fireBaseRepo: fireBaseRepo));
  Get.lazyPut(() => PostsController(fireBaseRepo: FireBaseRepo()), fenix: true);
  Get.lazyPut(() => ProductsController(fireBaseRepo: fireBaseRepo),
      fenix: true);
}
