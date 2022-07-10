import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumField extends StatelessWidget {
  const PhoneNumField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      decoration: InputDecoration(
        hintText: 'Phone Number',
        helperText: '',
      ),
    );
  }
}
