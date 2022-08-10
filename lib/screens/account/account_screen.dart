import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/constants/firebase_consts.dart';
import 'package:shatla/controllers/auth_controller.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/account_container.dart';
import 'package:shatla/widgets/nav_drawer.dart';
import 'package:shatla/widgets/show_loading.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Map<String, dynamic>? userData = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    var snap =
        await firestore.collection("users").doc(auth.currentUser!.uid).get();
    setState(() {
      userData = snap.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const NavigationDrawerWidget(),
        body: userData!.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: AppColors.lightGreen,
              ))
            : Column(
                children: [
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage('${userData!['profileURL']}'),
                    radius: Dimensions.radius36 * 3,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  AccountContainer(
                      icon: Icons.person,
                      color: AppColors.lightGreen,
                      text: '${userData!['name']}'),
                  AccountContainer(
                      icon: Icons.email,
                      color: AppColors.lightGreen,
                      text: '${userData!['email']}'),
                  AccountContainer(
                      icon: Icons.phone,
                      color: AppColors.lightGreen,
                      text: "${userData!['phoneNum']}"),
                  Container(
                    height: Dimensions.height45,
                    width: Dimensions.height200,
                    padding: EdgeInsets.all(Dimensions.height10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Colors.white,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        await Get.find<AuthController>().signOut();
                        Get.offNamed("/login");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout_sharp,
                            color: AppColors.lightGreen,
                          ),
                          SizedBox(
                            width: Dimensions.height10,
                          ),
                          Text(
                            "Sign out",
                            style: TextStyle(fontSize: Dimensions.font20),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ));
  }
}
