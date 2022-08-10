import 'package:flutter/material.dart';
import 'package:shatla/controllers/auth_controller.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_text.dart';
import 'package:get/get.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

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
              _buildHeader(),
              _buildDrawerItem(
                  icon: Icons.home_filled,
                  name: 'Home',
                  onTap: () => Get.offNamed('/main')),
              _buildDrawerItem(
                  icon: Icons.person,
                  name: 'Profile',
                  onTap: () => Get.offNamed('/account')),
              _buildDrawerItem(
                  icon: Icons.people_alt_sharp,
                  name: 'Community',
                  onTap: () => Get.offNamed('/posts')),
              _buildDrawerItem(
                  icon: Icons.settings, name: 'Settings', onTap: () {}),
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

Widget _buildHeader() => InkWell(
      onTap: () => Get.offNamed('account'),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height45),
        child: Row(
          children: [
            CircleAvatar(
              radius: Dimensions.height30,
              backgroundColor: Colors.white,
            ),
            SizedBox(width: Dimensions.width10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppLargeText(
                  text: 'Name',
                  color: AppColors.greyColor,
                ),
                const SizedBox(height: 4),
                AppRegText(
                  text: 'ahmed@gmail.com',
                  color: AppColors.greyColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
