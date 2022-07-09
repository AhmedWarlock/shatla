import 'package:flutter/material.dart';
import 'package:shatla/utils/dimensions.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _submit() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  validator: ((value) {
                    if (value!.isNotEmpty && value.length < 4) {
                      return 'Name must me longer than 4 characters';
                    } else if (value.isEmpty) {
                      return 'Name cannot be empty';
                    } else {
                      return null;
                    }
                  }),
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password',
                  ),
                  validator: ((value) {
                    if (value!.isNotEmpty && value.length < 7) {
                      return 'Password must me longer than 7 characters';
                    } else if (value.isEmpty) {
                      return 'Password cannot be empty';
                    } else {
                      return null;
                    }
                  }),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                TextButton(onPressed: _submit, child: Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
