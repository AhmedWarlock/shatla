import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/constants/firebase_consts.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_text.dart';
import 'package:shatla/widgets/nav_drawer.dart';

import 'components/post_card.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
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
      body: StreamBuilder(
        stream: firestore.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.lightGreen),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                QueryDocumentSnapshot post = snapshot.data!.docs[i];
                return PostCardWidget(
                  snapshot: post,
                );
              },
            );
          }
        },
      ),
    );
  }
}
