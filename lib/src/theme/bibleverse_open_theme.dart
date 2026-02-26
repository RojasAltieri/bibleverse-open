import 'package:flutter/material.dart';

class BibleVerseOpenTheme {
  static const Color seed = Color(0xFF2C6E49);
  static const Color surfaceTint = Color(0xFFF6F1E6);

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: surfaceTint,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: surfaceTint,
        foregroundColor: colorScheme.onSurface,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
