// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/diet_and_nutrition_provider.dart';

class DietNutritionScreen5 extends StatefulWidget {
  const DietNutritionScreen5({Key? key}) : super(key: key);

  @override
  _DietNutritionScreen5State createState() => _DietNutritionScreen5State();
}

class _DietNutritionScreen5State extends State<DietNutritionScreen5> {
  @override
  Widget build(BuildContext context) {
    final dietProvider = Provider.of<DietAndNutritionProvider>(context);
    dietProvider.initContext(context: context);
    dietProvider.currentStep = 3;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Diet and Nutrition Preferences',
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
              'Do you have any dietary preferences based on religious or cultural practices?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Halal',
              isSelected:
                  dietProvider.selectedValueForReligiousPreference == 'HAL',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForReligiousPreference =
                      value! ? 'HAL' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Kosher',
              isSelected:
                  dietProvider.selectedValueForReligiousPreference == 'KOS',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForReligiousPreference =
                      value! ? 'KOS' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Hindu Vegetarian',
              isSelected:
                  dietProvider.selectedValueForReligiousPreference == 'HVEG',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForReligiousPreference =
                      value! ? 'HVEG' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Buddhist Vegetarian',
              isSelected:
                  dietProvider.selectedValueForReligiousPreference == 'BVEG',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForReligiousPreference =
                      value! ? 'BVEG' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'No preference',
              isSelected:
                  dietProvider.selectedValueForReligiousPreference == 'NOPREF',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForReligiousPreference =
                      value! ? 'NOPREF' : null;
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
                        AppRoutes.dietNurtion4,
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
                          "dietProvider.selectedValueForReligiousPreference-->${dietProvider.selectedValueForReligiousPreference}");

                      if (dietProvider.selectedValueForReligiousPreference !=
                          null) {
                        setState(() {
                          dietProvider.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.dietNurtion6,
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
