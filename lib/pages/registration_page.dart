import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_chef/pages/tabs/login_tab.dart';
import 'package:retro_chef/pages/tabs/register_tab.dart';
import 'package:retro_chef/utils/constants/app_constants.dart';
import 'package:retro_chef/utils/constants/retro_colors.dart';
import 'package:retro_chef/utils/widgets/gradient_text.dart';
import 'package:retro_chef/utils/widgets/buttons/retro_icon_button.dart';
import 'package:retro_chef/utils/widgets/retro_container.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _tabIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  // Future<void> register(final BuildContext context) async {
  //   try {
  //     await authService.value.createAccount(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //     firebaseError = '';
  //     if (context.mounted) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) {
  //             return HomePage();
  //           },
  //         ),
  //       );
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       firebaseError = e.message ?? 'Something went wrong';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(color: RetroColors.grayShade, width: 8),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                GradientText(
                  text: AppConstants.appTitle.toUpperCase(),
                  gradient: AppConstants.titleGradient,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 32),
                RetroContainer(
                  borderColor: RetroColors.pinkRed,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        controller: tabController,
                        indicatorColor: RetroColors.pinkRed,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: RetroColors.pinkRed,
                        labelStyle: Theme.of(context).textTheme.labelLarge
                            ?.copyWith(
                              color: RetroColors.pinkRed,
                              fontWeight: FontWeight.w500,
                            ),
                        unselectedLabelColor: RetroColors.grayShade,
                        dividerColor: Colors.transparent,
                        onTap: (index) {
                          setState(() {
                            _tabIndex = index;
                          });
                        },
                        tabs: [
                          Tab(text: AppConstants.login.toUpperCase()),
                          Tab(text: AppConstants.register.toUpperCase()),
                        ],
                      ),
                      SizedBox(height: 20),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: _tabIndex == 0 ? LoginTab() : RegisterTab(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  AppConstants.orContinueWith,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: RetroColors.grayShade,
                  ),
                ),
                SizedBox(height: 20),
                RetroIconButton(
                  icon: FontAwesomeIcons.google,
                  onTap: () {},
                  iconColor: RetroColors.secondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // Scaffold(
    //   body: Padding(
    //     padding: EdgeInsetsGeometry.all(16),
    //     child: Column(
    //       children: [
    //         SizedBox(height: 140),
    //         Text(
    //           'Register',
    //           style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    //         ),
    //         SizedBox(height: 60),
    //         Form(
    //           key: _formKey,
    //           child: Column(
    //             children: [
    //               TextFormField(
    //                 controller: emailController,
    //                 decoration: InputDecoration(label: const Text('Email')),
    //                 validator: (value) {
    //                   if (value == null || value.trim().isEmpty) {
    //                     return 'Enter Something';
    //                   }
    //                   return null;
    //                 },
    //               ),
    //               SizedBox(height: 30),
    //               TextFormField(
    //                 controller: passwordController,
    //                 decoration: InputDecoration(label: const Text('Password')),
    //                 validator: (value) {
    //                   if (value == null || value.trim().isEmpty) {
    //                     return 'Enter Something';
    //                   }
    //                   return null;
    //                 },
    //               ),
    //               SizedBox(height: 10),
    //               Text(
    //                 firebaseError,
    //                 style: TextStyle(color: Colors.redAccent),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
