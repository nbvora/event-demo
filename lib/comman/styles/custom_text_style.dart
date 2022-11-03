import 'package:flutter/material.dart';

class CustomTextStyle {
  const CustomTextStyle();

  static TextStyle getHeaderStyle(
          {Color textColor = Colors.black, double fontSize = 20,}) =>
      TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          fontFamily: 'Roboto');

  static TextStyle getTitleStyle(
          [Color textColor = Colors.black,
          FontWeight fontWeight = FontWeight.normal]) =>
      TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontSize: 16,
          fontFamily: 'Roboto');

  static TextStyle getSubtitleStyle(
          [Color textColor = Colors.white,
          FontWeight fontWeight = FontWeight.normal]) =>
      TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: fontWeight,
          fontFamily: 'Roboto');

  static TextStyle getSmallTitleStyle(
          [Color textColor = Colors.white,
          FontWeight fontWeight = FontWeight.normal]) =>
      TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: fontWeight,
          fontFamily: 'Roboto');
  static TextStyle getSubSmallTitleStyle(
      [Color textColor = Colors.white,
        FontWeight fontWeight = FontWeight.normal]) =>
      TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: fontWeight,
          fontFamily: 'Roboto');
  static TextStyle getVerySmallTitleStyle(
      [Color textColor = Colors.white,
        FontWeight fontWeight = FontWeight.normal]) =>
      TextStyle(
          color: textColor,
          fontSize: 8,
          fontWeight: fontWeight,
          fontFamily: 'Roboto');
}
