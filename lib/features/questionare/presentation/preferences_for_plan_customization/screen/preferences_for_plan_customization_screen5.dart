// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../res/toasts.dart';
import '../../../../../res/utils.dart';
import '../../../domain/preferences_for_plan_customization.dart';

class PreferencesForPlanCustomizationScreen5 extends StatefulWidget {
  const PreferencesForPlanCustomizationScreen5({Key? key}) : super(key: key);

  @override
  _PreferencesForPlanCustomizationScreen5State createState() =>
      _PreferencesForPlanCustomizationScreen5State();
}

class _PreferencesForPlanCustomizationScreen5State
    extends State<PreferencesForPlanCustomizationScreen5> {
  @override
  Widget build(BuildContext context) {
    final preferencesForPlanCustomizationModel =
        Provider.of<PreferencesForPlanCustomization>(context);
    preferencesForPlanCustomizationModel.initContext(context: context);
    preferencesForPlanCustomizationModel.currentStep = 3;
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
              'Do you want to set reminders for meals, medications, supplements, or workouts?',
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
              isSelected: preferencesForPlanCustomizationModel
                      .selectedValueForScreen5 ==
                  'YES',
              onChanged: (bool? value) {
                setState(() {
                  preferencesForPlanCustomizationModel.selectedValueForScreen5 =
                      value! ? 'YES' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'No',
              isSelected: preferencesForPlanCustomizationModel
                      .selectedValueForScreen5 ==
                  'NO',
              onChanged: (bool? value) {
                setState(() {
                  preferencesForPlanCustomizationModel.selectedValueForScreen5 =
                      value! ? 'NO' : null;
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
                        AppRoutes.preferencesForPlanCustomizationScreen4,
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
                      final provider =
                          Provider.of<PreferencesForPlanCustomization>(context,
                              listen: false);
                      final profileId = await PreferenceUtils.getProfileId();

                      await provider
                          .savePreferencesForPlanCustomization(
                        profileId:
                            profileId ?? "", // Send health concerns if 'Yes'
                      )
                          .then((value) {
                        if (value) {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.homeScreen,
                          );
                        } else {
                          Toasts.getErrorToast(text: "Something bad happened.");
                        }
                      });

                      setState(() {
                        provider.currentStep++;
                      });
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
