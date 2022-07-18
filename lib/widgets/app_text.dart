import 'package:flutter/material.dart';
import 'package:shatla/utils/dimensions.dart';

class AppMediumText extends StatelessWidget {
  const AppMediumText(
      {Key? key, required this.text, this.color = Colors.black, this.size})
      : super(key: key);
  final String text;
  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size ?? Dimensions.font22,
      ),
    );
  }
}

class AppLargeText extends StatelessWidget {
  const AppLargeText(
      {Key? key, required this.text, this.color = Colors.black, this.size})
      : super(key: key);
  final String text;
  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size ?? Dimensions.font26,
      ),
    );
  }
}

class AppRegText extends StatelessWidget {
  const AppRegText(
      {Key? key, required this.text, this.color = Colors.black, this.size})
      : super(key: key);
  final String text;
  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size ?? Dimensions.font16,
      ),
    );
  }
}
