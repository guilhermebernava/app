import 'package:app/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//PRIMARY -> GoogleFonts.syne()
//SECUNDARY -> GoogleFonts.spaceGrotesk()

class AppFonts {
  static final basic = GoogleFonts.lato(
    fontSize: 16,
    color: AppColors.white,
  );

  static final basicBold = GoogleFonts.lato(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static final hourTitle = GoogleFonts.lato(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static final hourText = GoogleFonts.lato(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );

  static final textFormTitle = GoogleFonts.lato(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static final textFormText = GoogleFonts.lato(
    fontSize: 18,
    color: AppColors.white,
  );

  static final textFormHint = GoogleFonts.lato(
    fontSize: 18,
    color: AppColors.white.withOpacity(0.8),
  );

  static final textFormError = GoogleFonts.lato(
    fontSize: 18,
    color: Colors.red,
  );

  static TextStyle homeDataBold(Color color) {
    return GoogleFonts.lato(
      fontSize: 20,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle homeData(Color color) {
    return GoogleFonts.lato(
      fontSize: 18,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }
}
