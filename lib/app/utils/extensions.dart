import 'package:flutter/material.dart';

/// 扩展String类
extension StringExtension on String {
  /// 字符串转Color
  get color => getColor();
  String get removeNbsp => replaceAll('&nbsp;', " ");

  /// 字符串转Color
  Color getColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Colors.black54;
  }
}