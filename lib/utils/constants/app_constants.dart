import 'package:flutter/material.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';

class AppConstants {
  static const String appTitle = 'Retro Chef';
  static const String welcomeTitle = 'Welcome to Retro Chef AI';
  static const String welcomeSubtitle =
      'Your AI-powered cooking assistent with a retro twist!';
  static const String generateRecipe = 'Generate Recipe';
  static const String insertIngredientsText = 'Insert ingredients of recipe...';
  static const String suggestedPrompts = 'Suggested Prompts';
  static const String recentRecipe = 'Recent Recipe';
  static const String minutes = 'Min';
  static const String easy = 'Easy';
  static const String medium = 'Medium';
  static const String hard = 'Hard';
  static const String back = 'Back';
  static const String recipeName = 'Spicy Mushroom Risotto';
  static const String servings = 'Servings';

  static const int suggestedPromptsCount = 4;
  static const int recentRecipeCount = 3;

  static const Gradient titleGradient = LinearGradient(
    colors: [
      RetroColors.accentStart,
      RetroColors.highlight,
      RetroColors.secondary,
    ],
  );

  static const List<String> listOfPrompts = [
    'I have rice and chicken',
    'Quick vegan breakfast',
    'How to make lasagna?',
    'Easy dessert recipes',
  ];
}

enum RecipeDifficulty { easy, medium, hard }

extension Difficulty on RecipeDifficulty {
  String getDifficulty() {
    switch (this) {
      case RecipeDifficulty.easy:
        return AppConstants.easy.toUpperCase();
      case RecipeDifficulty.medium:
        return AppConstants.medium.toUpperCase();
      case RecipeDifficulty.hard:
        return AppConstants.hard.toUpperCase();
    }
  }
}
