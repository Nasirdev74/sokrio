import 'package:flutter/material.dart';

class AppColors {
  /// app color
  static const primary = Color(0xFF50C878);
  static const primaryDark = Color(0xFF27AE60);
  static const textGrey = Color(0xFF373737);
  static const textGreyLight = Color(0xFF6A6A6A);
  static const scaffoldBackground = Color(0xFFF9F9FA);

  static const primary2 = Color(0xFFF6B323);
  static const secondary = Color(0xFF321B05);
  static const secondary2 = Color(0xFF01050D);
  static const secondary3 = Color(0xFFF8D52A);
  static const primaryLite = Color(0xFF34CC67);
  static const inputBorder = Color(0xFF5B616B);

  static Color primaryAccent = Color(int.parse('#34CC67'.substring(1, 7), radix: 16) + 0xFF000000);
  static const Color background = Color(0xFFF6FFF9);

  static Color iconColor = Color(int.parse('#ffffff'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color highLiteTextColor = Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);
  static const Color textColor = Color(0xFF404040);
  static const Color textColor2 = Color(0xFF202020);
  static Color textFieldErrorColor = Color(int.parse('#FCDDDD'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color buttonColor1 = Color(int.parse('#FC8E22'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color buttonColor2 = Color(int.parse('#FDA526'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color dropDown = Color(int.parse('#EAECEF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color curveColor = Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);

  /// normal color
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color blue = Color(0xff1473E6);
  static const Color faceBookColor = Color(0xFF3B5998);
  static const Color googleColor = Color(0xFFEA4235);
  static const Color grey = Color(0xFF707070);
  static const Color greyLite = Color(0xFFEFEFEF);
  static const Color ratingColor = Color(0xFFFFD54F);

  static const Color green = Color(0xFF6FB900);
  static const Color greenLite = Color(0xFFA6CC2B);
  static const Color greenDark = Color(0xFF009247);
  static const Color yellow = Color(0xFFFFAA00);
  static const Color red = Color(0xFFC1272D);
  static const Color redLite = Color(0xFFFF0000);

  static const Color textFieldBorder = Color(0xFF434343);
  static const Color textFieldBackground = Color(0xFFFCDFDD);
  static const Color border = Color(0xFF707070);
  static const Color divider = Color(0xFFD5D5D5);
  static const Color shadow = Color(0xFFD5D5D5);
  static const Color codGrey = Color(0xFF1b1b1b);

  static getColorFromColorCode(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
