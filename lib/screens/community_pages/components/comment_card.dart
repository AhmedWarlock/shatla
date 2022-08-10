import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/app_text.dart';

class CommentCardWidget extends StatelessWidget {
  const CommentCardWidget(
      {Key? key,
      required this.userName,
      required this.text,
      required this.likes})
      : super(key: key);
  final String userName;
  final String text;
  final int likes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width10,
                    bottom: Dimensions.height60,
                    right: Dimensions.width10),
                child: const CircleAvatar(
                  backgroundColor: AppColors.darkGreyColor,
                )),
            // Commnet bubble
            Expanded(
              child: Container(
                height: Dimensions.height120 * 0.86,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.width5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius15),
                      bottomLeft: Radius.circular(Dimensions.radius15),
                      bottomRight: Radius.circular(Dimensions.radius15),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppMediumText(text: userName),
                    AppRegText(
                      text: text,
                      color: AppColors.darkGreyColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppRegText(text: likes.toString()),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.thumb_up_alt_outlined,
                              size: Dimensions.isconSize24,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Divider(
          color: AppColors.darkGreyColor,
          thickness: 1.5,
          indent: Dimensions.width45,
        ),
      ],
    );
  }
}
