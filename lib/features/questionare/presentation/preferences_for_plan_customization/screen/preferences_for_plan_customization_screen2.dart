// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/preferences_for_plan_customization.dart';

class PreferencesForPlanCustomizationScreen2 extends StatefulWidget {
  const PreferencesForPlanCustomizationScreen2({Key? key}) : super(key: key);

  @override
  _PreferencesForPlanCustomizationScreen2State createState() =>
      _PreferencesForPlanCustomizationScreen2State();
}

class _PreferencesForPlanCustomizationScreen2State
    extends State<PreferencesForPlanCustomizationScreen2> {
  @override
  Widget build(BuildContext context) {
    final preferencesForPlanCustomizationModel =
        Provider.of<PreferencesForPlanCustomization>(context);
    preferencesForPlanCustomizationModel.initContext(context: context);
    preferencesForPlanCustomizationModel.currentStep = 0;
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
              'How much time can you dedicate to meal preparation each day?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Less than 15 minutes',
              isSelected: preferencesForPlanCustomizationModel
                      .selectedValueForScreen2 ==
                  'LT15',
              onChanged: (bool? value) {
                setState(() {
                  preferencesForPlanCustomizationModel.selectedValueForScreen2 =
                      value! ? 'LT15' : null;
                });
              },
            ),
            RadioOptionTile(
              title: '15-30 minutes',
              isSelected: preferencesForPlanCustomizationModel
                      .selectedValueForScreen2 ==
                  '15_30',
              onChanged: (bool? value) {
                setState(() {
                  preferencesForPlanCustomizationModel.selectedValueForScreen2 =
                      value! ? '15_30' : null;
                });
              },
            ),
            RadioOptionTile(
              title: '30-45 minutes',
              isSelected: preferencesForPlanCustomizationModel
                      .selectedValueForScreen2 ==
                  '30_45',
              onChanged: (bool? value) {
                setState(() {
                  preferencesForPlanCustomizationModel.selectedValueForScreen2 =
                      value! ? '30_45' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'More than 45 minutes',
              isSelected: preferencesForPlanCustomizationModel
                      .selectedValueForScreen2 ==
                  'MT45',
              onChanged: (bool? value) {
                setState(() {
                  preferencesForPlanCustomizationModel.selectedValueForScreen2 =
                      value! ? 'MT45' : null;
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
                        AppRoutes.preferencesForPlanCustomizationScreen1,
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
                              .selectedValueForScreen2 !=
                          null) {
                        setState(() {
                          preferencesForPlanCustomizationModel.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.preferencesForPlanCustomizationScreen3,
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
