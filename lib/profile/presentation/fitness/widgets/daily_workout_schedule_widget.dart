// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/widgets/button_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/fitness_push_ups_all_exercises_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/widgets/workout_plan_modal.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class DailyWorkoutScheduleWidget extends StatelessWidget {
  const DailyWorkoutScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16.0),
      width: double.infinity,
      height: 220.0,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Daily Workout Schedule",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  String imageUrl;
                  String time;
                  String title;
                  String description;
                  Widget destinationScreen;

                  switch (index) {
                    case 0:
                      imageUrl = Assets.fullShotManDoingPushups;
                      time = '5 mins';
                      title = 'Pushups Exercise';
                      description = '6 exercise';
                      destinationScreen =
                          const FitnessPushUpsAllExercisesScreen();
                      break;
                    case 1:
                      imageUrl = Assets.fullShotManDoingPushups;
                      time = '5 mins';
                      title = 'Squats Exercise';
                      description = '6 exercise';
                      destinationScreen =
                          const FitnessPushUpsAllExercisesScreen();
                      break;
                    case 2:
                      imageUrl = Assets.fullShotManDoingPushups;
                      time = '5 mins';
                      title = 'Plank Exercise';
                      description = '6 exercise';
                      destinationScreen =
                          const FitnessPushUpsAllExercisesScreen();
                      break;
                    default:
                      imageUrl = Assets.fullShotManDoingPushups;
                      time = '5 mins';
                      title = 'Plank Exercise';
                      description = '6 exercise';
                      destinationScreen =
                          const FitnessPushUpsAllExercisesScreen();
                      break;
                  }

                  return WorkoutCard(
                    imageUrl: imageUrl,
                    time: time,
                    title: title,
                    description: description,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => destinationScreen,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: CustomButtonWidget(
                    text: "Create Workout Plan",
                    backgroundColor: AppColors.lightBlueColor,
                    onPressed: (){
                      showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.vertical(top: Radius.circular(8.0)),
                                ),
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.80,
                                    child: const WorkoutPlanModal(),
                                  );
                                },
                              );

                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String imageUrl;
  final String time;
  final String title;
  final String description;
  final VoidCallback onTap;

  const WorkoutCard({
    Key? key,
    required this.imageUrl,
    required this.time,
    required this.title,
    required this.description,
    required this.onTap,
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
        onTap: onTap,
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
                    time,
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
