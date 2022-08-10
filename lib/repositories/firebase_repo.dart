import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shatla/data/models/user_model.dart';
import 'package:shatla/constants/firebase_consts.dart';
import 'package:uuid/uuid.dart';

import '../widgets/show_loading.dart';

class FireBaseRepo {
  // Get Current  user id
  Future<String> getUserId() async => auth.currentUser!.uid;

  Future<String> getUserInfo(
      {bool isName = true, bool isPic = false, bool isEmail = false}) async {
    final String uID = await getUserId();
    if (isName) {
      String userName = await firestoreUserRefrence
          .doc(uID)
          .get()
          .then((snapShot) => snapShot['name']);
      return userName;
    } else if (isPic) {
      String url = await firestoreUserRefrence
          .doc(uID)
          .get()
          .then((snapShot) => snapShot['profileURL']);
      return url;
    } else {
      String email = await firestoreUserRefrence
          .doc(uID)
          .get()
          .then((snapShot) => snapShot['email']);
      return email;
    }
  }

  // Sign Up new user
  Future<void> signUp(
      {required String name,
      required String phoneNum,
      required String email,
      required String password}) async {
    try {
      // Firebase Create User
      showLoading();

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
        Get.back();
        showSnackBar(
            title: 'Error', message: 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.back();

        showSnackBar(
            title: 'Error',
            message: 'The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      Get.back();

      showSnackBar(title: 'Error', message: 'Something went wrong!');
      print(e);
    }
  }

  // Sign In
  Future<void> SignIn({required String email, required String password}) async {
    try {
      showLoading();

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed('/main');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.back();

        showSnackBar(title: 'Error', message: 'No user found for that email.');

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.back();

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

  // Future<void> uploadProfilePic(
  //     {required File image, required String imageName}) async {
  //   try {
  //     showLoading();

  //     final uId = await getUserId();

  //     // Upload to storage
  //     var random = Random().nextInt(100000);

  //     Reference storageRef =
  //         fireStorage.ref('Profile_images').child('$random$imageName');
  //     await storageRef.putFile(image);
  //     // Save in FireStore
  //     String picId = await storageRef.getDownloadURL();
  //     await firestoreUserRefrence.doc(uId).update({'profileURL': picId});
  //     Get.offAllNamed('/main');
  //   } catch (e) {
  //     Get.back();
  //     showSnackBar(
  //         title: 'Something went Wrong!', message: "Couldn't upload picture");
  //     print('=============$e==================');
  //   }
  // }

  //upload image to storage
  Future<String> uploadImageToStorage(
      {required String childName,
      required File file,
      required bool isPost}) async {
    try {
      showLoading();
      Reference ref = FirebaseStorage.instance
          .ref()
          .child(childName)
          .child(auth.currentUser!.uid);

      if (isPost) {
        String id = const Uuid().v1();
        ref = ref.child(id);
      }

      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      return await ref.getDownloadURL();
    } catch (e) {
      showSnackBar(
          title: 'Something went Wrong!', message: "Couldn't upload picture");
      print('=============$e==================');
      return "";
    }
  }

  Future<void> uploadPost({
    required File image,
    required String imageName,
    required String text,
    required String userName,
  }) async {
    try {
      showLoading();
      final uId = await getUserId();
      // Upload to storage
      var random = Random().nextInt(100000);

      Reference storageRef =
          fireStorage.ref('posts').child('$random$imageName');
      await storageRef.putFile(image);
      // Save in FireStore
      String picId = await storageRef.getDownloadURL();
      await firestore.collection('posts').doc().set({
        'text': text,
        'user': userName,
        'likes': 0,
        'userID': uId,
        'pictureURL': picId,
        'date': Timestamp.now().toDate().toString()
      });
      Get.offAllNamed('/posts');
    } catch (e) {
      Get.back();
      showSnackBar(
          title: 'Something went Wrong!', message: "Couldn't upload post");
      print('=============$e==================');
    }
  }

  // Upload Comment

  Future<void> uploadComment(
      {required String postID,
      required String userName,
      required String text}) async {
    try {
      showLoading();
      final userID = await getUserId();
      await firestore
          .collection('posts')
          .doc(postID)
          .collection('comments')
          .doc()
          .set({
        'text': text,
        'userName': userName,
        'likes': 0,
        'user': userID,
        'date': Timestamp.now().toDate().toString()
      });
      Get.back();
    } catch (e) {
      Get.back();
      showSnackBar(
          title: 'Something went Wrong!', message: "Couldn't upload comment");
      print('=============$e==================');
    }
  }

  // Like Post
  // Future<void> likePost({required String postID}) async {
  //   final String userID = await getUserId();
  //   bool isLiked = await firestoreUserRefrence
  //       .doc(userID)
  //       .collection('likedPosts')
  //       .doc(postID)
  //       .get()
  //       .then((value) => value.exists);

  //   if (!isLiked) {
  //     await firestoreUserRefrence
  //         .doc(userID)
  //         .collection('likedPosts')
  //         .doc(postID)
  //         .set({});
  //     final int likes = await firestore
  //         .collection('posts')
  //         .doc(postID)
  //         .get()
  //         .then((value) => value['likes']);
  //     await firestore
  //         .collection('posts')
  //         .doc(postID)
  //         .update({'likes': likes + 1});
  //   }
  // }
}
