import 'package:flutter/material.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_text.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10, vertical: Dimensions.height10),
          child: Column(
            children: [
              const AppMediumText(text: 'Add product details in form below'),
              SizedBox(
                height: Dimensions.height45,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Product Name',
                    labelStyle: TextStyle(fontSize: Dimensions.font26)),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextField(
                maxLines: 7,
                decoration: InputDecoration(
                    labelText: 'Product Describtion',
                    labelStyle: TextStyle(fontSize: Dimensions.font26)),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
