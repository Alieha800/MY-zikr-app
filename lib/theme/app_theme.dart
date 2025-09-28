import 'package:flutter/material.dart';

class AppTheme {
  // Color palette
  static const Color primaryGreen = Color(0xFF1B4332);
  static const Color primaryBlue = Color(0xFF1E3A8A);
  static const Color accentGold = Color(0xFFD4AF37);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textGray = Color(0xFFE5E7EB);
  static const Color cardBackground = Color(0x20FFFFFF);

  // Gradient
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryGreen, primaryBlue],
  );

  // Text styles
  static const TextStyle arabicTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textWhite,
    height: 1.8,
  );

  static const TextStyle translationTextStyle = TextStyle(
    fontSize: 16,
    color: textGray,
    height: 1.5,
  );

  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textWhite,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textWhite,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    color: textWhite,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primaryBlue,
  );

  // Theme data
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: textWhite),
      titleTextStyle: headingStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: textWhite,
        foregroundColor: primaryBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: buttonTextStyle,
      ),
    ),
    cardTheme: CardTheme(
      color: cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: cardBackground,
      selectedItemColor: accentGold,
      unselectedItemColor: textGray,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
