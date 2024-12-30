import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLightTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
        useMaterial3: true,
        cardColor: Colors.white,
        primaryColor: Colors.cyan,
        primaryColorDark: const Color(0xFF0097A7),
        colorScheme: const ColorScheme.light(
          primary: Colors.cyan,
          surface: Color(0xFFE0E0E0),
        ),
        textTheme: GoogleFonts.robotoCondensedTextTheme());
  }
}
