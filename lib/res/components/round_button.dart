import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.buttonColorCustom,
            borderRadius: BorderRadius.circular(5)),
        child: loading
            ? const Center(child: CircularProgressIndicator(color: AppColors.whiteColor,strokeWidth: 3,))
            : Center(
                child: Text(
                title,
                style: GoogleFonts.poppins(
                    color: AppColors.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
      ),
    );
  }
}
