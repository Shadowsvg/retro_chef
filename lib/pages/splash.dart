import 'package:flutter/material.dart';
import 'package:retro_chef/pages/registration_page.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/gradient_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return RegistrationPage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/retro_chef_logo.png', width: 200),
            GradientText(
              text: 'RETRO CHEF',
              gradient: LinearGradient(
                colors: [
                  RetroColors.accentStart,
                  RetroColors.highlight,
                  RetroColors.secondary,
                ],
              ),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 12),
            Text(
              'Your AI Cooking Assistant',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: RetroColors.secondary),
            ),
            SizedBox(height: 40),
            Text(
              'v2.5.0',
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(color: RetroColors.grayShade),
            ),
          ],
        ),
      ),
    );
  }
}
