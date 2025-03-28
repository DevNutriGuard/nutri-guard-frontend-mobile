// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/check_option_tile.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/features/questionare/domain/diet_and_nutrition_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/radio_widget.dart';

class DietNutritionScreen2 extends StatefulWidget {
  const DietNutritionScreen2({Key? key}) : super(key: key);

  @override
  _DietNutritionScreen2State createState() => _DietNutritionScreen2State();
}

class _DietNutritionScreen2State extends State<DietNutritionScreen2> {
  // void toggleSelection(String value) {
  //   setState(() {
  //     if (selectedValues.contains(value)) {
  //       selectedValues.remove(value);
  //     } else {
  //       selectedValues.add(value);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final dietProvider = Provider.of<DietAndNutritionProvider>(context);
    dietProvider.initContext(context: context);
    dietProvider.currentStep = 0;
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
              'What type of diet do you prefer?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Traditional',
              isSelected: dietProvider.selectedValueForTypeOfDiet == 'TRD',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForTypeOfDiet =
                      value! ? 'TRD' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Vegetarian',
              isSelected: dietProvider.selectedValueForTypeOfDiet == 'VEG',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForTypeOfDiet =
                      value! ? 'VEG' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Pescatarian',
              isSelected: dietProvider.selectedValueForTypeOfDiet == 'PSC',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForTypeOfDiet =
                      value! ? 'PSC' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Keto',
              isSelected: dietProvider.selectedValueForTypeOfDiet == 'KETO',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForTypeOfDiet =
                      value! ? 'KETO' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Paleo',
              isSelected: dietProvider.selectedValueForTypeOfDiet == 'PAL',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForTypeOfDiet =
                      value! ? 'PAL' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Gluten-Free',
              isSelected: dietProvider.selectedValueForTypeOfDiet == 'GLF',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForTypeOfDiet =
                      value! ? 'GLF' : null;
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
                        AppRoutes.dietNurtion1,
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
                          "dietProvider.selectedValueForTypeOfDiet-->${dietProvider.selectedValueForTypeOfDiet}");
                      if (dietProvider.selectedValueForTypeOfDiet != null ||
                          dietProvider.selectedValueForTypeOfDiet != '') {
                        setState(() {
                          dietProvider.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.dietNurtion3,
                          arguments: dietProvider.currentStep + 1,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select at least one option.'),
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
