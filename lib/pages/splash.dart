import 'package:flutter/material.dart';
import 'package:retro_chef/theme/retro_colors.dart';
import 'package:retro_chef/widgets/gradient_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 3), () {
    //   if (!mounted) return;
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) {
    //         return HomePage();
    //       },
    //     ),
    //   );
    // });
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
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: 40),
            ),
            SizedBox(height: 12),
            Text(
              'Your AI Cooking Assistant',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 12),
            Text(
              'TEST Orbitron Regular 400',
              style: TextStyle(
                fontFamily: 'Orbitron',
                fontWeight: FontWeight.w900, // Regular
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
