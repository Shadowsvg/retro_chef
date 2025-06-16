import 'package:flutter/material.dart';
import 'package:retro_chef/theme/retro_colors.dart';

final ThemeData retroChefTheme = ThemeData(
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
  // NEW, BUNDLED WAY
  textTheme: ThemeData.light().textTheme
      .apply(
        fontFamily: 'Orbitron', // Use the family name from pubspec.yaml
      )
      .copyWith(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold, // This will use Orbitron-Bold.ttf
          color: RetroColors.highlight,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight:
              FontWeight.w600, // This will use the closest weight, likely Bold
          color: RetroColors.secondary,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal, // This will use Orbitron-Regular.ttf
          color: RetroColors.white,
        ),
        labelLarge: TextStyle(fontSize: 14, color: RetroColors.secondary),
      ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: RetroColors.suggestionBox,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: RetroColors.secondary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: RetroColors.accentEnd),
    ),
    hintStyle: const TextStyle(color: Colors.white70),
  ),
);
