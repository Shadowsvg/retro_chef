import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_chef/pages/home_page.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/buttons/gradient_button.dart';
import 'package:retro_chef/utils/widgets/retro_textfiled.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> with TickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
          GradientButton(
            label: 'Login',
            onTap: () {
              // showAnimatedTopSnackBar(context, 'I am batman');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          SizedBox(height: 20),

          Text(
            'Forgot Password?',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: RetroColors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void showAnimatedTopSnackBar(BuildContext context, String message) {
    final overlay = Overlay.of(context);

    // Animation controller
    final controller = AnimationController(
      vsync: this, // Needs a TickerProvider
      duration: const Duration(milliseconds: 300),
    );

    final animation = Tween<Offset>(
      begin: Offset(0, -1), // Start above screen
      end: Offset(0, 0), // Slide to its position
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: SlideTransition(
          position: animation,
          child: Material(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 48,
                right: 16,
                left: 16,
                bottom: 16,
              ),
              child: Text(message, style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );

    // Insert the overlay
    overlay.insert(overlayEntry);
    controller.forward();

    // Remove after delay
    Future.delayed(const Duration(seconds: 2), () {
      controller.reverse().then((_) {
        overlayEntry.remove();
        controller.dispose();
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
