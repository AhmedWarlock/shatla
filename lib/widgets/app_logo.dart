import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, required this.size}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage('assets/images/shatla_white.png'),
              fit: BoxFit.cover)),
    );
  }
}
