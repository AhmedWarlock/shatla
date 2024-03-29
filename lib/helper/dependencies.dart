import 'package:get/get.dart';
import 'package:shatla/controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shatla/controllers/posts_controller.dart';
import 'package:shatla/repositories/firebase_repo.dart';
//Loading dependencies

Future<void> init() async {
  await Firebase.initializeApp();

  Get.lazyPut(() => AuthController(fireBaseRepo: FireBaseRepo()), fenix: true);
  Get.lazyPut(() => PostsController(fireBaseRepo: FireBaseRepo()), fenix: true);
}
