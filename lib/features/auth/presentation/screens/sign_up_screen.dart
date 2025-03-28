// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import 'package:nutri_guard_mobile/core/widgets/input_field.dart';
import 'package:nutri_guard_mobile/features/auth/domain/signup_provider.dart';
import 'package:provider/provider.dart';
import '../../../../res/assets.dart';
import 'package:nutri_guard_mobile/core/theme/app_text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);
    signupProvider.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                    Assets.appLogo,
                    height: 30,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
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
                          "Sign Up",
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
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: signupProvider.profileImage !=
                                      null
                                  ? FileImage(
                                      File(signupProvider.profileImage!.path))
                                  : null,
                              child: signupProvider.profileImage == null
                                  ? SvgPicture.asset(
                                      Assets.profile,
                                      height: 100,
                                      width: 100,
                                    )
                                  : null,
                            ),
                            GestureDetector(
                              onTap: signupProvider.showImagePickerOptions,
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: Color(0xFFD6DA5D),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        InputField(
                          controller: signupProvider.fullNameController,
                          label: "Full Name",
                          keyboardType: TextInputType.name,
                          fillColor: Colors.transparent,
                        ),
                        SizedBox(height: 16),
                        InputField(
                          controller: signupProvider.emailController,
                          label: "Email",
                          keyboardType: TextInputType.emailAddress,
                          fillColor: Colors.transparent,
                        ),
                        SizedBox(height: 16),
                        InputField(
                          controller: signupProvider.passwordController,
                          label: "Password",
                          obscureText: !signupProvider.isPasswordVisible,
                          fillColor: Colors.transparent,
                          suffixIcon: IconButton(
                            icon: Icon(
                              signupProvider.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                signupProvider.isPasswordVisible =
                                    !signupProvider.isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        InputField(
                          controller: signupProvider.confirmPasswordController,
                          label: "Confirm Password",
                          obscureText: !signupProvider.isConfirmPasswordVisible,
                          fillColor: Colors.transparent,
                          suffixIcon: IconButton(
                            icon: Icon(
                              signupProvider.isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                signupProvider.isConfirmPasswordVisible =
                                    !signupProvider.isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            label: "Sign Up",
                            onPressed: () {
                              final fullName =
                                  signupProvider.fullNameController.text;
                              final email = signupProvider.emailController.text;
                              final password =
                                  signupProvider.passwordController.text;
                              final confirmPassword =
                                  signupProvider.confirmPasswordController.text;

                              if (fullName.isEmpty ||
                                  email.isEmpty ||
                                  password.isEmpty ||
                                  confirmPassword.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("All fields are required."),
                                  ),
                                );
                                return;
                              }
                              if (password != confirmPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Passwords do not match."),
                                  ),
                                );
                                return;
                              } else {
                                signupProvider.signupApi();
                              }
                              print("Full Name: $fullName");
                              print("Email: $email");
                              print("Password: $password");
                            },
                          ),
                        ),
                        Spacer(),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
