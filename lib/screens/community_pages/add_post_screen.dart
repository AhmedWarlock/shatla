import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../widgets/app_text.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
          child: Column(children: [
            // User Info
            ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: const AppMediumText(
                  text: 'UserName',
                ),
                trailing: IconButton(
                    onPressed: () => Get.back(),
                    icon: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.darkGreyColor,
                      ),
                    ))),
            // Input Field
            Container(
              width: double.maxFinite,
              height: Dimensions.height250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.attach_file,
                            color: AppColors.darkGreyColor,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt,
                            color: AppColors.darkGreyColor,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions_outlined,
                              color: AppColors.darkGreyColor)),
                    ],
                  )
                ],
              ),
              // Options
            ),
          ]),
        ),
      ),
    );
  }
}
