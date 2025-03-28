// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/button_widget.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/domain/nutrition_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/presentation/daily_meal_suggestions_card_screens/avocado_toast_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';

class DailyMealSuggestionsWidget extends StatelessWidget {
  const DailyMealSuggestionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NutritionProvider>(context);
    final nutritionData =
        provider.getNutritionPlanResponseModel.data?.nutritionPlanData;

    // Retrieve meal plans
    final mealPlans = nutritionData?.mealPlans ?? [];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
      width: double.infinity,
      height: 370.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Daily Meal Suggestions",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNutrientCard(
                      "${nutritionData?.totalProteinsForDay ?? 0}", "Protein"),
                  _buildNutrientCard(
                      "${nutritionData?.totalCarbsForDay ?? 0}", "Carbs"),
                  _buildNutrientCard(
                      "${nutritionData?.totalFatsForDay ?? 0}", "Fat"),
                  _buildNutrientCard(
                      "${nutritionData?.totalCaloriesToBurn ?? 0}", "Kcal"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DailyMealCardWidget(
                        imageUrl: Assets.avocadoToast,
                        title: "Breakfast",
                        subtitle: "Avocado Toast",
                        description: "High in Healthy Fats",
                        info: "Calories: 250 l Carbs: 20g l Protein: 6g",
                        destinationScreen: AvocadoToastDetailsScreen()),
                    DailyMealCardWidget(
                        imageUrl: Assets.avocadoToast,
                        title: "Breakfast",
                        subtitle: "Avocado Toast",
                        description: "High in Healthy Fats",
                        info: "Calories: 250 l Carbs: 20g l Protein: 6g",
                        destinationScreen: AvocadoToastDetailsScreen()),
                    DailyMealCardWidget(
                        imageUrl: Assets.avocadoToast,
                        title: "Breakfast",
                        subtitle: "Avocado Toast",
                        description: "High in Healthy Fats",
                        info: "Calories: 250 l Carbs: 20g l Protein: 6g",
                        destinationScreen: AvocadoToastDetailsScreen()),
                    DailyMealCardWidget(
                        imageUrl: Assets.avocadoToast,
                        title: "Breakfast",
                        subtitle: "Avocado Toast",
                        description: "High in Healthy Fats",
                        info: "Calories: 250 l Carbs: 20g l Protein: 6g",
                        destinationScreen: AvocadoToastDetailsScreen()),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButtonWidget(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.nutritionScreen4);
                    },
                    text: 'View Plan',
                    backgroundColor: AppColors.lightGreyColor,
                    textColor: AppColors.primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNutrientCard(String number, String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                height: 30.0,
                width: 30.0,
                child: Image.asset(
                  _getAssetForTitle(title),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: number,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: const [
                  TextSpan(
                    text: " G",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getAssetForTitle(String title) {
    switch (title) {
      case "Protein":
        return Assets.proteinMeal;
      case "Carbs":
        return Assets.carbMeal;
      case "Fat":
        return Assets.fatMeal;
      case "Kcal":
        return Assets.kcalMeal;
      default:
        return Assets.kcalMeal;
    }
  }
}

class DailyMealCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;
  final String info;
  final Widget destinationScreen;

  const DailyMealCardWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.info,
    required this.destinationScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 2.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationScreen),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Image.asset(
                imageUrl,
                width: 60.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    info,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                Assets.cardArrowIcon,
                width: 40,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
