// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/diet_and_nutrition_provider.dart';

class DietNutritionScreen6 extends StatefulWidget {
  const DietNutritionScreen6({Key? key}) : super(key: key);

  @override
  _DietNutritionScreen6State createState() => _DietNutritionScreen6State();
}

class _DietNutritionScreen6State extends State<DietNutritionScreen6> {
  @override
  Widget build(BuildContext context) {
    final dietProvider = Provider.of<DietAndNutritionProvider>(context);
    dietProvider.initContext(context: context);
    dietProvider.currentStep = 4;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Diet and Nutrition  ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ProgressIndicatorWidget(
                currentStep: dietProvider.currentStep, totalSteps: 7),
            SizedBox(height: 50),
            Text(
              'What are your primary dietary goals?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Weight Loss',
              isSelected:
                  dietProvider.selectedValueForPrimaryDietaryGoal == 'WL',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForPrimaryDietaryGoal =
                      value! ? 'WL' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Muscle Gain',
              isSelected:
                  dietProvider.selectedValueForPrimaryDietaryGoal == 'MG',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForPrimaryDietaryGoal =
                      value! ? 'MG' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Increased Energy',
              isSelected:
                  dietProvider.selectedValueForPrimaryDietaryGoal == 'IE',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForPrimaryDietaryGoal =
                      value! ? 'IE' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Improved Digestion',
              isSelected:
                  dietProvider.selectedValueForPrimaryDietaryGoal == 'ID',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForPrimaryDietaryGoal =
                      value! ? 'ID' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'General Wellness',
              isSelected:
                  dietProvider.selectedValueForPrimaryDietaryGoal == 'GW',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForPrimaryDietaryGoal =
                      value! ? 'GW' : null;
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
                      if (dietProvider.currentStep > 0) {
                        setState(() {
                          dietProvider.currentStep--;
                        });
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.dietNurtion5,
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
                          "dietProvider.selectedValueForPrimaryDietaryGoal-->${dietProvider.selectedValueForPrimaryDietaryGoal}");
                      if (dietProvider.selectedValueForPrimaryDietaryGoal !=
                              null ||
                          dietProvider.selectedValueForPrimaryDietaryGoal !=
                              '') {
                        setState(() {
                          dietProvider.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.dietNurtion7,
                          arguments: dietProvider.currentStep + 1,
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
