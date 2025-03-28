import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/theme/app_text_styles.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import 'package:nutri_guard_mobile/core/widgets/input_field.dart';
import 'package:nutri_guard_mobile/core/widgets/social_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/facbook/facebook_auth.dart';
import '../../../../res/assets.dart';

import '../../domain/google_sign_up_provider.dart';
import '../../domain/login_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FacebookAuthService _facebookAuthService = FacebookAuthService();

  @override
  void initState() {
    super.initState();
    context.read<LoginProvider>().loadUserDetails();
  }

  Future<void> _handleFacebookLogin() async {
    final userData = await _facebookAuthService.loginWithFacebook();
    if (userData != null) {
      // Handle the user data (e.g., login or sign up the user)
      final email = userData['email'];
      final name = userData['name'];
      final picture = userData['picture']['data']['url'];

      print('User Email: $email');
      print('User Name: $name');
      print('User Picture: $picture');

      // You can now use this data to log in or sign up the user in your app
      // For example, you might call a method in your LoginProvider to handle this
      context.read<LoginProvider>().handleFacebookLogin(userData);
    } else {
      // Handle the case where login failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Facebook login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    loginProvider.init(context: context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Center(
                  child: SvgPicture.asset(
                    'assets/svg/logo.svg',
                    height: 30,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign in to your account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Please enter your details to continue.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 20),
                      InputField(
                        controller: loginProvider.emailController,
                        label: "Email",
                        keyboardType: TextInputType.emailAddress,
                        fillColor: Colors.transparent,
                      ),
                      SizedBox(height: 16),
                      InputField(
                        controller: loginProvider.passwordController,
                        label: "Password",
                        obscureText: true,
                        fillColor: Colors.transparent,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: loginProvider.rememberMe.value,
                            onChanged: (bool? value) {
                              loginProvider.callRememberMe(value ?? false);
                            },
                            activeColor: Color(0xFF1F4E6A),
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F4E6A),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          label: "Sign In",
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            loginProvider.onLoginTap();
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgotPasswordEmail');
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Color(0xFF1F4E6A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade400,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("OR"),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade400,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SocialButton(
                        svgIconPath: Assets.facebook,
                        text: "Continue with Facebook",
                        textColor: Colors.blue,
                        colors: [Color(0xFFD6F2FF), Color(0xFFE6F7FF)],
                        textStyle: AppTextStyles.buttonTextStyle,
                        onPressed: _handleFacebookLogin,
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
                        onPressed: () => Navigator.pushNamed(
                            context, "/signInWithPhoneNumber"),
                        colors: [Color(0xFFE0E0E0), Color(0xFFF5F5F5)],
                        textStyle: AppTextStyles.buttonTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/signUp'),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(0xFF1F4E6A),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}