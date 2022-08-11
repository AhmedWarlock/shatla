import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shatla/controllers/auth_controller.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_text.dart';
import 'package:get/get.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppColors.lightGreen,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width15, vertical: Dimensions.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(
                  url: _authController.profileURL!,
                  name: _authController.userName!,
                  email: _authController.email!),
              _buildDrawerItem(
                  icon: Icons.home_filled,
                  name: 'Home',
                  onTap: () => Get.offNamed('/main')),
              _buildDrawerItem(
                  icon: Icons.people_alt_sharp,
                  name: 'Community',
                  onTap: () => Get.offNamed('/posts')),
              _buildDrawerItem(
                  icon: FontAwesomeIcons.motorcycle,
                  name: 'My Orders',
                  onTap: () => Get.offNamed('/orders')),
              _buildDrawerItem(
                  icon: Icons.settings, name: 'Settings', onTap: () {}),
              _buildDrawerItem(
                  icon: Icons.book,
                  name: 'Contact us',
                  onTap: () => Get.offNamed('/contact')),
              const Spacer(),
              Divider(
                color: Colors.white,
                thickness: Dimensions.height5 * 0.2,
              ),
              IconButton(
                  onPressed: () async {
                    await Get.find<AuthController>().signOut();
                  },
                  icon: const Icon(
                    Icons.logout_sharp,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDrawerItem(
    {required IconData icon,
    required String name,
    required VoidCallback onTap}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.white,
    ),
    title: AppMediumText(
      text: name,
      color: Colors.white,
    ),
    onTap: onTap,
  );
}

Widget _buildHeader(
        {required String url, required String name, required String email}) =>
    InkWell(
      onTap: () => Get.offNamed('account'),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height45),
        child: Row(
          children: [
            CircleAvatar(
              radius: Dimensions.height30,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(url),
            ),
            SizedBox(width: Dimensions.width10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLargeText(
                  text: name,
                  color: AppColors.greyColor,
                ),
                const SizedBox(height: 4),
                AppRegText(
                  text: email,
                  color: AppColors.greyColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
