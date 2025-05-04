import 'package:flutter/material.dart';

class StyleConstants {
  static const TextStyle textFieldStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.04,
    height: 1,
    color: Color.fromRGBO(0, 119, 182, 1),
  );

  static const TextStyle buttonStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color.fromRGBO(53, 50, 43, 1),
  );
  
  static const TextStyle hintTextStyle = TextStyle(
    color: Colors.grey,
    fontFamily: 'Inter',
  );

  static TextStyle customStyle(
      double fontSize, Color? color, FontWeight? fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamily: 'Inter',
      color: color ?? Colors.white,
      height: 1.21,
    );
  }
}
