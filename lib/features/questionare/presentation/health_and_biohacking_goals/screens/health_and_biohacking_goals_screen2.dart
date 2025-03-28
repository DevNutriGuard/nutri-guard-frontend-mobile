// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:nutri_guard_mobile/features/questionare/domain/health_and_bio_hacking_goals_provider.dart';
import 'package:provider/provider.dart';

class HealthAndBiohakingGoalsScreen2 extends StatefulWidget {
  const HealthAndBiohakingGoalsScreen2({Key? key}) : super(key: key);

  @override
  _HealthAndBiohakingGoalsScreen2State createState() =>
      _HealthAndBiohakingGoalsScreen2State();
}

class _HealthAndBiohakingGoalsScreen2State
    extends State<HealthAndBiohakingGoalsScreen2> {
  @override
  Widget build(BuildContext context) {
    final healthAndBioHacking =
        Provider.of<HealthAndBioHackingGoalsProvider>(context);
    healthAndBioHacking.initContext(context: context);
    healthAndBioHacking.currentStep = 0;
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
              'Do you have specific areas of health you`d like to optimize?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Mental clarity',
              isSelected:
                  healthAndBioHacking.selectedValueForSpecificAreasOfHealth ==
                      'MC',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForSpecificAreasOfHealth =
                      value! ? 'MC' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Physical endurance',
              isSelected:
                  healthAndBioHacking.selectedValueForSpecificAreasOfHealth ==
                      'PE',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForSpecificAreasOfHealth =
                      value! ? 'PE' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Immune support',
              isSelected:
                  healthAndBioHacking.selectedValueForSpecificAreasOfHealth ==
                      'IS',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForSpecificAreasOfHealth =
                      value! ? 'IS' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Sleep quality',
              isSelected:
                  healthAndBioHacking.selectedValueForSpecificAreasOfHealth ==
                      'SQ',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForSpecificAreasOfHealth =
                      value! ? 'SQ' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Energy levels',
              isSelected:
                  healthAndBioHacking.selectedValueForSpecificAreasOfHealth ==
                      'EL',
              onChanged: (bool? value) {
                setState(() {
                  healthAndBioHacking.selectedValueForSpecificAreasOfHealth =
                      value! ? 'EL' : null;
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
                        AppRoutes.healthAndBiohackingScreen1,
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
                              .selectedValueForSpecificAreasOfHealth !=
                          null) {
                        setState(() {
                          healthAndBioHacking.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.healthAndBiohackingScreen3,
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
