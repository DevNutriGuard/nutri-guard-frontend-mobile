import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../domain/fitness_provider.dart';
import '../widgets/all_female_fitness_exercises_cards.dart';

class AllFemaleFitnessExercisesScreen extends StatefulWidget {
  const AllFemaleFitnessExercisesScreen({super.key});

  @override
  AllFemaleFitnessExercisesScreenState createState() =>
      AllFemaleFitnessExercisesScreenState();
}

class AllFemaleFitnessExercisesScreenState
    extends State<AllFemaleFitnessExercisesScreen> {
  DateTime selectedDate = DateTime.now();
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _letterKeys = {};

  void _scrollToLetter(String letter) {
    if (_letterKeys[letter]?.currentContext != null) {
      Scrollable.ensureVisible(
        _letterKeys[letter]!.currentContext!,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    final fitnessProvider = Provider.of<FitnessProvider>(context, listen: false);
    fitnessProvider.fetchFemaleFitnessExercises();
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
      body: Stack(
        children: [
          Column(
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
                  controller: _scrollController,
                  child: AllFemaleFitnessExercisesCards(
                    letterKeys: _letterKeys,
                    // exercises: fitnessProvider.femaleExercises,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 10,
            top: 100,
            child: Column(
              children: List.generate(26, (index) {
                String letter = String.fromCharCode(65 + index);
                return GestureDetector(
                  onTap: () => _scrollToLetter(letter),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      letter,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }),
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
              fitnessProvider.startWorkout(context, AppRoutes.bandPushUpsExerciseScreen);
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