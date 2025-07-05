import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retro_chef/auth_service.dart';
import 'package:retro_chef/pages/welcome_page.dart';
import 'package:retro_chef/utils/constants/app_constants.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/generate_recipe_textfield.dart';
import 'package:retro_chef/utils/widgets/gradient_button.dart';
import 'package:retro_chef/utils/widgets/gradient_text.dart';
import 'package:retro_chef/utils/widgets/recent_recipe_widget.dart';
import 'package:retro_chef/utils/widgets/retro_container.dart';
import 'package:retro_chef/utils/widgets/section_title_widget.dart';
import 'package:retro_chef/utils/widgets/suggested_prompts_widget.dart';
import 'package:retro_chef/utils/widgets/typewriter_widget.dart';
import 'package:retro_chef/utils/widgets/user_profile_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GenerativeModel aiModel;
  late TextEditingController promptController;

  String apiRsponse = '';
  @override
  void initState() {
    super.initState();
    promptController = TextEditingController();

    aiModel = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');
  }

  Future<void> logout(BuildContext context) async {
    try {
      await authService.value.signOut();
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return WelcomePage();
            },
          ),
        );
      }
    } on FirebaseAuthException {
      // handle exception
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: RetroColors.textFieldBackground,
        title: GradientText(
          text: AppConstants.appTitle.toUpperCase(),
          gradient: AppConstants.titleGradient,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        automaticallyImplyLeading: false,
        actions: [UserProfileIcon()],
        actionsPadding: EdgeInsets.only(right: 8),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: Container(height: 4, color: RetroColors.accentStart),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12),
              _chefImage(),
              SizedBox(height: 16),
              _welcomeContainer(),
              SizedBox(height: 24),
              _generateRecipeContainer(),
              SizedBox(height: 24),
              _suggestedPrompts(),
              SizedBox(height: 24),
              _recentRecipe(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chefImage() {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(8),
      child: Container(
        color: RetroColors.secondary,
        child: SvgPicture.asset('assets/images/chef.svg'),
      ),
    );
  }

  Widget _welcomeContainer() {
    return RetroContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TypewriterWidget(
            text: AppConstants.welcomeTitle.toUpperCase(),
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            gradient: AppConstants.titleGradient,
          ),
          SizedBox(height: 16),
          Text(
            AppConstants.welcomeSubtitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _generateRecipeContainer() {
    return RetroContainer(
      padding: EdgeInsets.all(16),
      borderColor: RetroColors.accentStart,
      child: Column(
        children: [
          GenerateRecipeTextfield(),
          SizedBox(height: 8),
          GradientButton(
            label: AppConstants.generateRecipe.toUpperCase(),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _suggestedPrompts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(title: AppConstants.suggestedPrompts),
        SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            AppConstants.suggestedPromptsCount,
            (index) => SizedBox(
              width: (MediaQuery.of(context).size.width - 26) / 2,
              child: SuggestedPromptsWidget(
                prompt: AppConstants.listOfPrompts[index],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _recentRecipe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(title: AppConstants.recentRecipe),
        SizedBox(height: 20),
        ...List.generate(
          AppConstants.recentRecipeCount,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: RecentRecipeWidget(
              recentRecipeTitle: 'Spicy Chicken stir fry',
              minutes: 25,
              difficulty: RecipeDifficulty.easy,
            ),
          ),
        ),
      ],
    );
  }
}
