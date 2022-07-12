import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
