// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nutri_guard_mobile/core/theme/app_text_styles.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import 'package:nutri_guard_mobile/core/widgets/social_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/features/auth/domain/login_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../domain/signup_provider.dart';
import '../../../../res/assets.dart';

class SignInWithNumber extends StatefulWidget {
  const SignInWithNumber({super.key});
  @override
  _SignInWithNumberState createState() => _SignInWithNumberState();
}

class _SignInWithNumberState extends State<SignInWithNumber> {
  final TextEditingController phoneController = TextEditingController();
  String initialCountry = 'US';
  String ?completeNumber;
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  bool rememberMe = false;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/logo.svg',
                          height: 30,
                        ),
                      ),
                    ),
                  ],
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
                        "Please enter your phone number to continue.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                            setState(() {
                              completeNumber = number.phoneNumber;
                            });
                          },
                          onInputValidated: (bool isValid) {
                            print(isValid ? "Valid number" : "Invalid number");
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.DROPDOWN,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: phoneController,
                          formatInput: true,
                          keyboardType: TextInputType.phone,
                          inputDecoration: InputDecoration(
                            labelText: "Phone Number",
                            labelStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
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
                            final phone = completeNumber??"";
                            if (phone.isNotEmpty) {
                              print("Phone number: $phone");
                              print("Remember me: $rememberMe");
                              loginProvider.loginWithPhoneApi(phoneNumber: phone);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Invalid phone number")),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgotPasswordPhone');
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                      const SizedBox(height: 32),
                      SocialButton(
                        svgIconPath: Assets.mail,
                        text: "Continue with Email",
                        textColor: Colors.black,
                        onPressed: () =>
                            Navigator.pushNamed(context, "/signIn"),
                        colors: [Color(0xFFE0E0E0), Color(0xFFF5F5F5)],
                        textStyle: AppTextStyles.buttonTextStyle,
                      ),
                      const SizedBox(height: 16),
                      SocialButton(
                        svgIconPath: Assets.facebook,
                        text: "Continue with Facebook",
                        textColor: Colors.blue,
                        onPressed: () =>
                            Navigator.pushNamed(context, "/facebookSignUp"),
                        colors: [Color(0xFFD6F2FF), Color(0xFFE6F7FF)],
                        textStyle: AppTextStyles.buttonTextStyle,
                      ),
                      const SizedBox(height: 16),
                      SocialButton(
                        svgIconPath: Assets.google,
                        text: "Continue with Google",
                        textColor: Colors.black,
                        onPressed: () =>
                            Navigator.pushNamed(context, "/googleSignUp"),
                        colors: [Color(0xFFFFE6E6), Color(0xFFFFF2F2)],
                        textStyle: AppTextStyles.buttonTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "/signUpWithPhoneNumber");
                            },
                            child: const Text(
                              "Sign Up",
                              style: AppTextStyles.signInLink,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
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
