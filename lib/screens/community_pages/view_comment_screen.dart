import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/utils/smaple_text.dart';

import '../../widgets/app_text.dart';

class CommentView extends StatelessWidget {
  const CommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        // User Info
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
          ),
          title: AppMediumText(
            text: 'UserName',
          ),
          subtitle: AppRegText(text: '3 hours ago'),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
          child: Column(
            children: [
              //POST
              const AppRegText(text: sampleText2),
              //Image
              Container(
                margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                height: Dimensions.height120,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius15)),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/product.jpg'),
                        fit: BoxFit.cover)),
              ),
              //Comments
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          left: Dimensions.width10,
                          bottom: Dimensions.height60,
                          right: Dimensions.width10),
                      child: const CircleAvatar(
                        backgroundColor: AppColors.darkGreyColor,
                      )),
                  Expanded(
                    child: Container(
                      height: Dimensions.height120 * 0.8,
                      padding: EdgeInsets.all(Dimensions.width10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius15),
                            bottomLeft: Radius.circular(Dimensions.radius15),
                            bottomRight: Radius.circular(Dimensions.radius15),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppMediumText(text: 'User'),
                          const AppRegText(
                            text: 'diufghdisughsdihu',
                            color: AppColors.darkGreyColor,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.thumb_up_alt_outlined,
                              size: Dimensions.isconSize24,
                            ),
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
              topLeft: Radius.circular(Dimensions.radius30),
              topRight: Radius.circular(Dimensions.radius30),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: Dimensions.width150 * 2.2, child: const TextField()),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send_rounded)),
          ],
        ),
      ),
    );
  }
}
