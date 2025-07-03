import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class AppConstants {
  static String appTitle = 'RETRO CHEF';
  static String welcomeTitle = 'WELCOME TO RETRO CHEF AI';
  static String welcomeSubtitle = 'Your AI-powered cooking assistent with a retro twist!';
  static String generateRecipe = 'GENERATE RECIPE';
  static String insertIngredientsText = 'INSERT INGREDIENTS OR RECIPE...';

  static Gradient titleGradient = LinearGradient(
    colors: [
      RetroColors.accentStart,
      RetroColors.highlight,
      RetroColors.secondary,
    ],
  );
}
