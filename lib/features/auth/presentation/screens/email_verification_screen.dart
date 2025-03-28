// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/theme/app_text_styles.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import 'package:nutri_guard_mobile/core/widgets/otp_field.dart';
import 'package:provider/provider.dart';

import '../../domain/signup_provider.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;

  const EmailVerificationScreen({required this.email});

  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);
    signupProvider.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Verify Your Email",
          style: AppTextStyles.heading,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Verify Your Email",
                  style: AppTextStyles.heading,
                ),
                SizedBox(height: 8),
                Text(
                  "Enter the 4-digit code sent to ${widget.email}",
                  style: AppTextStyles.subheading,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtpField(
                      controller: _controller1,
                      focusNode: _focusNode1,
                      nextFocusNode: _focusNode2,
                    ),
                    SizedBox(width: 10),
                    OtpField(
                      controller: _controller2,
                      focusNode: _focusNode2,
                      nextFocusNode: _focusNode3,
                    ),
                    SizedBox(width: 10),
                    OtpField(
                      controller: _controller3,
                      focusNode: _focusNode3,
                      nextFocusNode: _focusNode4,
                    ),
                    SizedBox(width: 10),
                    OtpField(
                      controller: _controller4,
                      focusNode: _focusNode4,
                    ),
                  ],
                ),
                SizedBox(height: 90),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    label: "Continue",
                    onPressed: () {
                      String code = _controller1.text +
                          _controller2.text +
                          _controller3.text +
                          _controller4.text;
                      if (code.length == 4) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Verifying code: $code")),
                        );
                        signupProvider.verifyOtpApi(verificationType: "email", identifier: widget.email, otpCode: code);
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Please enter a 4-digit code")),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
