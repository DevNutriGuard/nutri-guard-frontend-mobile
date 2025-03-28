// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../res/res.dart';
import '../../../domain/fitness_and_physical_activity_provider.dart';

class FitnessAndPhysicalActitvityScreen4 extends StatefulWidget {
  const FitnessAndPhysicalActitvityScreen4({Key? key}) : super(key: key);

  @override
  _FitnessAndPhysicalActitvityScreen4State createState() =>
      _FitnessAndPhysicalActitvityScreen4State();
}

class _FitnessAndPhysicalActitvityScreen4State
    extends State<FitnessAndPhysicalActitvityScreen4> {
  @override
  Widget build(BuildContext context) {
    final fitnessProvider =
        Provider.of<FitnessAndPhysicalActivityProvider>(context);
    fitnessProvider.initContext(context: context);
    fitnessProvider.currentStep = 2;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        height: sizes!.height,
        width: sizes!.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
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
                  'What type of workouts do you prefer?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                RadioOptionTile(
                  title: 'Strength Training',
                  isSelected:
                      fitnessProvider.selectedValueWorkoutsPreference == 'ST',
                  onChanged: (bool? value) {
                    setState(() {
                      fitnessProvider.selectedValueWorkoutsPreference =
                          value! ? 'ST' : null;
                    });
                  },
                ),
                RadioOptionTile(
                  title: 'Cardio',
                  isSelected:
                      fitnessProvider.selectedValueWorkoutsPreference == 'CRD',
                  onChanged: (bool? value) {
                    setState(() {
                      fitnessProvider.selectedValueWorkoutsPreference =
                          value! ? 'CRD' : null;
                    });
                  },
                ),
                RadioOptionTile(
                  title: 'Yoga',
                  isSelected:
                      fitnessProvider.selectedValueWorkoutsPreference == 'YGA',
                  onChanged: (bool? value) {
                    setState(() {
                      fitnessProvider.selectedValueWorkoutsPreference =
                          value! ? 'YGA' : null;
                    });
                  },
                ),
                RadioOptionTile(
                  title: 'Pilates',
                  isSelected:
                      fitnessProvider.selectedValueWorkoutsPreference == 'PLT',
                  onChanged: (bool? value) {
                    setState(() {
                      fitnessProvider.selectedValueWorkoutsPreference =
                          value! ? 'PLT' : null;
                    });
                  },
                ),
                RadioOptionTile(
                  title: 'High-Intensity Interval Training (HIIT)',
                  isSelected:
                      fitnessProvider.selectedValueWorkoutsPreference == 'HIIT',
                  onChanged: (bool? value) {
                    setState(() {
                      fitnessProvider.selectedValueWorkoutsPreference =
                          value! ? 'HIIT' : null;
                    });
                  },
                ),
                RadioOptionTile(
                  title: 'Walking',
                  isSelected:
                      fitnessProvider.selectedValueWorkoutsPreference == 'WLK',
                  onChanged: (bool? value) {
                    setState(() {
                      fitnessProvider.selectedValueWorkoutsPreference =
                          value! ? 'WLK' : null;
                    });
                  },
                ),
                RadioOptionTile(
                  title: 'Custom',
                  isSelected:
                      fitnessProvider.selectedValueWorkoutsPreference == 'CST',
                  onChanged: (bool? value) {
                    setState(() {
                      fitnessProvider.selectedValueWorkoutsPreference =
                          value! ? 'CST' : null;
                    });
                  },
                ),
                // Spacer(),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: AppColors.primaryColor),
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 40),
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
                            AppRoutes.fitnessAndPhysicalActitvity3,
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
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 40),
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
                          if (fitnessProvider.selectedValueWorkoutsPreference !=
                                  null ||
                              fitnessProvider.selectedValueWorkoutsPreference !=
                                  '') {
                            setState(() {
                              fitnessProvider.currentStep++;
                            });
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.fitnessAndPhysicalActitvity5,
                              arguments: fitnessProvider.currentStep + 1,
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
        ),
      ),
    );
  }
}
