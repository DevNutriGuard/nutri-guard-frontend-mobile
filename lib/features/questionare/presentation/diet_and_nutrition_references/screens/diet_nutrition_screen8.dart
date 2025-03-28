// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:nutri_guard_mobile/res/utils.dart';
import 'package:provider/provider.dart';

import '../../../domain/diet_and_nutrition_provider.dart';

class DietNutritionScreen8 extends StatefulWidget {
  const DietNutritionScreen8({Key? key}) : super(key: key);

  @override
  _DietNutritionScreen8State createState() => _DietNutritionScreen8State();
}

class _DietNutritionScreen8State extends State<DietNutritionScreen8> {
  @override
  Widget build(BuildContext context) {
    final dietProvider = Provider.of<DietAndNutritionProvider>(context);
    dietProvider.initContext(context: context);
    dietProvider.currentStep = 6;
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
              'Are there specific types of foods or nutrients you’d like to focus on?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'High Protein',
              isSelected:
                  dietProvider.selectedValueForNutrientPreference == 'HP',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForNutrientPreference =
                      value! ? 'HP' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Low Carb',
              isSelected:
                  dietProvider.selectedValueForNutrientPreference == 'LC',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForNutrientPreference =
                      value! ? 'LC' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Fiber-Rich',
              isSelected:
                  dietProvider.selectedValueForNutrientPreference == 'FR',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForNutrientPreference =
                      value! ? 'FR' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Heart-Healthy',
              isSelected:
                  dietProvider.selectedValueForNutrientPreference == 'HH',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForNutrientPreference =
                      value! ? 'HH' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Immune-Boosting',
              isSelected:
                  dietProvider.selectedValueForNutrientPreference == 'IB',
              onChanged: (bool? value) {
                setState(() {
                  dietProvider.selectedValueForNutrientPreference =
                      value! ? 'IB' : null;
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
                    onPressed: () async {
                      print(
                          "dietProvider.selectedValueForNutrientPreference-->${dietProvider.selectedValueForNutrientPreference}");

                      String profileId =
                          await PreferenceUtils.getProfileId() ?? "";
                      if (dietProvider.selectedValueForNutrientPreference !=
                              null ||
                          dietProvider.selectedValueForNutrientPreference !=
                              '') {
                        setState(() {
                          dietProvider.currentStep++;
                        });
                        dietProvider
                            .saveDietPreference(profileId: profileId)
                            .then((value) {
                          if (value) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.fitnessAndPhysicalActitvity1,
                              arguments: dietProvider.currentStep + 1,
                            );
                          }
                        });
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
