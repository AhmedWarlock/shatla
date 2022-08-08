import 'package:shatla/constants/controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shatla/data/models/user_model.dart';
import 'package:shatla/constants/firebase_consts.dart';

class FireBaseRepo {
  // Get Current  user id
  Future<String> getUserId() async => auth.currentUser!.uid;

  // Sign Up new user
  Future<void> signUp(
      {required String name,
      required String phoneNum,
      required String email,
      required String password}) async {
    print('CheckPoint1 ==================');

    try {
      // Firebase Create User
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('creted auth user ==================');

      // Create user document
      final id = await getUserId();
      await firestoreUserRefrence.doc(id).get().then((userDoc) {
        final newUserMap =
            UserModel(name: name, phoneNum: phoneNum, id: id, email: email)
                .toDocument();
        if (!userDoc.exists) {
          firestoreUserRefrence.doc(id).set(newUserMap);
          print('created document ==================');
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // Sign Out
  Future<void> signOut() async => await auth.signOut();
}
