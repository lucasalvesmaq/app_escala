import 'package:flutter/material.dart';

class AppTheme {
  static const Color latamBlue = Color(0xFF003D82);
  static const Color latamDarkBlue = Color(0xFF002447);
  static const Color latamWhite = Color(0xFFFFFFFF);
  static const Color latamGray = Color(0xFFF5F5F5);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: latamBlue,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: latamBlue,
      foregroundColor: latamWhite,
      elevation: 2,
      centerTitle: true,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: latamWhite,
      indicatorColor: latamBlue,
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 12),
      ),
    ),
    cardTheme: CardTheme(
      color: latamWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: latamBlue,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: latamDarkBlue,
      foregroundColor: latamWhite,
      elevation: 2,
    ),
  );
}

class AppColors {
  static const Color pfGreen = Color(0xFF4CAF50);
  static const Color pmBlue = Color(0xFF2196F3);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
}
