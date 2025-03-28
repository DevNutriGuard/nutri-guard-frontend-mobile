// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/date_selector_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/personalized_meal_plans.dart';

class NutritionScreen4 extends StatefulWidget {
  const NutritionScreen4({super.key});

  @override
  NutritionScreen4State createState() => NutritionScreen4State();
}

class NutritionScreen4State extends State<NutritionScreen4> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Personalized meal plans',
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
                  const SizedBox(height: 7),
                  const DateSelectorWidget(),
                  const SizedBox(height: 7),
                  const PersonalizedMealPlans()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
