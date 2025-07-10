import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_chef/pages/home_page.dart';
import 'package:retro_chef/utils/constants/app_constants.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/buttons/retro_outlined_button.dart';
import 'package:retro_chef/utils/widgets/checkbox_title_widget.dart';
import 'package:retro_chef/utils/widgets/buttons/gradient_button.dart';
import 'package:retro_chef/utils/widgets/gradient_text.dart';
import 'package:retro_chef/utils/widgets/buttons/retro_icon_button.dart';
import 'package:retro_chef/utils/widgets/icon_title_widget.dart';
import 'package:retro_chef/utils/widgets/instruction_widget.dart';
import 'package:retro_chef/utils/widgets/nutrition_widget.dart';
import 'package:retro_chef/utils/widgets/pro_tips_widget.dart';
import 'package:retro_chef/utils/widgets/retro_container.dart';
import 'package:retro_chef/utils/widgets/section_title_widget.dart';
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
              SizedBox(height: 16),
              _getShareSaveIconList(),
              SizedBox(height: 20),
              _getNutriInfo(),
              SizedBox(height: 20),
              _getIngredientsList(),
              SizedBox(height: 20),
              _getInstructions(),
              SizedBox(height: 20),
              GradientButton(
                label: AppConstants.tryAnotherRecipe,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              SizedBox(height: 12),
              RetroOutlinedButton(label: AppConstants.saveRecipe, onTap: () {}),
              SizedBox(height: 20),
              ProTipsWidget(proTipsList: AppConstants.listOfPrompts),
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

  Widget _getShareSaveIconList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RetroIconButton(
          icon: FontAwesomeIcons.shareNodes,
          onTap: () {},
          iconColor: RetroColors.pinkRed,
          borderColor: RetroColors.pinkRed,
        ),
        SizedBox(width: 16),
        RetroIconButton(
          icon: FontAwesomeIcons.bookmark,
          onTap: () {},
          iconColor: RetroColors.secondary,
        ),
      ],
    );
  }

  Widget _getNutriInfo() {
    return RetroContainer(
      padding: const EdgeInsets.all(16),
      borderColor: RetroColors.pinkRed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getRecipeImage(),
          SizedBox(height: 20),
          SectionTitleWidget(title: AppConstants.nutritionInfo),
          SizedBox(height: 16),
          Row(
            spacing: 10,
            children: [
              NutritionWidget(
                icon: FontAwesomeIcons.fire,
                value: '420',
                title: AppConstants.calories,
              ),
              NutritionWidget(
                icon: FontAwesomeIcons.drumstickBite,
                value: '12g',
                title: AppConstants.protein,
              ),
              NutritionWidget(
                icon: FontAwesomeIcons.breadSlice,
                value: '65g',
                title: AppConstants.carbs,
              ),
              NutritionWidget(
                icon: FontAwesomeIcons.heartCircleExclamation,
                value: '14g',
                title: AppConstants.fat,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getRecipeImage() {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(8),
      child: Container(
        color: RetroColors.secondary,
        child: SvgPicture.asset('assets/images/chef.svg'),
      ),
    );
  }

  Widget _getIngredientsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(title: AppConstants.ingredients),
        SizedBox(height: 16),
        RetroContainer(
          borderColor: RetroColors.pinkRed,
          child: Column(
            children: [
              ...List.generate(AppConstants.listOfSteps.length, (index) {
                return CheckboxTitleWidget(
                  title: AppConstants.listOfSteps[index],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getInstructions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(title: AppConstants.instructions),
        SizedBox(height: 16),
        RetroContainer(
          borderColor: RetroColors.pinkRed,
          child: Column(
            spacing: 10,
            children: List.generate(
              AppConstants.listOfSteps.length,
              (index) => InstructionWidget(
                instruction: AppConstants.listOfSteps[index],
                index: index + 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
