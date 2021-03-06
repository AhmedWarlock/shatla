import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shatla/routes/app_router.dart';
import 'package:shatla/screens/registeration_pages/components/email_field.dart';
import 'package:shatla/screens/registeration_pages/components/name_field.dart';
import 'package:shatla/screens/registeration_pages/components/passoword_field.dart';
import 'package:shatla/screens/registeration_pages/components/phone_num_field.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
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
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const NameField(),
                      const EmailField(),
                      const PhoneNumField(),
                      const PasswordField(),

                      // Sign Up button
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.lightGreen,
                        ),
                        onPressed: _submit,
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.font16,
                          ),
                        ),
                      ),

                      // Routing to LogIn page
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?. ',
                              style: TextStyle(color: Colors.white)),
                          InkWell(
                            onTap: (() =>
                                Get.offAndToNamed(AppRouter.getLogin())),
                            child: const Text(
                              'Log in',
                              style: TextStyle(color: AppColors.lightGreen),
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
                  ),
                ),
              )),
        ),
      ]),
    );
  }
}
