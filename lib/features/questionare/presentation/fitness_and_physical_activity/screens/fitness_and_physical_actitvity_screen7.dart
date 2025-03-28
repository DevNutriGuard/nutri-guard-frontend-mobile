// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:nutri_guard_mobile/res/utils.dart';
import 'package:provider/provider.dart';

import '../../../domain/fitness_and_physical_activity_provider.dart';

class FitnessAndPhysicalActitvityScreen7 extends StatefulWidget {
  const FitnessAndPhysicalActitvityScreen7({Key? key}) : super(key: key);

  @override
  _FitnessAndPhysicalActitvityScreen7State createState() =>
      _FitnessAndPhysicalActitvityScreen7State();
}

class _FitnessAndPhysicalActitvityScreen7State
    extends State<FitnessAndPhysicalActitvityScreen7> {
  @override
  Widget build(BuildContext context) {
    final fitnessProvider =
        Provider.of<FitnessAndPhysicalActivityProvider>(context);
    fitnessProvider.initContext(context: context);
    fitnessProvider.currentStep = 5;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Fitness and Physical Activity',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ProgressIndicatorWidget(
                currentStep: fitnessProvider.currentStep, totalSteps: 6),
            SizedBox(height: 50),
            Text(
              'What is your body type goal?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Lean and Toned',
              isSelected:
                  fitnessProvider.selectedValueForBodyType == 'leanAndToned',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueForBodyType =
                      value! ? 'leanAndToned' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Slim and Fit',
              isSelected:
                  fitnessProvider.selectedValueForBodyType == 'slimAndFit',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueForBodyType =
                      value! ? 'slimAndFit' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Curvy and Healthy',
              isSelected:
                  fitnessProvider.selectedValueForBodyType == 'curvyAndHealthy',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueForBodyType =
                      value! ? 'curvyAndHealthy' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Athletic and Endurance-Focused',
              isSelected: fitnessProvider.selectedValueForBodyType ==
                  'athleticAndEnduranceFocused',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueForBodyType =
                      value! ? 'athleticAndEnduranceFocused' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Balanced and Proportional',
              isSelected: fitnessProvider.selectedValueForBodyType ==
                  'balancedAndProportional',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueForBodyType =
                      value! ? 'balancedAndProportional' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Rehabilitation and Recovery',
              isSelected: fitnessProvider.selectedValueForBodyType ==
                  'rehabilitationAndRecovery',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueForBodyType =
                      value! ? 'rehabilitationAndRecovery' : null;
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
                      if (fitnessProvider.currentStep > 0) {
                        setState(() {
                          fitnessProvider.currentStep--;
                        });
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.fitnessAndPhysicalActitvity6,
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
                      debugPrint(
                          "fitnessProvider.selectedValueForCurrentActivity---->${fitnessProvider.selectedValueForCurrentActivity}");

                      debugPrint(
                          "fitnessProvider.selectedValueForExercisePerWeek---->${fitnessProvider.selectedValueForExercisePerWeek}");

                      debugPrint(
                          "fitnessProvider.selectedValueWorkoutsPreference-->${fitnessProvider.selectedValueWorkoutsPreference}");

                      debugPrint(
                          "selectedValueFitnessGoals-->${fitnessProvider.selectedValueFitnessGoals}");

                      debugPrint(
                          "selectedValueEquipmentExercise-->${fitnessProvider.selectedValueEquipmentExercise}");

                      String profileId =
                          await PreferenceUtils.getProfileId() ?? "";
                      if (fitnessProvider.selectedValueForBodyType != null) {
                        setState(() {
                          fitnessProvider.currentStep++;
                        });
                        fitnessProvider
                            .saveDietPreference(profileId: profileId)
                            .then((value) {
                          if (value) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.healthAndBiohackingScreen1,
                              arguments: fitnessProvider.currentStep + 1,
                            );
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select '),
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
