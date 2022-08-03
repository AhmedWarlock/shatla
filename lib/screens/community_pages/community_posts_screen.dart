import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_text.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);
  void _showPicture() {
    Get.defaultDialog(
        title: '',
        radius: Dimensions.radiu15,
        backgroundColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(0),
        content: Container(
          height: 300,
          width: double.maxFinite - Dimensions.width20,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.radiu15)),
              image: const DecorationImage(
                  image: AssetImage('assets/images/product.jpg'),
                  fit: BoxFit.cover)),
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
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(Dimensions.height10),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(Icons.person,
                size: Dimensions.isconSize24, color: Colors.grey),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width5),
            child: Row(
              children: [
                IconButton(
                    onPressed: () => Get.toNamed('/add_post'),
                    icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_rounded)),
                const AppMediumText(
                  text: 'Filter',
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, i) {
            // Comment Cards
            return Container(
              margin: EdgeInsets.symmetric(
                  vertical: Dimensions.height5,
                  horizontal: Dimensions.height10),
              height: Dimensions.height120 * 2.15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radiu15))),
              child: Column(
                children: [
                  ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: const AppMediumText(
                        text: 'UserName',
                      ),
                      subtitle: const AppRegText(text: '3 hours ago'),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_sharp))),
                  // Picture Container
                  GestureDetector(
                    onTap: _showPicture,
                    child: Container(
                      height: Dimensions.height120 * 1.1,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/product.jpg'),
                              fit: BoxFit.cover),
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radiu15),
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.thumb_up_alt_outlined)),
                      IconButton(
                          onPressed: () {
                            Get.toNamed("/info");
                          },
                          icon: const Icon(Icons.comment_outlined)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_outline)),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
