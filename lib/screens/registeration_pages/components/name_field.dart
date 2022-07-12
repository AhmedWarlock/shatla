import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
