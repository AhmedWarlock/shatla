import 'package:flutter/material.dart';
import '../../dimensions.dart';
import 'package:shatla/widgets/app_icon.dart';

class AccountContainer extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const AccountContainer({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Dimensions.height15,
          left: Dimensions.height15,
          right: Dimensions.height15),
      padding: EdgeInsets.only(
          top: Dimensions.height10,
          left: Dimensions.width20,
          bottom: Dimensions.height10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 1,
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: Row(
        children: [
          AppIcon(
            onPressed: () {},
            icon: icon,
          ),
          SizedBox(
            width: Dimensions.width20,
          ),
          Text(
            text,
            style: TextStyle(fontSize: Dimensions.font20),
          ),
        ],
      ),
    );
  }
}
