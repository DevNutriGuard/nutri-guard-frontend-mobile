// ignore_for_file: use_super_parameters, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/theme/app_text_styles.dart';
import 'package:nutri_guard_mobile/core/widgets/social_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../res/assets.dart';

import '../../domain/google_sign_up_provider.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: SvgPicture.asset(
                      'assets/svg/logo.svg',
                      height: 70,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    "Create Your Account",
                    style: AppTextStyles.heading,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Register your account to save your settings",
                    style: AppTextStyles.subheading,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  SocialButton(
                    svgIconPath: Assets.mail,
                    text: "Continue with Email",
                    textColor: Colors.black,
                    onPressed: () => Navigator.pushNamed(context, "/signIn"),
                    colors: [Color(0xFFE0E0E0), Color(0xFFF5F5F5)],
                    textStyle: AppTextStyles.buttonTextStyle,
                  ),
                  const SizedBox(height: 16),
                  SocialButton(
                    svgIconPath: Assets.facebook,
                    text: "Continue with Facebook",
                    textColor: Colors.blue,
                    onPressed: () => Navigator.pushNamed(context, "/signIn"),
                    colors: [Color(0xFFD6F2FF), Color(0xFFE6F7FF)],
                    textStyle: AppTextStyles.buttonTextStyle,
                  ),
                  const SizedBox(height: 16),
                  SocialButton(
                    svgIconPath: Assets.google,
                    text: "Continue with Google",
                    textColor: Colors.black,
                    onPressed: () async {
                      if (context.read<GoogleSignUpProvider>().isLoading) return;  // Prevent multiple presses
                      await context.read<GoogleSignUpProvider>().handleGoogleSignIn(context);
                    },
                    colors: [Color(0xFFFFE6E6), Color(0xFFFFF2F2)],
                    textStyle: AppTextStyles.buttonTextStyle,
                  ),
                  const SizedBox(height: 16),
                  SocialButton(
                    svgIconPath: Assets.phone,
                    text: "Continue with Phone",
                    textColor: Colors.black,
                    onPressed: () =>
                        Navigator.pushNamed(context, "/signInWithPhoneNumber"),
                    colors: [Color(0xFFE0E0E0), Color(0xFFF5F5F5)],
                    textStyle: AppTextStyles.buttonTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: AppTextStyles.footerText,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signIn");
                    },
                    child: const Text(
                      "Sign In",
                      style: AppTextStyles.signInLink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
