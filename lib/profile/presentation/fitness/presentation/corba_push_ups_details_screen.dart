// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/widgets/workout_details_widget.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';

class CorbaPushUpsDetailsScreen extends StatelessWidget {
  const CorbaPushUpsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Workout Details'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.fitnessPushUpsAllExercisesScreen,
            );
          },
        ),
      ),
      body: WorkoutDetailsWidget(
        imageUrl: Assets.corbaPushUps,
        boldText:
            'Master the DB Bench Row to build a stronger back and improve posture.',
        normalText: '3 sets x 8 reps x 11kg',
        onStartWorkout: () {
          Navigator.of(context).pushNamed(AppRoutes.bandPushUpsExerciseScreen);
        },
        cardsDetails: [
          {
            'title': 'Correct Form',
            'paragraphs': [
              'Keep your back straight and your core engaged throughout the movement.',
              'Pull the dumbbell towards your waist, keeping your elbow close to your body.',
              'Lower the dumbbell slowly for controlled movement.',
              'Avoid rounding your shoulders; focus on squeezing your shoulder blades together.',
            ],
          },
          {
            'title': 'Common Mistakes',
            'paragraphs': [
              'Using too much weight, which compromises form.',
              'Rounding your back or hunching your shoulders.',
              'Jerking the dumbbell instead of controlled lifting.',
              'Neglecting to engage your core muscles.',
              'Not aligning your elbow properly with your torso during the pull.',
            ],
          },
          {
            'title': 'Expert advice for maximizing results:',
            'paragraphs': [
              'Focus on a full range of motion for better muscle engagement.',
              'Use a mirror to monitor your form and make adjustments.',
              'Breathe out while pulling the dumbbell and breathe in while lowering it.',
              'Start with lighter weights and gradually increase as your strength improves.',
              'Combine DB Bench Row with other back exercises for a complete workout routine.'
            ],
          },
        ],
      ),
    );
  }
}
