import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';

class RectangleButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const RectangleButton(
      {super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: AppColors.buttonColorCustom,
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
