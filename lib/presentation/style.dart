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
  final Color editTextColor;
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final Color editBackgroundColor;

  StyleNodeColorSheme({
    required this.selectedTextColor,
    required this.textColor,
    required this.editTextColor,
    required this.backgroundColor,
    required this.selectedBackgroundColor,
    required this.editBackgroundColor,
  });

  factory StyleNodeColorSheme.categories() => StyleNodeColorSheme(
        selectedTextColor: Style.blackColor,
        textColor: Style.blackColor,
        editTextColor: Style.blackColor,
        backgroundColor: Style.grayColor.withAlpha(25),
        selectedBackgroundColor: Style.highlightColor,
        editBackgroundColor: Style.highlightColor,
      );

  factory StyleNodeColorSheme.subjects() => StyleNodeColorSheme(
        selectedBackgroundColor: Style.accentColor,
        selectedTextColor: Style.whiteColor,
        editTextColor: Style.blackColor,
        backgroundColor: Style.highlightColor,
        textColor: Style.blackColor,
        editBackgroundColor: Style.whiteColor,
      );
}
