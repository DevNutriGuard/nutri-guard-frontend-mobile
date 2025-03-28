// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/fitness_and_physical_activity_provider.dart';

class FitnessAndPhysicalActitvityScreen2 extends StatefulWidget {
  const FitnessAndPhysicalActitvityScreen2({Key? key}) : super(key: key);

  @override
  _FitnessAndPhysicalActitvityScreen2State createState() =>
      _FitnessAndPhysicalActitvityScreen2State();
}

class _FitnessAndPhysicalActitvityScreen2State
    extends State<FitnessAndPhysicalActitvityScreen2> {
  @override
  Widget build(BuildContext context) {
    final fitnessProvider =
        Provider.of<FitnessAndPhysicalActivityProvider>(context);
    fitnessProvider.initContext(context: context);
    fitnessProvider.currentStep = 0;
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
              'What is your current activity level?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Sedentary',
              isSelected:
                  fitnessProvider.selectedValueForCurrentActivity == 'SED',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueForCurrentActivity =
                      value! ? 'SED' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Lightly active',
              isSelected:
                  fitnessProvider.selectedValueForCurrentActivity == 'LGT',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueForCurrentActivity =
                      value! ? 'LGT' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Moderately active',
              isSelected:
                  fitnessProvider.selectedValueForCurrentActivity == 'MOD',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueForCurrentActivity =
                      value! ? 'MOD' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Very active',
              isSelected:
                  fitnessProvider.selectedValueForCurrentActivity == 'VRY',
              onChanged: (bool? value) {
                setState(() {
                  fitnessProvider.selectedValueForCurrentActivity =
                      value! ? 'VRY' : null;
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
                        AppRoutes.fitnessAndPhysicalActitvity1,
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
                      if (fitnessProvider.selectedValueForCurrentActivity !=
                          null) {
                        setState(() {
                          fitnessProvider.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.fitnessAndPhysicalActitvity3,
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
    );
  }
}
