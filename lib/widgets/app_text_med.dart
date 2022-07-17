import 'package:flutter/material.dart';
import 'package:shatla/utils/dimensions.dart';

class AppTextMedium extends StatelessWidget {
  const AppTextMedium({Key? key, required this.text, this.color = Colors.white})
      : super(key: key);
  final String text;
  final Color color;

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
