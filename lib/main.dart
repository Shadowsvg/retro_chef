import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:retro_chef/pages/splash.dart';
import 'package:retro_chef/utils/theme/theme.dart';
import 'firebase_options.dart';


// API KEY = AIzaSyDJJR_RtACpdFdB9tXY4pGqz-6C0O75ecI

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Retro Chef',
      themeMode: ThemeMode.dark,
      darkTheme: RetroTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
