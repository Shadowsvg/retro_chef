import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class RetroTextTheme {
  RetroTextTheme._();

  static TextTheme darkTextTheme = TextTheme(
    // grab attention (like a book or newspaper headline)
    headlineLarge: TextStyle().copyWith(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: RetroColors.white,
      letterSpacing: 2,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: RetroColors.white,
      letterSpacing: 2,
    ),
    // headlineSmall: TextStyle().copyWith(
    //   fontSize: 32,
    //   fontWeight: FontWeight.w500,
    //   color: RetroColors.white,
    // ),

    // introduce sections or components under the headline
    titleLarge: TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: RetroColors.white,
      letterSpacing: 2,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: RetroColors.white,
      letterSpacing: 2,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: RetroColors.white,
      letterSpacing: 2,
    ),

    // detailed descriptive text
    bodyLarge: TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: RetroColors.white,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: RetroColors.secondary,
      letterSpacing: 2,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: RetroColors.white,
      letterSpacing: 2,
    ),

    // short or helper text like buttons, tabs, chips.
    labelLarge: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w900,
      color: RetroColors.white,
      letterSpacing: 2,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: RetroColors.white,
      letterSpacing: 2,
    ),
    labelSmall: TextStyle().copyWith(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: RetroColors.white,
    ),
  );
}
