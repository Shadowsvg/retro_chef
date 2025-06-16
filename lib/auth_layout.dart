import 'package:flutter/material.dart';
import 'package:retro_chef/auth_service.dart';
import 'package:retro_chef/pages/home_page.dart';
import 'package:retro_chef/pages/loading.dart';
import 'package:retro_chef/pages/welcome_page.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({super.key});

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, value, child) {
        return StreamBuilder(
          stream: value.authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingWidget();
            } else if (snapshot.hasData) {
              return HomePage();
            } else {
              return WelcomePage();
            }
          },
        );
      },
    );
  }
}
