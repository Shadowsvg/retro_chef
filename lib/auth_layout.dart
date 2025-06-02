import 'package:flutter/material.dart';
import 'package:retro_chef/auth_service.dart';
import 'package:retro_chef/pages/home_page.dart';
import 'package:retro_chef/pages/loading.dart';
import 'package:retro_chef/pages/welcome_page.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, value, child) {
        return StreamBuilder(
          stream: value.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = LoadingWidget();
            }
            if (snapshot.hasData) {
              widget = HomePage();
            }
            widget = WelcomePage();
            return widget;
          },
        );
      },
    );
  }
}
