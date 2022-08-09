import 'package:flutter/material.dart';
import 'package:shatla/widgets/nav_drawer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavigationDrawerWidget(),
    );
  }
}
