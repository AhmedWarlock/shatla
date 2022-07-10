import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: 'password',
        helperText: '',
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
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
    );
  }
}
