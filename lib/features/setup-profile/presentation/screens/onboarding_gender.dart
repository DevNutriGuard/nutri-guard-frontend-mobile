// ignore_for_file: use_super_parameters, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/setup_profile_progress_indicator.dart';
import 'package:nutri_guard_mobile/core/utils/preferences_services.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../res/assets.dart';
import '../../../../res/strings.dart';
import '../../../../res/utils.dart';
import '../../domain/onboarding_provider.dart';

class OnboardingGender extends StatefulWidget {
  const OnboardingGender({Key? key}) : super(key: key);

  @override
  _OnboardingGenderState createState() => _OnboardingGenderState();
}

class _OnboardingGenderState extends State<OnboardingGender> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final stepFromArgs =
        ModalRoute.of(context)?.settings.arguments as int? ?? 1;
    context.read<OnboardingProvider>().currentStep = stepFromArgs;
    // _loadSelectedGender();
  }

  // Future<void> _loadSelectedGender() async {
  //   String? savedGender =
  //       await PreferencesService.get<String>('selectedGender');
  //   setState(() {
  //     selectedGender = savedGender ?? "";
  //   });
  // }

  // Future<void> _saveSelectedGender(String gender) async {
  //   await PreferencesService.save('selectedGender', gender);
  // }

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    onboardingProvider.initContext(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Your Gender',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            SetupProfileProgressIndicator(
                currentStep: onboardingProvider.currentStep, totalSteps: 4),
            const SizedBox(height: 30),
            const Text(
              'What is your gender?',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'To Enhance Your Experience, Please Share \n Your Gender.',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 95, 132, 146),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 130),
            Container(
              width: 350,
              height: 220,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 204, 248, 242),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GenderImage(
                    imageAsset: Assets.maleImage,
                    label: 'Male',
                    isSelected: onboardingProvider.selectedGender == "Male",
                    onTap: () {
                      setState(() {
                        onboardingProvider.selectedGender = "Male";
                      });
                      // _saveSelectedGender("Male");
                    },
                  ),
                  GenderImage(
                    imageAsset: Assets.femaleImage,
                    label: 'Female',
                    isSelected: onboardingProvider.selectedGender == "Female",
                    onTap: () {
                      setState(() {
                        onboardingProvider.selectedGender = "Female";
                      });
                      // _saveSelectedGender("Female");
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColors.primaryColor),
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.onboardingAgeScreen,
                        arguments: onboardingProvider.currentStep - 1,
                      );
                    },
                    child: Text(
                      'Previous',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (onboardingProvider.selectedGender.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select a gender')),
                        );
                      } else {
                        final String profileId =
                            PreferenceUtils.getString(Strings.profileId) ?? "";
                        onboardingProvider
                            .updateGender(profileId: profileId)
                            .then((value) {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.onboardingHeightScreen,
                            arguments: onboardingProvider.currentStep + 1,
                          );
                        });
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GenderImage extends StatelessWidget {
  final String imageAsset;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderImage({
    required this.imageAsset,
    required this.label,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                width: 3,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 204, 242, 248),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 204, 242, 248),
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        imageAsset,
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                ),
                if (isSelected)
                  Positioned(
                    top: -3,
                    right: -3,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 6,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 16,
                        color: isSelected ? Colors.black : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
