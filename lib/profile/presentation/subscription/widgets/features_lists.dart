import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final features = [
      "Seamless integration with wearable devices",
      "Blood test Integration",
      "Automatic Calorie Counting and Micro/Macronutrients Tracking using AI",
      "Hyper Personalized Scanning Features",
      "Hyper Personalized “ 7 “ AI Coaches",
      "Hyper Personalized health tracking",
      "Hyper Personalized AI-driven sleep quality insights",
      "Hyper Personalized Stress-relief exercises & cognitive health tracking",
      "Hyper Personalized Food & medication interaction monitoring",
      "Hyper Personalized Food & supplement interaction monitoring",
      "Hyper Personalized meal, supplement & medication timing suggestions",
      "Hyper Personalized AI-generated meal plans",
      "Hyper Personalized Al-generated grocery lists",
      "Hyper Personalized Advanced allergen detection & dietary compliance detection",
      "Hyper Personalized  Carcinogenic & harmful ingredients detection",
      "Hyper Personalized Al fitness plans with video-guided exercises",
      "Hyper Personalized Comprehensive health goals tracking",
      "Hyper Personalized AI-powered health reports",
      "Hyper Personalized Mental health insights & suggestions",
      "Hyper Personalized Biohacking tools, including fasting trackers & therapy",
      "Hyper Personalized Cognitive performance enhancements",
      "Hyper Personalized Comprehensive interaction reports",
      "Hyper Personalized supplement recommendations",
      "Water, Caffeine, Alcohol and Nicotine Intake Tracking",
    ];

    return Column(
      children: List.generate(
        features.length,
        (index) => ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
          leading: Icon(
            Icons.check,
            color: AppColors.primaryColor,
            size: 28,
          ),
          title: Text(
            features[index],
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
