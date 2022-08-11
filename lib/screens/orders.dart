import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_text.dart';
import 'package:shatla/widgets/nav_drawer.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _currentPage = 0;
  final List<Widget> _list = [
    Container(
      padding: EdgeInsets.all(Dimensions.height15),
      height: Dimensions.height200 * 0.8,
      width: Dimensions.screenWidth * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppMediumText(text: 'Hibiscus'),
              AppMediumText(text: 'x2'),
            ],
          ),
          AppRegText(
            text: '2022-07-12',
            color: AppColors.darkGreyColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppMediumText(
                text: 'Total   \$34',
                color: AppColors.lightGreen,
              ),
              Container(
                height: Dimensions.height60 * 1.4,
                width: Dimensions.width60 * 1.4,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.darkGreyColor, width: 2),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/shatla-a4c23.appspot.com/o/products%2FHibiscus.jpg?alt=media&token=7a2c9f95-1f7f-4df3-aa97-42a0297b90d8'),
                        fit: BoxFit.cover),
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius15))),
              )
            ],
          )
        ],
      ),
    ),
    SizedBox(
      height: Dimensions.height20,
    ),
    //=====================================================
    Container(
      padding: EdgeInsets.all(Dimensions.height15),
      height: Dimensions.height200 * 0.8,
      width: Dimensions.screenWidth * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppMediumText(text: 'Dieffenbachia'),
              AppMediumText(text: 'x1'),
            ],
          ),
          AppRegText(
            text: '2022-06-20',
            color: AppColors.darkGreyColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppMediumText(
                text: 'Total   \$15',
                color: AppColors.lightGreen,
              ),
              Container(
                height: Dimensions.height60 * 1.4,
                width: Dimensions.width60 * 1.4,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.darkGreyColor, width: 2),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/shatla-a4c23.appspot.com/o/products%2FDieffenbachia.jpg?alt=media&token=7b74976c-d2b1-4d29-906b-3cfcb86a5706'),
                        fit: BoxFit.cover),
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius15))),
              )
            ],
          )
        ],
      ),
    ),
    SizedBox(
      height: Dimensions.height20,
    ),

    //=====================================================
    Container(
      padding: EdgeInsets.all(Dimensions.height15),
      height: Dimensions.height200 * 0.8,
      width: Dimensions.screenWidth * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppMediumText(text: 'Camellia'),
              AppMediumText(text: 'x4'),
            ],
          ),
          AppRegText(
            text: '2021-12-03',
            color: AppColors.darkGreyColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppMediumText(
                text: 'Total   \$20',
                color: AppColors.lightGreen,
              ),
              Container(
                height: Dimensions.height60 * 1.4,
                width: Dimensions.width60 * 1.4,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.darkGreyColor, width: 2),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/shatla-a4c23.appspot.com/o/products%2FCamellia.jpg?alt=media&token=6d370030-ce77-44c0-9355-75aa2e370638'),
                        fit: BoxFit.cover),
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius15))),
              )
            ],
          )
        ],
      ),
    ),
    SizedBox(
      height: Dimensions.height20,
    ),

    //=====================================================
    Container(
      padding: EdgeInsets.all(Dimensions.height15),
      height: Dimensions.height200 * 0.8,
      width: Dimensions.screenWidth * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppMediumText(text: 'Yellow Saga'),
              AppMediumText(text: 'x5'),
            ],
          ),
          AppRegText(
            text: '2021-10-16',
            color: AppColors.darkGreyColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppMediumText(
                text: 'Total   \$120',
                color: AppColors.lightGreen,
              ),
              Container(
                height: Dimensions.height60 * 1.4,
                width: Dimensions.width60 * 1.4,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.darkGreyColor, width: 2),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/shatla-a4c23.appspot.com/o/products%2FYellow%20Saga.jpg?alt=media&token=dd1d12dc-2d42-40da-82ce-4f76aee556d7'),
                        fit: BoxFit.cover),
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius15))),
              )
            ],
          )
        ],
      ),
    ),
    SizedBox(
      height: Dimensions.height20,
    ),

    //=====================================================
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10, vertical: Dimensions.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Types
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      _currentPage = 0;
                    }),
                    child: Container(
                      height: Dimensions.height50,
                      width: Dimensions.width50 * 2.5,
                      decoration: BoxDecoration(
                          color: _currentPage == 0
                              ? AppColors.lightGreen
                              : Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius20))),
                      child: Center(
                        child: AppRegText(
                          isBold: true,
                          text: 'Completed',
                          color: _currentPage == 0
                              ? Colors.white
                              : AppColors.lightGreen,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _currentPage = 1;
                    }),
                    child: Container(
                      height: Dimensions.height50,
                      width: Dimensions.width50 * 2.5,
                      decoration: BoxDecoration(
                          color: _currentPage == 1
                              ? AppColors.lightGreen
                              : Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius20))),
                      child: Center(
                        child: AppRegText(
                          isBold: true,
                          text: 'Requested',
                          color: _currentPage == 1
                              ? Colors.white
                              : AppColors.lightGreen,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _currentPage = 2;
                    }),
                    child: Container(
                      height: Dimensions.height50,
                      width: Dimensions.width50 * 2.5,
                      decoration: BoxDecoration(
                          color: _currentPage == 2
                              ? AppColors.lightGreen
                              : Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius20))),
                      child: Center(
                        child: AppRegText(
                          isBold: true,
                          text: 'Cancelled',
                          color: _currentPage == 2
                              ? Colors.white
                              : AppColors.lightGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              // Oreders
              _currentPage == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _list,
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: Dimensions.height60,
                        ),
                        const Center(
                          child: AppLargeText(
                              text: 'You currently have no orders'),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
