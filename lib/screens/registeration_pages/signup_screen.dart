import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shatla/routes/app_router.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:shatla/widgets/app_text.dart';

import '../../controllers/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authController = Get.find();

  bool _isObscure = true;
  bool _isVendor = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _authController.signUp();
    }
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
                      // Name Field
                      TextFormField(
                        controller: _authController.nameController,
                        validator: ((value) {
                          if (value!.isNotEmpty && value.length < 4) {
                            return 'Name must me longer than 4 characters';
                          } else if (value.isEmpty) {
                            return 'Name cannot be empty';
                          } else {
                            return null;
                          }
                        }),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          helperText: '',
                        ),
                      ),
                      // Email field
                      TextFormField(
                        controller: _authController.emailController,
                        validator: ((value) {
                          if (value!.isNotEmpty && value.length < 4) {
                            return 'Email must me longer than 4 characters';
                          } else if (value.isEmpty) {
                            return 'Email cannot be empty';
                          } else {
                            return null;
                          }
                        }),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          helperText: '',
                        ),
                      ),

                      // Password field
                      TextFormField(
                        controller: _authController.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          helperText: '',
                          suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                    _isObscure = !_isObscure;
                                  }),
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.lightGreen,
                              )),
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
                      // Phone Number Field
                      TextFormField(
                        controller: _authController.phoneNumberController,
                        maxLength: 15,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: ((value) {
                          if (value!.isNotEmpty && value.length < 10) {
                            return 'Phone number must be at least 10 digits';
                          } else if (value.isEmpty) {
                            return 'phone number cannot be empty';
                          } else {
                            return null;
                          }
                        }),
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: 'Phone Number',
                          helperText: '',
                        ),
                      ),
                      // User Type
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => setState(() => _isVendor = false),
                            child: Container(
                              width: Dimensions.width150,
                              height: Dimensions.height50,
                              decoration: BoxDecoration(
                                  color: _isVendor
                                      ? Colors.white
                                      : AppColors.lightGreen,
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimensions.radius15),
                                    bottomLeft:
                                        Radius.circular(Dimensions.radius15),
                                  )),
                              child: Center(
                                child: AppRegText(
                                  text: 'Customer',
                                  color: _isVendor
                                      ? AppColors.darkGreen
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => setState(() => _isVendor = true),
                            child: Container(
                              height: Dimensions.height50,
                              width: Dimensions.width150,
                              decoration: BoxDecoration(
                                  color: _isVendor
                                      ? AppColors.lightGreen
                                      : Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius15),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius15),
                                  )),
                              child: Center(
                                child: AppRegText(
                                  text: 'Vendor',
                                  color: _isVendor
                                      ? Colors.white
                                      : AppColors.darkGreen,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

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
                          const AppRegText(
                            text: 'Already have an account? ',
                            color: Colors.white,
                          ),
                          InkWell(
                            onTap: (() =>
                                Get.offAndToNamed(AppRouter.getLogin())),
                            child: const AppRegText(
                              text: 'LogIn',
                              color: AppColors.lightGreen,
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
