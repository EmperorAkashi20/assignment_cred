import 'package:assignment_cred/Device%20Manager/screen_constants.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle get blankTest => TextStyle(
        color: Colors.white70,
        fontSize: FontSize.s30,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get headingTextStyle => TextStyle(
        color: Colors.blueGrey,
        fontSize: FontSize.s18,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get subHeadingTextStyle => TextStyle(
        color: Colors.blueGrey.withOpacity(0.4),
        fontSize: FontSize.s14,
        fontWeight: FontWeight.bold,
      );
}
