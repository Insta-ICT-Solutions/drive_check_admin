import 'package:flutter/material.dart';

class CustomColors{
  static final Color backgroundColor = Color(0xFF348F6C);
  static final Color secondaryColor = Color(0xFFD5C590);
  static final Color cardColor = Color(0xFFFDF9F3);
  static final Color elementColor = Color(0xFFBCA16A);
  static final Color adColor = Color(0xFF43A37E);
  static final Color goldColor = Color(0xFFF4AB00);
  static final Color orangeColor = Color(0xFFFC5457);
}

class CustomGradients{
  static final LinearGradient loginGradient = LinearGradient(
      colors: [
        CustomColors.goldColor,
        CustomColors.orangeColor
      ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  );
}