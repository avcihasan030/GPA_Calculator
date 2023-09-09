import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.teal;
  static const String textHeader = "Calculate GPA";
  static final TextStyle styleHeader = GoogleFonts.quicksand(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final TextStyle fLectures = GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static final TextStyle fAverage = GoogleFonts.quicksand(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static final TextStyle fTextAverage = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static const dropDownPadding =
  EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static const horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
