import 'package:flutter/material.dart';

/// AI Generated
ThemeData gemma2Theme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF2A5783),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF2A5783),
      secondary: Color(0xFF4B89DC),
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2A5783),
        foregroundColor: Colors.white,
      ),
    ),
  );
}
