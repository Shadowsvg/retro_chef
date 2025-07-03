import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:retro_chef/auth_service.dart';
import 'package:retro_chef/pages/welcome_page.dart';

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
      appBar: AppBar(title: Text('Home Page')),
      bottomNavigationBar: FloatingActionButton(
        onPressed: () async {
          // Provide a prompt that contains text
          final prompt = [Content.text(promptController.text)];
          final response = await aiModel.generateContent(prompt);
          setState(() {
            apiRsponse = response.text ?? 'Something went wrong';
          });
        },
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(controller: promptController),
            SizedBox(height: 40),
            Text(apiRsponse, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
