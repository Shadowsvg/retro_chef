import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:retro_chef/auth_service.dart';
import 'package:retro_chef/pages/home_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String firebaseError = '';

  Future<void> register(final BuildContext context) async {
    try {
      await authService.value.createAccount(
        email: emailController.text,
        password: passwordController.text,
      );
      firebaseError = '';
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        firebaseError = e.message ?? 'Something went wrong';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 20),
        child: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              register(context);
            }
          },
          child: const Text('Register'),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            SizedBox(height: 140),
            Text(
              'Register',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(label: const Text('Email')),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter Something';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(label: const Text('Password')),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter Something';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    firebaseError,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
