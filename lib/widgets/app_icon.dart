import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';

import 'package:shatla/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;

  const AppIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height30 * 1.2,
      width: Dimensions.height30 * 1.2,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(Dimensions.height10 / 2),
      ),
      child: Center(
          child: Icon(
        icon,
        size: Dimensions.isconSize24,
      )),
    );
  }
}
