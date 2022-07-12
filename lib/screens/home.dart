import 'package:flutter/material.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_buttons.dart';
import 'package:shatla/widgets/app_text_med.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shatla'),
      ),
      body: Center(
        child: AppButton(
          borderRadius: Dimensions.radiu15,
          height: Dimensions.height60,
          width: Dimensions.width60,
          onTap: () {},
          child: AppTextMedium(
            text: 'Hello',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
