// ignore_for_file: use_super_parameters, library_private_types_in_public_api, prefer_const_constructors, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/setup_profile_progress_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../res/strings.dart';
import '../../../../res/utils.dart';
import '../../domain/onboarding_provider.dart';

class OnboardingHeight extends StatefulWidget {
  const OnboardingHeight({Key? key}) : super(key: key);

  @override
  _OnboardingHeightState createState() => _OnboardingHeightState();
}

class _OnboardingHeightState extends State<OnboardingHeight> {
  late FixedExtentScrollController _scrollController;
  final double itemWidth = 60.0;

  @override
  void initState() {
    super.initState();
    final onboardingProvider =
        Provider.of<OnboardingProvider>(context, listen: false);
    _scrollController = FixedExtentScrollController(
      initialItem: onboardingProvider.isFeet
          ? (onboardingProvider.height * 12).toInt() - 36
          : onboardingProvider.height.toInt() - 100,
    );

    _scrollController.addListener(() {
      int value = _scrollController.selectedItem;
      setState(() {
        onboardingProvider.height = onboardingProvider.isFeet
            ? (value + 36) / 12
            : (value + 100).toDouble();
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
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Your Height',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  SetupProfileProgressIndicator(
                    currentStep: onboardingProvider.currentStep,
                    totalSteps: 4,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'What is your height?',
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
                  const SizedBox(height: 60),
                  SizedBox(
                    height: 250,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 204, 248, 242),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          onboardingProvider.isFeet = false;
                                          _scrollController.jumpToItem(
                                              (onboardingProvider.height - 100)
                                                  .toInt());
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: !onboardingProvider.isFeet
                                              ? Color.fromARGB(
                                                  255, 204, 248, 242)
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: !onboardingProvider.isFeet
                                                ? Color.fromARGB(
                                                    255, 204, 248, 242)
                                                : Colors.grey,
                                          ),
                                        ),
                                        child: Text(
                                          'cm',
                                          style: TextStyle(
                                            color: !onboardingProvider.isFeet
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          onboardingProvider.isFeet = true;
                                          _scrollController.jumpToItem(
                                              (onboardingProvider.height * 12 -
                                                      36)
                                                  .toInt());
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: onboardingProvider.isFeet
                                              ? Color.fromARGB(
                                                  255, 204, 248, 242)
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: onboardingProvider.isFeet
                                                ? Color.fromARGB(
                                                    255, 204, 248, 242)
                                                : Colors.grey,
                                          ),
                                        ),
                                        child: Text(
                                          'ft',
                                          style: TextStyle(
                                            color: onboardingProvider.isFeet
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  onboardingProvider.isFeet
                                      ? '${onboardingProvider.height.toStringAsFixed(2)} ft'
                                      : '${onboardingProvider.height.toInt()} cm',
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              height: 200,
                              padding: const EdgeInsets.all(28),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ListWheelScrollView.useDelegate(
                                    controller: _scrollController,
                                    itemExtent: itemWidth,
                                    perspective: 0.01,
                                    diameterRatio: 1.5,
                                    physics: const FixedExtentScrollPhysics(),
                                    childDelegate:
                                        ListWheelChildBuilderDelegate(
                                      builder: (context, index) {
                                        final isSelected = index ==
                                            _scrollController.selectedItem;
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              onboardingProvider.isFeet
                                                  ? '${((index + 36) / 12).toStringAsFixed(2)}'
                                                  : '${index + 100}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: isSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                color: isSelected
                                                    ? AppColors.primaryColor
                                                    : Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(width: 30),
                                            Expanded(
                                              child: Container(
                                                height: 2,
                                                color: isSelected
                                                    ? AppColors.primaryColor
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      childCount:
                                          onboardingProvider.isFeet ? 60 : 150,
                                    ),
                                  ),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: Container(
                                      width: 40,
                                      height: 2,
                                      color: AppColors.primaryColor,
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.grey),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.onboardingGenderScreen,
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
                            .updateHeight(profileId: profileId)
                            .then(
                          (value) {
                            if (value) {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.onboardingWeightScreen,
                                arguments: onboardingProvider.currentStep + 1,
                              );
                            }
                          },
                        );
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
            ),
          ],
        ),
      ),
    );
  }
}
