import 'package:flutter/material.dart';
import 'package:shatla/controllers/auth_controller.dart';
import 'package:shatla/routes/app_router.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:shatla/widgets/app_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authController = Get.find();

  bool _isObscure = true;

  //On button press function
  void _submit() async {
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
                  // EMail field
                  TextFormField(
                    controller: _authController.emailController,
                    validator: ((value) {
                      if (value!.isNotEmpty && value.length < 4) {
                        return 'Email cannot be less than 4 characters';
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

                  // Log in button

                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.lightGreen,
                    ),
                    onPressed: _submit,
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
                      const AppRegText(
                          text: 'Don\'t have an account?. ',
                          color: Colors.white),
                      InkWell(
                        onTap: (() => Get.offAndToNamed(AppRouter.getSignup())),
                        child: const AppRegText(
                            text: 'Sign up', color: AppColors.lightGreen),
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
