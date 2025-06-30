import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_chef/utils/widgets/gradient_button.dart';
import 'package:retro_chef/utils/widgets/retro_textfiled.dart';

class RegisterTab extends StatefulWidget {
  const RegisterTab({super.key});

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RetroTextfiled(
            controller: _usernameController,
            label: 'Username',
            hintText: 'Enter username',
            prefixIcon: Icon(Icons.person),
          ),
          SizedBox(height: 12),
          RetroTextfiled(
            controller: _emailController,
            label: 'Email',
            hintText: 'Enter email',
            prefixIcon: Icon(Icons.email),
          ),
          SizedBox(height: 12),
          RetroTextfiled(
            controller: _passwordController,
            label: 'Password',
            hintText: 'Enter password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(FontAwesomeIcons.eye),
          ),
          SizedBox(height: 20),
          GradientButton(label: 'Create Account', onTap: () {}),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
