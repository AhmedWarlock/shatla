import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';

class MyInputTheme {
  // Method for generating the Text Style
  TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(
      color: color,
      fontSize: size,
    );
  }

  // Method for generating the Border style

  OutlineInputBorder _buildOutlineBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ));
  }

  InputDecorationTheme theme() => InputDecorationTheme(
        //Basic paramerters
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Colors.white.withOpacity(0.5),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,

        //Borders
        enabledBorder: _buildOutlineBorder(AppColors.greyColor),
        errorBorder: _buildOutlineBorder(Colors.red),
        focusedBorder: _buildOutlineBorder(Colors.white),
        focusedErrorBorder: _buildOutlineBorder(Colors.red),
        disabledBorder: _buildOutlineBorder(Colors.grey),
        // text
        suffixStyle: _buildTextStyle(Colors.black),
        counterStyle: _buildTextStyle(Colors.white),
        floatingLabelStyle: _buildTextStyle(Colors.black, size: 14),
        errorStyle: _buildTextStyle(Colors.red, size: 14),
        helperStyle: _buildTextStyle(Colors.white, size: 14),
        hintStyle: _buildTextStyle(Colors.black),
        labelStyle: _buildTextStyle(Colors.black),
        prefixStyle: _buildTextStyle(Colors.black),
      );
}

class MyAppBartheme {
  AppBarTheme appBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.lightGreen,
      elevation: 0,
    );
  }
}
