import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:retro_chef/auth_service.dart';
import 'package:retro_chef/pages/welcome_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    } on FirebaseAuthException catch (e) {
      print('Exception while logout : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      bottomNavigationBar: FloatingActionButton(
        onPressed: () {},
        child: const Text('This is home page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              // margin: EdgeInsets.all(20),
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 40,
                horizontal: 16,
              ),
              child: Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text('Update username'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Delete Account'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () async {
                Navigator.pop(context);
                await logout(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'You are logged in successfully',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
