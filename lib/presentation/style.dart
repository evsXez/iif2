import 'package:flutter/material.dart';

class Style {
  static const accentColor = Color(0xFF005EA9);
  static const highlightColor = Color(0xFF97CEF9);

  static const blackColor = Colors.black;
  static const whiteColor = Colors.white;
  static const greenColor = Color(0xFF4CAF50);
  static const redColor = Color(0xFFC62828);
  static const grayColor = Color(0x89000000);
  static const lightGrayColor = Color(0xFFEBEBEB);
}

class StyleNodeColorSheme {
  final Color selectedTextColor;
  final Color textColor;
  final Color backgroundColor;
  final Color selectedBackgroundColor;

  StyleNodeColorSheme({
    required this.selectedTextColor,
    required this.textColor,
    required this.backgroundColor,
    required this.selectedBackgroundColor,
  });

  factory StyleNodeColorSheme.categories() => StyleNodeColorSheme(
        selectedTextColor: Style.blackColor,
        textColor: Style.blackColor,
        backgroundColor: Style.grayColor.withAlpha(25),
        selectedBackgroundColor: Style.highlightColor,
      );

  factory StyleNodeColorSheme.subjects() => StyleNodeColorSheme(
        selectedBackgroundColor: Style.accentColor,
        selectedTextColor: Style.whiteColor,
        backgroundColor: Style.highlightColor,
        textColor: Style.blackColor,
      );
}
