import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedDynamicButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color btnColor;

  const RoundedDynamicButton(
      {super.key, required this.title,required this.btnColor, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 23,
        padding: const EdgeInsets.only(left: 10, right: 10,bottom: 1),
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(
          title,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
        )),
      ),
    );
  }
}
