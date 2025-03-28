// ignore_for_file: use_super_parameters, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/button_widget.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import 'package:nutri_guard_mobile/core/utils/preferences_services.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import '../../../../res/assets.dart';
import 'package:nutri_guard_mobile/core/widgets/privacy_card.dart';
import '../../../../core/routes/app_routes.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _loadCheckboxState();
  }

  Future<void> _loadCheckboxState() async {
    bool? savedState =
        await PreferencesService.get<bool>('privacyPolicyChecked');
    setState(() {
      isChecked = savedState ?? false;
    });
  }

  Future<void> _saveCheckboxState(bool value) async {
    await PreferencesService.save('privacyPolicyChecked', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        backButtonColor: AppColors.whiteColor,
        backgroundColor: AppColors.whiteColorBg,
        // backgroundColor: Color(0x00f8f8f8),
          onBackPressed: (){
            Navigator.pop(context);
      },
      ),
      backgroundColor: AppColors.whiteColorBg,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getHeight() * 0.03),
              Center(
                child: Image.asset(
                  Assets.privacyImage,
                  height: 96,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Your Privacy Matters",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: "Inter Tight"
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const PrivacyCard(
                iconPath: Assets.privacyMatter1,
                text:
                    "Your personal data is only used to give you personalized needs.",
              ),
              const PrivacyCard(
                iconPath: Assets.privacyMatter2,
                text: "We do not share your personal data with third parties.",
              ),
              const PrivacyCard(
                iconPath: Assets.privacyMatter3,
                text: "Your data stays between you and us.",
              ),
              const SizedBox(height: 130),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                        _saveCheckboxState(isChecked);
                      });
                    },
                    activeColor: const Color(0xFF1F4E6A),
                  ),
                  Expanded(
                    child: Text(
                      "I have read and accepted the terms and conditions and the privacy policy.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  backgroundColor: Colors.red,
                  label: "Continue",
                  onPressed: isChecked
                      ? () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.onboardingAgeScreen);
                        }
                      : null,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
