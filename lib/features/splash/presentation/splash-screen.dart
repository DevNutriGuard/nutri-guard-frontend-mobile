import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/features/home/presentation/home_screen.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import '../../../core/routes/app_routes.dart';
import '../../../res/assets.dart';
import '../../../res/strings.dart';
import '../../../res/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (PreferenceUtils.getBool(Strings.loggedIn) == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
            // (route) => false, // Remove all routes in the stack
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1F4E6A),
              Color(0xFF0E354B),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            Assets.splashScreenLogo,
            width: sizes!.height * 0.15,
            height: sizes!.height * 0.15,
          ),
        ),
      ),
    );
  }
}

