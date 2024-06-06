
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
ThemeData lightTheme = ThemeData(
  primaryColor: Color(0xFFEC6813),
  backgroundColor: Colors.white,
  canvasColor: Colors.white,
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.poppins(
        color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
    headlineMedium:  GoogleFonts.poppins(
        color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.poppins(
        color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
    labelLarge: GoogleFonts.poppins(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
    titleSmall: GoogleFonts.poppins(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.poppins(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.poppins(
        color: Colors.black, fontSize: 14,height: 2, fontWeight: FontWeight.w600),
    bodySmall: GoogleFonts.poppins(
        color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.poppins(
        color: Colors.grey,height: 2, fontSize: 14, fontWeight: FontWeight.w500),

  ),
  bottomAppBarColor: Color(0xFFE5E6E8),
  selectedRowColor:Colors.grey,
  dividerColor: Colors.grey[300],
  indicatorColor: Colors.black54,
  splashColor: Colors.white,
  primaryColorDark: Colors.black45,
  focusColor: Colors.black,
  hoverColor: Colors.black,
  errorColor: Colors.grey[200],
  cardColor: Colors.white,
  buttonColor: Colors.cyan,

  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.cyan,
    textTheme: ButtonTextTheme.primary,
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: Color(0xFFEC6813),
  backgroundColor: Color(0xFF1A1A1A),
  canvasColor: Colors.black,
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Color(0xFF2C2C2C)),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.poppins(
        color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
    headlineMedium:  GoogleFonts.poppins(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.poppins(
        color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
    labelLarge: GoogleFonts.poppins(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
    titleSmall: GoogleFonts.poppins(
        color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.poppins(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.poppins(
        color: Colors.white, fontSize: 14,height: 2, fontWeight: FontWeight.w600),
    bodySmall: GoogleFonts.poppins(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.poppins(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),

  ),
  bottomAppBarColor: Color(0xFF333333),
  selectedRowColor: Colors.white,
  dividerColor: Color(0xFF333333),
  indicatorColor: Colors.white,
  primaryColorDark: Color(0xFF333333),
  splashColor: Color(0xFF333333),
  focusColor: Colors.white,
  hoverColor: Colors.black,
  errorColor: Color(0xFF333333),
  cardColor: Color(0xFF333333),
  buttonColor: Colors.deepPurple,

  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.deepPurple,
    textTheme: ButtonTextTheme.primary,
  ),
);
