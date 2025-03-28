// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/advanced_features_selection.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/calorie_and_macronutrient_customization_selection.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/dietary_restrictions_selection.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/goal_selection.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/meal_preferences_selection.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';

class AddDietGoalsScreen extends StatefulWidget {
  const AddDietGoalsScreen({super.key});

  @override
  AddDietGoalsScreenState createState() => AddDietGoalsScreenState();
}

class AddDietGoalsScreenState extends State<AddDietGoalsScreen> {
  DateTime selectedDate = DateTime.now();

  void _onAddButtonPressed() {
    print("data added");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Add Diet Goals',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GoalSelection(),
                  SizedBox(
                    height: 2,
                  ),
                  CalorieAndMacronutrientCustomizationSelection(),
                  SizedBox(
                    height: 2,
                  ),
                  DietaryRestrictionsSelection(),
                  SizedBox(
                    height: 2,
                  ),
                  MealPreferencesSelection(),
                  SizedBox(
                    height: 2,
                  ),
                  AdvancedFeaturesSelection(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: CustomButton(
                      onPressed: _onAddButtonPressed,
                      label: "Add",
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
