import 'package:flutter/material.dart';

class ColorUtils {
  static const Color primary = Color(0xFF030303);
  static const Color background = Color(0xFFF8F8F8);
  static const Color dividerColor = Color(0xFF8b8b8b);
  static const Color secondaryDividerColor = Color(0xFFdedede);
  static const Color secondaryColor = Color(0xFFf6b41d);
  static const Color errorContainerColor = Color(0xFFff2d55);
  static const Color onSurfaceColor = Color(0xFFd17126);
  static const Color duckEggBlue = Color(0xfff1f6fc);
  static const Color jade = Color(0xff17a36a);
  static const Color azul = Color(0xff187ae8);
  static const Color paleGreyFour = Color(0xffe8e8ed);
  static const Color tomatoTwo = Color(0xffe82219);
}


extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}