import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/app_text.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget(
      {Key? key,
      required this.likes,
      required this.userName,
      required this.pictureUrl,
      required this.profileUrl,
      required this.text})
      : super(key: key);
  final int likes;
  final String userName;
  final String pictureUrl;
  final String profileUrl;
  final String text;

  void _showPicture() {
    Get.defaultDialog(
        title: '',
        radius: Dimensions.radius15,
        backgroundColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(0),
        content: Container(
          height: 300,
          width: double.maxFinite - Dimensions.width20,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.radius15)),
              image: DecorationImage(
                  image: NetworkImage(pictureUrl), fit: BoxFit.cover)),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () => Get.back(),
                icon: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.height5, horizontal: Dimensions.height10),
      height: Dimensions.height120 * 2.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              title: AppMediumText(
                text: userName,
              ),
              subtitle: AppRegText(text: '3 hours ago'),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert_sharp))),
          // Comment Text
          InkWell(
            onTap: () => Get.toNamed('/comment'),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10,
                  vertical: Dimensions.height10),
              child: AppRegText(
                text: text,
                maxLines: 1,
              ),
            ),
          ),
          // Picture Container
          GestureDetector(
            onTap: _showPicture,
            child: Container(
              height: Dimensions.height120 * 1.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(pictureUrl), fit: BoxFit.cover),
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radius15),
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  AppRegText(text: likes.toString()),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_alt_outlined)),
                ],
              ),
              IconButton(
                  onPressed: () => Get.toNamed('/comment'),
                  icon: const Icon(Icons.comment_outlined)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bookmark_outline)),
            ],
          )
        ],
      ),
    );
  }
}
