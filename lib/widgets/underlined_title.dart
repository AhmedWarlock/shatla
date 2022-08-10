import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'app_text.dart';

class UnderLinedTitleWidget extends StatelessWidget {
  const UnderLinedTitleWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon),
            SizedBox(
              width: Dimensions.width5,
            ),
            AppMediumText(text: title)
          ],
        ),
        Divider(
          color: AppColors.lightGreen,
          thickness: Dimensions.height5 * 0.4,
          endIndent: Dimensions.width150 * 1.5,
        )
      ],
    );
  }
}
