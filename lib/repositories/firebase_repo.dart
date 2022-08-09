import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shatla/data/models/user_model.dart';
import 'package:shatla/constants/firebase_consts.dart';

import '../widgets/show_loading.dart';

class FireBaseRepo {
  // Get Current  user id
  Future<String> getUserId() async => auth.currentUser!.uid;

  // Sign Up new user
  Future<void> signUp(
      {required String name,
      required String phoneNum,
      required String email,
      required String password}) async {
    try {
      // Firebase Create User
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user document
      final id = await getUserId();
      await firestoreUserRefrence.doc(id).get().then((userDoc) {
        final newUserMap =
            UserModel(name: name, phoneNum: phoneNum, id: id, email: email)
                .toJson();
        if (!userDoc.exists) {
          firestoreUserRefrence.doc(id).set(newUserMap);
        }
        Get.offAllNamed('/picture');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(
            title: 'Error', message: 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(
            title: 'Error',
            message: 'The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      showSnackBar(title: 'Error', message: 'Something went wrong!');
      print(e);
    }
  }

  // Sign In
  Future<void> SignIn({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed('/main');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(title: 'Error', message: 'No user found for that email.');

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(
            title: 'Error', message: 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await auth.signOut();
    Get.offAllNamed('/login');
  }

  Future<void> uploadProfilePic(File image) async {
    try {
      showLoading();

      final uId = await getUserId();
      // Upload to storage
      var name = basename(image.path);
      var random = Random().nextInt(100000);
      name = '$random$name';
      Reference storageRef = fireStorage.ref('Profile_images').child(name);
      await storageRef.putFile(image);
      // Save in FireStore
      String picId = await storageRef.getDownloadURL();
      await firestoreUserRefrence.doc(uId).update({'profileURL': picId});
      Get.offAllNamed('/main');
    } catch (e) {
      showSnackBar(
          title: 'Something went Wrong!', message: "Couldn't upload picture");
      print('=============$e==================');
    }
  }
}
