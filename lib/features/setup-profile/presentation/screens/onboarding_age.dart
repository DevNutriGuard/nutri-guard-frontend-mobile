// ignore_for_file: prefer_const_constructors, use_super_parameters, library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/setup_profile_progress_indicator.dart';
import 'package:nutri_guard_mobile/features/setup-profile/domain/onboarding_provider.dart';
import 'package:nutri_guard_mobile/res/res_export.dart';
import 'package:nutri_guard_mobile/res/utils.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_routes.dart';

class OnboardingAge extends StatefulWidget {
  const OnboardingAge({Key? key}) : super(key: key);

  @override
  _OnboardingAgeState createState() => _OnboardingAgeState();
}

class _OnboardingAgeState extends State<OnboardingAge> {
  int selectedAge = 32;
  late FixedExtentScrollController _scrollController;

  final double itemWidth = 60.0;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(
      initialItem: selectedAge - 1,
    );

    _scrollController.addListener(() {
      int age = _scrollController.selectedItem + 1;
      setState(() {
        selectedAge = age;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
              'Your age',
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
              'What is your age?',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'This Helps Us Tailor Your Personalized Plan',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 95, 132, 146),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 110),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 370,
                  height: 240,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 204, 248, 242),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Container(
                      width: 330,
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(0, 4),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$selectedAge',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Year',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 310,
                              height: 110,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 245, 243, 243),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                        width: 2,
                                        height: 30,
                                        color: AppColors.primaryColor),
                                  ),
                                  Positioned(
                                    bottom: 30,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    child: SizedBox(
                                      width: 310,
                                      height: 105,
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: ListWheelScrollView.useDelegate(
                                          controller: _scrollController,
                                          itemExtent: itemWidth,
                                          perspective: 0.01,
                                          diameterRatio: 1.5,
                                          physics: FixedExtentScrollPhysics(),
                                          childDelegate:
                                              ListWheelChildBuilderDelegate(
                                            builder: (context, index) {
                                              final isSelected = index ==
                                                  _scrollController
                                                      .selectedItem;
                                              return RotatedBox(
                                                quarterTurns: -1,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${index + 1}',
                                                            style: TextStyle(
                                                              fontSize:
                                                                  isSelected
                                                                      ? 20
                                                                      : 16,
                                                              fontWeight: isSelected
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                              color: isSelected
                                                                  ? Colors.black
                                                                  : Colors.grey
                                                                      .shade400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Positioned(
                                                        bottom: 5,
                                                        child: Container(
                                                          width: 2,
                                                          height: 20,
                                                          color: isSelected
                                                              ? Colors.black
                                                              : Colors.grey
                                                                  .shade400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            childCount: 100,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColors.borderColor, width: 1),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.privacyPolicyScreen,
                        arguments: onboardingProvider.currentStep - 1,
                      );
                    },
                    child: const Text(
                      'Previous',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      final String profileId =
                          PreferenceUtils.getString(Strings.profileId) ?? "";
                      onboardingProvider
                          .updateAge(profileId: profileId)
                          .then((value) {
                        if (value) {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.onboardingGenderScreen,
                            arguments: onboardingProvider.currentStep + 1,
                          );
                        }
                      });
                    },
                    child: const Text(
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
