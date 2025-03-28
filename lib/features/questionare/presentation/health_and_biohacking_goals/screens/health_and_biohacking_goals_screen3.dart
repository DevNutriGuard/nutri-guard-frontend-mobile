// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/health_and_bio_hacking_goals_provider.dart';

class HealthAndBiohakingGoalsScreen3 extends StatefulWidget {
  const HealthAndBiohakingGoalsScreen3({Key? key}) : super(key: key);

  @override
  _HealthAndBiohakingGoalsScreen3State createState() =>
      _HealthAndBiohakingGoalsScreen3State();
}

class _HealthAndBiohakingGoalsScreen3State
    extends State<HealthAndBiohakingGoalsScreen3> {
  // void toggleSelection(String value) {
  //   setState(() {
  //     if (selectedValueForAnyBioHackingPracticess.contains(value)) {
  //       selectedValueForAnyBioHackingPracticess.remove(value);
  //     } else {
  //       selectedValueForAnyBioHackingPracticess.add(value);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final healthAndBioHacking =
        Provider.of<HealthAndBioHackingGoalsProvider>(context);
    healthAndBioHacking.initContext(context: context);
    healthAndBioHacking.currentStep = 1;
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
              currentStep: healthAndBioHacking.currentStep,
              totalSteps: 4,
              stepWidth: 70,
            ),
            SizedBox(height: 50),
            Text(
              'Are there any biohacking practices you’re interested in exploring?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Intermittent fasting',
              isSelected:
                  healthAndBioHacking.selectedValueForAnyBioHackingPractices ==
                      'IF',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForAnyBioHackingPractices =
                      value! ? 'IF' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Cold therapy',
              isSelected:
                  healthAndBioHacking.selectedValueForAnyBioHackingPractices ==
                      'CT',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForAnyBioHackingPractices =
                      value! ? 'CT' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Meditation',
              isSelected:
                  healthAndBioHacking.selectedValueForAnyBioHackingPractices ==
                      'MED',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForAnyBioHackingPractices =
                      value! ? 'MED' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Nutritional supplements',
              isSelected:
                  healthAndBioHacking.selectedValueForAnyBioHackingPractices ==
                      'NS',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForAnyBioHackingPractices =
                      value! ? 'NS' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'No preference',
              isSelected:
                  healthAndBioHacking.selectedValueForAnyBioHackingPractices ==
                      'NP',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForAnyBioHackingPractices =
                      value! ? 'NP' : null;
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
                      if (healthAndBioHacking.currentStep > 0) {
                        setState(() {
                          healthAndBioHacking.currentStep--;
                        });
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.healthAndBiohackingScreen2,
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
                      if (healthAndBioHacking
                              .selectedValueForAnyBioHackingPractices !=
                          null) {
                        setState(() {
                          healthAndBioHacking.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.healthAndBiohackingScreen4,
                        );
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
