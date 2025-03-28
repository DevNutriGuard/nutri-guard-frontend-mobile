// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/preferences_for_plan_customization.dart';

class PreferencesForPlanCustomizationScreen4 extends StatefulWidget {
  const PreferencesForPlanCustomizationScreen4({Key? key}) : super(key: key);

  @override
  _PreferencesForPlanCustomizationScreen4State createState() =>
      _PreferencesForPlanCustomizationScreen4State();
}

class _PreferencesForPlanCustomizationScreen4State
    extends State<PreferencesForPlanCustomizationScreen4> {
  @override
  Widget build(BuildContext context) {
    final preferencesForPlanCustomizationModel =
        Provider.of<PreferencesForPlanCustomization>(context);
    preferencesForPlanCustomizationModel.initContext(context: context);
    preferencesForPlanCustomizationModel.currentStep = 2;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Preferences for Plan Customization',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ProgressIndicatorWidget(
              currentStep: preferencesForPlanCustomizationModel.currentStep,
              totalSteps: 4,
              stepWidth: 70,
            ),
            SizedBox(height: 50),
            Text(
              'How often would you like to receive progress updates?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Daily',
              isSelected: preferencesForPlanCustomizationModel
                      .selectedValueForScreen4 ==
                  'DAILY',
              onChanged: (bool? value) {
                setState(() {
                  preferencesForPlanCustomizationModel.selectedValueForScreen4 =
                      value! ? 'DAILY' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Weekly',
              isSelected: preferencesForPlanCustomizationModel
                      .selectedValueForScreen4 ==
                  'WEEKLY',
              onChanged: (bool? value) {
                setState(() {
                  preferencesForPlanCustomizationModel.selectedValueForScreen4 =
                      value! ? 'WEEKLY' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Biweekly',
              isSelected: preferencesForPlanCustomizationModel
                      .selectedValueForScreen4 ==
                  'BIWEEKLY',
              onChanged: (bool? value) {
                setState(() {
                  preferencesForPlanCustomizationModel.selectedValueForScreen4 =
                      value! ? 'BIWEEKLY' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Monthly',
              isSelected: preferencesForPlanCustomizationModel
                      .selectedValueForScreen4 ==
                  'MONTHLY',
              onChanged: (bool? value) {
                setState(() {
                  preferencesForPlanCustomizationModel.selectedValueForScreen4 =
                      value! ? 'MONTHLY' : null;
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
                      if (preferencesForPlanCustomizationModel.currentStep >
                          0) {
                        setState(() {
                          preferencesForPlanCustomizationModel.currentStep--;
                        });
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.preferencesForPlanCustomizationScreen3,
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
                      if (preferencesForPlanCustomizationModel
                              .selectedValueForScreen4 !=
                          null) {
                        setState(() {
                          preferencesForPlanCustomizationModel.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.preferencesForPlanCustomizationScreen5,
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
