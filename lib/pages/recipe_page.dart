import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_chef/utils/constants/app_constants.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/gradient_text.dart';
import 'package:retro_chef/utils/widgets/icon_title_widget.dart';
import 'package:retro_chef/utils/widgets/user_profile_icon.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _getRecipeTitle(context),
              SizedBox(height: 20),
              _getRecipeInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRecipeTitle(final BuildContext context) {
    return GradientText(
      text: AppConstants.recipeName,
      gradient: AppConstants.titleGradient,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 32),
    );
  }

  PreferredSizeWidget? _getAppBar(final BuildContext context) {
    return AppBar(
      backgroundColor: RetroColors.textFieldBackground,
      title: GradientText(
        text: AppConstants.appTitle.toUpperCase(),
        gradient: AppConstants.titleGradient,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      leadingWidth: 100,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconTitleWidget(
            icon: FontAwesomeIcons.angleLeft,
            title: AppConstants.back.toUpperCase(),
            iconColor: RetroColors.secondary,
          ),
        ),
      ),
      centerTitle: true,
      actions: [UserProfileIcon()],
      actionsPadding: EdgeInsets.only(right: 8),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(4),
        child: Container(height: 4, color: RetroColors.accentStart),
      ),
    );
  }

  Widget _getRecipeInfo() {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTitleWidget(
          icon: FontAwesomeIcons.clock,
          title: '35 ${AppConstants.minutes.toUpperCase()}',
          iconColor: RetroColors.highlight,
        ),
        IconTitleWidget(
          icon: FontAwesomeIcons.fire,
          title: RecipeDifficulty.medium.getDifficulty(),
          iconColor: RetroColors.accentStart,
        ),
        IconTitleWidget(
          icon: FontAwesomeIcons.utensils,
          title: '4 ${AppConstants.servings}',
          iconColor: RetroColors.secondary,
        ),
      ],
    );
  }
}
