import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../domain/fitness_provider.dart';
import '../widgets/push_ups_exercises.dart';

class FitnessPushUpsAllExercisesScreen extends StatefulWidget {
  const FitnessPushUpsAllExercisesScreen({super.key});

  @override
  FitnessPushUpsAllExercisesScreenState createState() =>
      FitnessPushUpsAllExercisesScreenState();
}

class FitnessPushUpsAllExercisesScreenState
    extends State<FitnessPushUpsAllExercisesScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Fetch push-ups exercises when the screen loads
    final fitnessProvider = Provider.of<FitnessProvider>(context, listen: false);
    fitnessProvider.fetchPushUpsExercises();
  }

  @override
  Widget build(BuildContext context) {
    final fitnessProvider = Provider.of<FitnessProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.fitnessScreen1);
          },
        ),
        title: const Text(
          'All Exercises',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: fitnessProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: PushUpsExercises(
                // exercises: fitnessProvider.pushUpsExercises,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(AppRoutes.bandPushUpsExerciseScreen);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
            child: const Text(
              "Start Workout",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}