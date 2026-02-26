import 'package:flutter/material.dart';

class BibleVerseOpenTheme {
  static const Color _primaryLight = Color(0xFF10B981);
  static const Color _bgLight = Color(0xFFFAF9F6);
  static const Color _surfaceLight = Colors.white;

  static const Color _primaryDark = Color(0xFF34D399);
  static const Color _bgDark = Color(0xFF0F172A);
  static const Color _surfaceDark = Color(0xFF1E293B);

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: _primaryLight,
        onPrimary: Colors.white,
        surface: _surfaceLight,
        onSurface: Color(0xFF334155),
        outline: Color(0xFFE2E8F0),
      ),
      scaffoldBackgroundColor: _bgLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: _bgLight,
        elevation: 0,
        foregroundColor: Color(0xFF334155),
      ),
      cardTheme: CardThemeData(
        color: _surfaceLight,
        elevation: 4,
        margin: EdgeInsets.zero,
        shadowColor: Colors.black.withValues(alpha: 0.06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: _primaryDark,
        onPrimary: _bgDark,
        surface: _surfaceDark,
        onSurface: Color(0xFFF8FAFC),
        outline: Color(0xFF334155),
      ),
      scaffoldBackgroundColor: _bgDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: _bgDark,
        elevation: 0,
        foregroundColor: Color(0xFFF8FAFC),
      ),
      cardTheme: CardThemeData(
        color: _surfaceDark,
        elevation: 4,
        margin: EdgeInsets.zero,
        shadowColor: Colors.black.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFF334155), width: 1),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
    );
  }
}
