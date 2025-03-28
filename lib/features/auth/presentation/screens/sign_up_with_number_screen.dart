// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nutri_guard_mobile/core/theme/app_text_styles.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import 'package:provider/provider.dart';

import '../../domain/signup_provider.dart';

class SignUpWithPhone extends StatefulWidget {
  const SignUpWithPhone({super.key});
  @override
  _SignUpWithPhoneState createState() => _SignUpWithPhoneState();
}

class _SignUpWithPhoneState extends State<SignUpWithPhone> {


  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);
    signupProvider.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: sizes?.height,
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
                  height: getHeight() * 0.85,
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
                        "Sign Up with Phone",
                        style: AppTextStyles.heading,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Please enter your details to continue.",
                        style: AppTextStyles.subheading,
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
                              signupProvider.completePhoneNumber = number.phoneNumber;
                            });
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.DROPDOWN,
                          ),
                          initialValue: signupProvider.number,
                          textFieldController: signupProvider.phoneController,
                          formatInput: true,
                          keyboardType: TextInputType.phone,
                          inputDecoration: InputDecoration(
                            labelText: "Phone Number",
                            labelStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight() * 0.05,),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          label: "Sign Up",
                          onPressed: () {
                            String phone = signupProvider.completePhoneNumber??'';
                            if (phone!='') {
                              signupProvider.phoneSignupApi();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Enter phone number")),
                              );
                            }
                          },
                        ),
                      ),
                    ],
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
