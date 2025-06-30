import 'package:flutter/material.dart';
import 'package:retro_chef/utils/theme/custom_themes/text_theme.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class RetroTheme {
  RetroTheme._();

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Orbitron',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: RetroColors.background,
    primaryColor: RetroColors.primary,
    colorScheme: ColorScheme.dark(
      primary: RetroColors.primary,
      secondary: RetroColors.secondary,
      surface: RetroColors.background,
      onPrimary: RetroColors.white,
      onSecondary: RetroColors.background,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: RetroColors.primary,
      foregroundColor: RetroColors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: RetroColors.accentStart, // fallback
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: RetroColors.secondary),
    ),
    textTheme: RetroTextTheme.darkTextTheme,
  );
}
