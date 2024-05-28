import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xffecf0f3);
  static const Color secondaryColor = Color(0xFF5B8F8F);
  static const Color upperNeumorphismShade = Color(0xffffffff);
  static const Color lowerNeumorphismShade = Color(0xffced2d5);
  static const Color tranparent = Color(0x00000000);
  static TextStyle font15 = GoogleFonts.kanit(
    fontSize: 15,
    color: secondaryColor,
  );
  static TextStyle font15Bold = GoogleFonts.kanit(
    fontSize: 15,
    color: secondaryColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font20 = GoogleFonts.kanit(
    color: secondaryColor,
    fontSize: 20,
  );
  static TextStyle font20Bold = GoogleFonts.kanit(
    color: secondaryColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font25 = GoogleFonts.kanit(
    color: secondaryColor,
    fontSize: 25,
  );
  static TextStyle font25Bold = GoogleFonts.kanit(
    fontSize: 25,
    color: secondaryColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font30 = GoogleFonts.kanit(
    fontSize: 30,
    color: secondaryColor,
  );
  static TextStyle font30Bold = GoogleFonts.kanit(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
  );
  static TextStyle font35 = GoogleFonts.kanit(
    fontSize: 35,
    color: secondaryColor,
  );
  static TextStyle font35Bold = GoogleFonts.kanit(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
  );

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: secondaryColor),
        backgroundColor: primaryColor,
        foregroundColor: primaryColor,
        surfaceTintColor: primaryColor,
        shadowColor: primaryColor),
    iconTheme: const IconThemeData(
      color: secondaryColor,
    ),
    primaryColor: primaryColor,
    hintColor: secondaryColor,
    scaffoldBackgroundColor: primaryColor,
    drawerTheme: const DrawerThemeData(backgroundColor: primaryColor),
  );
}
