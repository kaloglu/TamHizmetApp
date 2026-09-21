import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  // Marka Renk Sabitleri
  static const Color primaryTurquoise = Color(0xFF40E0D0);
  static const Color lightBackground = Color(0xFFF8F9FA);
  static const Color darkBackground = Color(0xFF1E1E1E);

  // Light Theme Tanımı
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: const ColorScheme.light(
        primary: primaryTurquoise,
        onPrimary: Colors.white,
        surface: lightBackground,
        onSurface: Color(0xFF212529),
        error: Color(0xFFDC3545),
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: lightBackground,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF212529)),
        titleTextStyle: TextStyle(
          color: Color(0xFF212529),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: const CardThemeData(
        color: Colors.white,
        elevation: 1,
        margin: EdgeInsets.zero,
      ),
    );
  }

  // Dark Theme Tanımı
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: primaryTurquoise,
        onPrimary: Colors.black,
        surface: darkBackground,
        onSurface: Color(0xFFE9ECEF),
        error: Color(0xFFE63946),
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFFE9ECEF)),
        titleTextStyle: TextStyle(
          color: Color(0xFFE9ECEF),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: const CardThemeData(
        color: Color(0xFF2B2B2B),
        elevation: 1,
        margin: EdgeInsets.zero,
      ),
    );
  }
}
