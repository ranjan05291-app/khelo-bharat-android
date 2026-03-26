import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  // static void flushBarMessage(
  //   String message,
  //   BuildContext context, [
  //   bool? success,
  // ]) {
  //   showFlushbar(
  //     context: context,
  //     flushbar: Flushbar(
  //       message: message,
  //       backgroundColor: success == true ? Colors.green : Colors.red,
  //       duration: const Duration(seconds: 3),
  //       flushbarPosition: FlushbarPosition.TOP,
  //       messageColor: Colors.white,
  //       forwardAnimationCurve: Curves.decelerate,
  //       reverseAnimationCurve: Curves.easeInOut,
  //       positionOffset: 20,
  //       borderRadius: BorderRadius.circular(8),
  //       padding: const EdgeInsets.all(15),
  //       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //       icon: const Icon(Icons.error, size: 28, color: Colors.white),
  //     )..show(context),
  //   );
  // }

  static Future flushBarMessage(
    String message,
    BuildContext context, [
    bool? success,
  ]) async {
    await Flushbar(
      message: message,
      backgroundColor: success == true ? Colors.green : Colors.red,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      messageColor: Colors.white,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      icon: const Icon(Icons.error, size: 28, color: Colors.white),
    ).show(context);
  }

  static Color? hexToColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return null;
    try {
      String hex = hexColor.replaceAll('#', '');
      if (hex.length == 6) hex = 'FF$hex'; // Add alpha if missing
      return Color(int.parse('0x$hex'));
    } catch (_) {
      return null;
    }
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.red, content: Text(message)),
    );
  }

  // TODO check valid Mobile number...
  static bool isValidMobile(String mobile) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = RegExp(pattern);
    String fChar = mobile[0];
    if (mobile.isEmpty) {
      return false;
    } else if (!(int.parse(fChar) > 5)) {
      return false;
    } else if (!regExp.hasMatch(mobile)) {
      return false;
    }
    return true;
  }

  // TODO check valid PAN number...
  static bool isValidPAN(String pan) {
    String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
    RegExp regExp = RegExp(pattern);
    if (pan.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(pan)) {
      return false;
    }
    return true;
  }

  static bool isNumeric(String string) {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    if (string.isEmpty) {
      return false;
    }
    return numericRegex.hasMatch(string);
  }

  static int parseToInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is String) {
      return int.tryParse(value) ??
          0; // Convert string to int, default to 0 if parsing fails
    } else {
      return 0; // Default to 0 if value is neither int nor string
    }
  }

  static double parseIntToDouble(dynamic value) {
    if (value is double) {
      return value;
    } else if (value is int) {
      return value
          .toDouble(); // Convert string to int, default to 0 if parsing fails
    } else {
      return 0.0; // Default to 0 if value is neither int nor string
    }
  }

  static String parseToString(dynamic value) {
    if (value is String) {
      return value;
    } else if (value is int) {
      return value
          .toString(); // Convert string to int, default to 0 if parsing fails
    } else {
      return ""; // Default to 0 if value is neither int nor string
    }
  }
}
