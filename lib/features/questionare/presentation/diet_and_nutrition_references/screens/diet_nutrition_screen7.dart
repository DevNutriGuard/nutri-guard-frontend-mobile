// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/diet_and_nutrition_provider.dart';

class DietNutritionScreen7 extends StatefulWidget {
  const DietNutritionScreen7({Key? key}) : super(key: key);

  @override
  _DietNutritionScreen7State createState() => _DietNutritionScreen7State();
}

class _DietNutritionScreen7State extends State<DietNutritionScreen7> {
  @override
  Widget build(BuildContext context) {
    final dietProvider = Provider.of<DietAndNutritionProvider>(context);
    dietProvider.initContext(context: context);
    dietProvider.currentStep = 5;
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
              'How many meals do you prefer to eat per day?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            RadioOptionTile(
              title: '1-2',
              isSelected:
                  dietProvider.selectedValueForMealFrequencyCode == 'ONE_TWO',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForMealFrequencyCode =
                      value! ? 'ONE_TWO' : null;
                });
              },
            ),
            RadioOptionTile(
              title: '3',
              isSelected:
                  dietProvider.selectedValueForMealFrequencyCode == 'THREE',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForMealFrequencyCode =
                      value! ? 'THREE' : null;
                });
              },
            ),
            RadioOptionTile(
              title: '4-5',
              isSelected:
                  dietProvider.selectedValueForMealFrequencyCode == 'FOUR_FIVE',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForMealFrequencyCode =
                      value! ? 'FOUR_FIVE' : null;
                });
              },
            ),
            RadioOptionTile(
              title: '6+',
              isSelected:
                  dietProvider.selectedValueForMealFrequencyCode == 'SIX_PLUS',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForMealFrequencyCode =
                      value! ? 'SIX_PLUS' : null;
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
                        AppRoutes.dietNurtion6,
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
                          "dietProvider.selectedValueForMealFrequencyCode-->${dietProvider.selectedValueForMealFrequencyCode}");

                      if (dietProvider.selectedValueForMealFrequencyCode !=
                          null) {
                        setState(() {
                          dietProvider.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.dietNurtion8,
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
