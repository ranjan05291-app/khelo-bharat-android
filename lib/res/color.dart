import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color? bgColor;
  static Color? bgHeaderColor;
  static Color? frontColor;
  static Color? buttonColorCustom;
  static Color? buttonTextColor;

  static Future<void> loadCustomColors() async {
    final prefs = await SharedPreferences.getInstance();
    bgColor = _parseColor(prefs.getString('BgColor')) ?? Color(0xFF03fcb1);
    bgHeaderColor =
        _parseColor(prefs.getString('BGHeaderColor')) ?? Color(0xFF0000FF);
    frontColor =
        _parseColor(prefs.getString('BGFrontColor')) ?? Color(0xFFffffff);
    buttonColorCustom =
        _parseColor(prefs.getString('ButtonColor')) ?? Color(0xFFe010dd);
    buttonTextColor =
        _parseColor(prefs.getString('ButtonTextColor')) ?? Color(0xFFffffff);
  }

  static Color? _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return null;
    try {
      String hex = hexColor.replaceAll('#', '');
      if (hex.length == 6) hex = 'FF$hex'; // Add alpha if missing
      return Color(int.parse('0x$hex'));
    } catch (_) {
      return null;
    }
  }

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color redColor = Color(0xFFed1c24);

  static const Color shimmerColor1 = Colors.black;
  static const Color shimmerColor2 = Color(0xFFb58416);
}
