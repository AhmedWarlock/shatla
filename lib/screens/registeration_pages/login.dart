import 'package:flutter/material.dart';
import 'package:shatla/routes/app_router.dart';
import 'package:shatla/screens/registeration_pages/components/email_field.dart';
import 'package:shatla/screens/registeration_pages/components/passoword_field.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //On button press function
  void _submit() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // Background Image

        Positioned(
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/plant1.jpeg'),
              fit: BoxFit.cover,
            )),
          ),
        ),

        // اللون الفوق الصورة

        Positioned(
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: AppColors.green2Trans,
          ),
        ),

        //The Input Fields

        Positioned(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const EmailField(),
                  const PasswordField(),

                  // Log in button

                  TextButton(
                    onPressed: _submit,
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.lightGreen,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.font16,
                      ),
                    ),
                    
                  ),

                  // Routing to Signup page

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?. ',
                          style: TextStyle(color: Colors.white)),
                      InkWell(
                        onTap: (() => Get.offAndToNamed(AppRouter.getSignup())),
                        child: const Text(
                          'Sign up',
                          style:  TextStyle(color: AppColors.lightGreen),
                        ),
                      ),
                    ],
                  ),
                ]
                    .map((child) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height10,
                              horizontal: Dimensions.width15),
                          child: child,
                        ))
                    .toList(),
              )),
        ),
      ]),
    );
  }
}
