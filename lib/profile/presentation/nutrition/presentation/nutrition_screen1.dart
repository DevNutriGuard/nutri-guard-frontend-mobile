import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/calorie_nutrient_tracker_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/custom_diet_goals.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/daily_meal_suggestions_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/food_timing_suggestions.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/intake_trackers_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/personalized_nutrition_and_gut_health_supplements_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/smart_meal_scanner.dart';
import 'package:provider/provider.dart';
import '../domain/nutrition_provider.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';

class NutritionScreen1 extends StatefulWidget {
  const NutritionScreen1({super.key, required this.profileId});
  final String profileId;

  @override
  NutritionScreen1State createState() => NutritionScreen1State();
}

class NutritionScreen1State extends State<NutritionScreen1> {
  DateTime selectedDate = DateTime.now();

  void _updateDate(int days) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: days));
      final provider = Provider.of<NutritionProvider>(context, listen: false);
      provider.getNutritionPlan(
          profileId: widget.profileId, date: selectedDate.toIso8601String());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.profileScreen);
            },
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(
                Assets.profileImage,
              ),
            ),
          ),
        ),
        title: const Text(
          'Nutrition',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              Assets.foodCart,
              height: 24,
              width: 24,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.nutritionScreen3);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () => _updateDate(-1),
                        ),
                        Text(
                          selectedDate.day == DateTime.now().day
                              ? "Today"
                              : "${selectedDate.toLocal()}".split(' ')[0],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                          onPressed: () => _updateDate(1),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        minimumSize: const Size.fromHeight(40),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.aiCoachSelectionScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Assets.appLogoPng,
                                height: 25,
                                width: 25,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Chat with your AI health coach...",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                          Image.asset(
                            Assets.doubleStars,
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CalorieNutrientTrackerWidget(),
                  const DailyMealSuggestionsWidget(),
                  const SmartMealScanner(),
                  const IntakeTrackersWidget(),
                  const PersonalizedNutritionAndGutHealthSupplementsWidget(),
                  const FoodTimingSuggestions(),
                  const CustomDietGoals(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
