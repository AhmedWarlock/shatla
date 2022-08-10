import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/app_text.dart';

class TitlewithMorebtnWidget extends StatelessWidget {
  const TitlewithMorebtnWidget({
    Key? key,
    required this.title,
    required this.onMoreTap,
  }) : super(key: key);
  final String title;
  final Function()? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
      child: Row(
        children: [
          //Title
          SizedBox(
              height: Dimensions.height20,
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width5),
                  child: AppMediumText(
                    text: title,
                    isBold: true,
                    size: Dimensions.font16,
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        margin: EdgeInsets.only(right: Dimensions.width5),
                        height: Dimensions.height5 * 1.5,
                        color: AppColors.lightGreen.withOpacity(0.3)))
              ])),
          const Spacer(),
          // More Button
          MaterialButton(
            elevation: 0,
            color: AppColors.lightGreen,
            onPressed: onMoreTap,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius30))),
            child: AppRegText(
              text: 'More',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
