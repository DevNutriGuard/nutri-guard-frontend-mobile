// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/widgets/daily_workout_schedule_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/widgets/find_out_your_fitness_level_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/widgets/fitness_tracker_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/widgets/personalized_fitness_supplements_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/widgets/supplement_timing_suggestions_widget.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class FitnessScreen1 extends StatefulWidget {
  const FitnessScreen1({super.key});

  @override
  FitnessScreen1State createState() => FitnessScreen1State();
}

class FitnessScreen1State extends State<FitnessScreen1> {
  DateTime selectedDate = DateTime.now();

  void _updateDate(int days) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: days));
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
          'Fitness',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              Assets.biceps,
              height: 24,
              width: 24,
            ),
            onPressed: () {
              Navigator.pushNamed(
                  context, AppRoutes.allMaleFitnessExercisesScreen);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () => _updateDate(-1),
                  ),
                  Text(
                    ' ${selectedDate.day == DateTime.now().day ? "Today" : "${selectedDate.toLocal()}".split(' ')[0]} ',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
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
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Chat with your AI health coach...",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Image.asset(
                      Assets.doubleStars,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const FitnessTrackerWidget(),
            const SizedBox(height: 10),
            const DailyWorkoutScheduleWidget(),
            const SizedBox(height: 10),
            const FindOutYourFitnessLevelWidget(),
            const SizedBox(height: 10),
            const PersonalizedFitnessSupplementsWidget(),
            const SizedBox(height: 10),
            const SupplementTimingSuggestionsWidget(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
