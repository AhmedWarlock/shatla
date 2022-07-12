import 'package:flutter/material.dart';
import 'package:shatla/utils/dimensions.dart';

class AppTextMedium extends StatelessWidget {
  AppTextMedium({Key? key, required this.text, this.color = Colors.white})
      : super(key: key);
  final String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: Dimensions.font20,
      ),
    );
  }
}
