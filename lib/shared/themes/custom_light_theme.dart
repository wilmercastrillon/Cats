import 'package:flutter/material.dart';

class CustomLightTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      cardColor: Colors.white,
      primaryColor: Colors.cyan,
      colorScheme: const ColorScheme.light(
        primary: Colors.cyan,
        surface: Color(0xFFE0E0E0),
      ),
    );
  }
}
