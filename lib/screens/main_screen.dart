import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shatla/screens/community_pages/community_posts_screen.dart';
import 'package:shatla/screens/home/components/unused.dart';
import 'package:shatla/screens/home/home_screen.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [const HomeScreen(), const PostsScreen()];
  final int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: SizedBox(
        height: Dimensions.height60,
        child: GNav(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
            backgroundColor: AppColors.greyColor,
            tabs: [
              GButton(
                gap: Dimensions.width10,
                icon: Icons.home_rounded,
                text: 'Home',
              ),
              GButton(
                gap: Dimensions.width10,
                icon: Icons.home_rounded,
                text: 'Home',
              ),
              GButton(
                gap: Dimensions.width10,
                icon: Icons.home_rounded,
                text: 'Home',
              ),
              GButton(
                gap: Dimensions.width10,
                icon: Icons.account_circle,
                text: 'Profile',
              ),
            ]),
      ),
    );
  }
}
