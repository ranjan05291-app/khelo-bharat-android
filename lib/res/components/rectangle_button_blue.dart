import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';

class RectangleButtonBlue extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const RectangleButtonBlue(
      {super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 7, bottom: 7),
        decoration: BoxDecoration(
            color: const Color(0xff0094ff),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          title,
          style: GoogleFonts.poppins(
              color: AppColors.whiteColor,
              fontSize: 13,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
