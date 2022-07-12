

import 'package:shatla/utils/dimensions.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({ Key? key, required this.image,required this.text,required this.textColor ,required this.color}) : super(key: key);
  final String image;
final String text;
final Color textColor;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Dimensions.loginContainer/1.3,
            width: Dimensions.loginContainer/1.3,
            decoration: BoxDecoration(
            
              image: DecorationImage(
                image: AssetImage(image,),fit: BoxFit.cover),
                
            ),
          ),
          SizedBox(height: Dimensions.height15*1.5,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.height30),
            child: Text(text,
            textAlign: TextAlign.center,
            
            style: TextStyle(
              fontSize: Dimensions.font16*1.8,
              color: textColor,
               fontWeight: FontWeight.w600
            ),
            ),
          ),
        ],
      ),
    );
  }
}