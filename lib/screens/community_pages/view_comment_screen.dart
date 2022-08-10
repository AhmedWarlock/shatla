import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shatla/controllers/auth_controller.dart';
import 'package:shatla/controllers/posts_controller.dart';
import 'package:shatla/screens/community_pages/components/comment_card.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../constants/firebase_consts.dart';
import '../../widgets/app_text.dart';

class CommentView extends StatelessWidget {
  CommentView({Key? key, required this.snapshot}) : super(key: key);
  final QueryDocumentSnapshot snapshot;
  final PostsController _postsController = Get.find();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    String url = _authController.profileURL!;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        // User Info
        ListTile(
          leading:  CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
          title: AppMediumText(
            text: snapshot['user'],
          ),
          subtitle: AppRegText(text: '3 hours ago'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //POST
              AppRegText(text: snapshot['text']),
              //Image
              Container(
                margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                height: Dimensions.height120 * 2,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius15)),
                    image: DecorationImage(
                      image: NetworkImage(snapshot['pictureURL']),
                    )),
              ),
              //Comments
              StreamBuilder(
                stream: firestore
                    .collection('posts')
                    .doc(snapshot.id)
                    .collection('comments')
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.lightGreen),
                    );
                  } else {
                    return Container(
                      height: Dimensions.height200,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.height10),
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, i) {
                          QueryDocumentSnapshot comment =
                              snapshot.data!.docs[i];
                          return CommentCardWidget(
                              userName: comment['userName'],
                              text: comment['text'],
                              likes: comment['likes']);
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ]),

      // Comment Text Field
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(Dimensions.height10),
        height: Dimensions.height60,
        decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
              topRight: Radius.circular(Dimensions.radius20),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: Dimensions.width150 * 2.2,
                child: TextField(
                  controller: _postsController.commentController,
                )),
            IconButton(
                onPressed: () async {
                  await _authController.getUserInfo();
                  String userName = _authController.userName!;
                  await _postsController.uploadComment(
                      userName: userName, postID: snapshot.id);
                },
                icon: const Icon(Icons.send_rounded)),
          ],
        ),
      ),
    );
  }
}
