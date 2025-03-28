// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/health_and_bio_hacking_goals_provider.dart';

class HealthAndBiohakingGoalsScreen4 extends StatefulWidget {
  const HealthAndBiohakingGoalsScreen4({Key? key}) : super(key: key);

  @override
  _HealthAndBiohakingGoalsScreen4State createState() =>
      _HealthAndBiohakingGoalsScreen4State();
}

class _HealthAndBiohakingGoalsScreen4State
    extends State<HealthAndBiohakingGoalsScreen4> {
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
              currentStep: healthAndBioHacking.currentStep,
              totalSteps: 4,
              stepWidth: 70,
            ),
            SizedBox(height: 50),
            Text(
              'Do you track any health metrics (e.g., steps, heart rate) with a wearable device?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Yes',
              isSelected:
                  healthAndBioHacking.selectedValueForTrackingHealthPractices ==
                      'yes',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForTrackingHealthPractices =
                      value! ? 'yes' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'No',
              isSelected:
                  healthAndBioHacking.selectedValueForTrackingHealthPractices ==
                      'no',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForTrackingHealthPractices =
                      value! ? 'no' : null;
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
                        AppRoutes.healthAndBiohackingScreen3,
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
                              .selectedValueForTrackingHealthPractices !=
                          null) {
                        setState(() {
                          healthAndBioHacking.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.healthAndBiohackingScreen5,
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
