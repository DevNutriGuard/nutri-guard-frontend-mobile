// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/fitness_and_physical_activity_provider.dart';

class FitnessAndPhysicalActitvityScreen6 extends StatefulWidget {
  const FitnessAndPhysicalActitvityScreen6({Key? key}) : super(key: key);

  @override
  _FitnessAndPhysicalActitvityScreen6State createState() =>
      _FitnessAndPhysicalActitvityScreen6State();
}

class _FitnessAndPhysicalActitvityScreen6State
    extends State<FitnessAndPhysicalActitvityScreen6> {
  @override
  Widget build(BuildContext context) {
    final fitnessProvider =
        Provider.of<FitnessAndPhysicalActivityProvider>(context);
    fitnessProvider.initContext(context: context);
    fitnessProvider.currentStep = 4;
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
              'Would you like your plan to include no-equipment exercises?',
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
                  fitnessProvider.selectedValueEquipmentExercise == 'YES',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueEquipmentExercise =
                      value! ? 'YES' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'No',
              isSelected:
                  fitnessProvider.selectedValueEquipmentExercise == 'NO',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueEquipmentExercise =
                      value! ? 'NO' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'No preference',
              isSelected:
                  fitnessProvider.selectedValueEquipmentExercise == 'NP',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueEquipmentExercise =
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
                      if (fitnessProvider.currentStep > 0) {
                        setState(() {
                          fitnessProvider.currentStep--;
                        });
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.fitnessAndPhysicalActitvity5,
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
                      print(
                          "fitnessProvider.selectedValueForCurrentActivity---->${fitnessProvider.selectedValueForCurrentActivity}");

                      print(
                          "fitnessProvider.selectedValueForExercisePerWeek---->${fitnessProvider.selectedValueForExercisePerWeek}");

                      print(
                          "fitnessProvider.selectedValueWorkoutsPreference-->${fitnessProvider.selectedValueWorkoutsPreference}");

                      print(
                          "selectedValueFitnessGoals-->${fitnessProvider.selectedValueFitnessGoals}");

                      print(
                          "selectedValueEquipmentExercise-->${fitnessProvider.selectedValueEquipmentExercise}");

                      if (fitnessProvider.selectedValueEquipmentExercise !=
                              null ||
                          fitnessProvider.selectedValueEquipmentExercise !=
                              '') {
                        setState(() {
                          fitnessProvider.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.fitnessAndPhysicalActitvity7,
                          arguments: fitnessProvider.currentStep + 1,
                        );
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
