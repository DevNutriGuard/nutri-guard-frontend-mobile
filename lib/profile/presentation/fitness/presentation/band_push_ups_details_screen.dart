import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../domain/fitness_provider.dart';
import '../widgets/workout_details_widget.dart';

class BandPushUpsDetailsScreen extends StatelessWidget {
  const BandPushUpsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fitnessProvider = Provider.of<FitnessProvider>(context);

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
        imageUrl: fitnessProvider.selectedExercise['imageUrl'],
        boldText: fitnessProvider.selectedExercise['boldText'],
        normalText: fitnessProvider.selectedExercise['normalText'],
        onStartWorkout: () {
          fitnessProvider.startWorkout(context, AppRoutes.bandPushUpsExerciseScreen);
        },
        cardsDetails: fitnessProvider.selectedExercise['cardsDetails'],
      ),
    );
  }
}