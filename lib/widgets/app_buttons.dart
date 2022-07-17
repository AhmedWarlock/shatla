import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.child,
      this.backgroundColor = AppColors.lightGreen,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.onTap})
      : super(key: key);
  final double height;
  final double width;
  final Color backgroundColor;
  final Widget child;
  final double borderRadius;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius:
                BorderRadius.all(Radius.circular(Dimensions.radiu20))),
        padding: EdgeInsets.all(Dimensions.width5),
        child: Center(child: child),
      ),
    );
  }
}
