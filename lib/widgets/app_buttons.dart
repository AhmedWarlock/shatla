import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.child,
      this.backgroundColor = AppColors.lightGreen,
      this.height,
      this.width,
      this.borderRadius = 4343.009,
      required this.onTap})
      : super(key: key);
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Widget child;
  final double borderRadius;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? Dimensions.height50 * (55 / 50),
        width: width ?? Dimensions.width50 * (55 / 50),
        padding: EdgeInsets.all(Dimensions.width5),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(
                borderRadius == 4343.009 ? Dimensions.radiu15 : borderRadius))),
        child: Center(child: child),
      ),
    );
  }
}
