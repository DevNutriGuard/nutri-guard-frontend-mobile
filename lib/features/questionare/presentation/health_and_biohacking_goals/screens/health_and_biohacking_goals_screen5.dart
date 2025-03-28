// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:nutri_guard_mobile/res/utils.dart';
import 'package:provider/provider.dart';

import '../../../domain/health_and_bio_hacking_goals_provider.dart';

class HealthAndBiohakingGoalsScreen5 extends StatefulWidget {
  const HealthAndBiohakingGoalsScreen5({Key? key}) : super(key: key);

  @override
  _HealthAndBiohakingGoalsScreen5State createState() =>
      _HealthAndBiohakingGoalsScreen5State();
}

class _HealthAndBiohakingGoalsScreen5State
    extends State<HealthAndBiohakingGoalsScreen5> {
  int currentStep = 3;

  // void toggleSelection(String value) {
  //   setState(() {
  //     if (selectedValuesForImprovingYourHealth.contains(value)) {
  //       selectedValuesForImprovingYourHealth.remove(value);
  //     } else {
  //       selectedValuesForImprovingYourHealth.add(value);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final healthAndBioHacking =
        Provider.of<HealthAndBioHackingGoalsProvider>(context);
    healthAndBioHacking.initContext(context: context);
    healthAndBioHacking.currentStep = 2;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Health and Biohacking Goals',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ProgressIndicatorWidget(
              currentStep: currentStep,
              totalSteps: 4,
              stepWidth: 70,
            ),
            SizedBox(height: 50),
            Text(
              'What motivates you to improve your health?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Achieving personal goals',
              isSelected:
                  healthAndBioHacking.selectedValuesForImprovingYourHealth ==
                      'APG',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValuesForImprovingYourHealth =
                      value! ? 'yes' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Improving daily performance',
              isSelected:
                  healthAndBioHacking.selectedValuesForImprovingYourHealth ==
                      'IDP',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValuesForImprovingYourHealth =
                      value! ? 'IDP' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Long-term wellness',
              isSelected:
                  healthAndBioHacking.selectedValuesForImprovingYourHealth ==
                      'LTW',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValuesForImprovingYourHealth =
                      value! ? 'LTW' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Family or personal relationships',
              isSelected:
                  healthAndBioHacking.selectedValuesForImprovingYourHealth ==
                      'FPR',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValuesForImprovingYourHealth =
                      value! ? 'FPR' : null;
                });
              },
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
                      if (currentStep > 0) {
                        setState(() {
                          currentStep--;
                        });
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.comprehensiveHealthTestingScreen2,
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
                    onPressed: () async {
                      String profileId =
                          await PreferenceUtils.getProfileId() ?? "";
                      if (healthAndBioHacking
                              .selectedValuesForImprovingYourHealth !=
                          null) {
                        setState(() {
                          currentStep++;
                        });
                        healthAndBioHacking
                            .saveBioHackingGoals(profileId: profileId)
                            .then((value) {
                          if (value) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.comprehensiveHealthTestingScreen1,
                            );
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select an option'),
                          ),
                        );
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
