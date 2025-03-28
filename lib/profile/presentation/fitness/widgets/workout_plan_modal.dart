import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class WorkoutPlanModal extends StatefulWidget {
  const WorkoutPlanModal({super.key});

  @override
  _WorkoutPlanModalState createState() => _WorkoutPlanModalState();
}

class _WorkoutPlanModalState extends State<WorkoutPlanModal> {
  String? selectedLocation;
  String? selectedGoal;
  String? selectedTime;
  String? selectedWorkoutStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(19.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Workout Plan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Location",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildOptionChip("Gym", selectedLocation),
                const SizedBox(width: 10),
                _buildOptionChip("Home", selectedLocation),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Fitness Goal",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 5,
              children: [
                _buildOptionChip("Weight Loss", selectedGoal),
                _buildOptionChip("Endurance", selectedGoal),
                _buildOptionChip("Muscle Building", selectedGoal),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Available Time",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildOptionChip("20 mins", selectedTime),
                _buildOptionChip("30 mins", selectedTime),
                _buildOptionChip("40 mins", selectedTime),
                _buildOptionChip("50 mins", selectedTime),
                _buildOptionChip("60 mins", selectedTime),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Preferred Workout Style",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildOptionChip("Pilates", selectedWorkoutStyle),
                _buildOptionChip("HIIT", selectedWorkoutStyle),
                _buildOptionChip("Calisthenics", selectedWorkoutStyle),
                _buildOptionChip("Cardio", selectedWorkoutStyle),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Health Considerations",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Center(
                child: Text(
                  "Generate Personalized Workout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionChip(String label, String? selectedValue) {
    return ChoiceChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: AppColors.whiteColor
        )
      ),
      label: Text(
        label,
        style: TextStyle(
          color: label == selectedValue ? Colors.white : Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      selected: label == selectedValue,
      onSelected: (bool selected) {
        setState(() {
          if (label == "Gym" || label == "Home") {
            selectedLocation = selected ? label : null;
          } else if (["Weight Loss", "Endurance", "Muscle Building"]
              .contains(label)) {
            selectedGoal = selected ? label : null;
          } else if (["20 mins", "30 mins", "40 mins", "50 mins", "60 mins"]
              .contains(label)) {
            selectedTime = selected ? label : null;
          } else if (["Pilates", "HIIT", "Calisthenics", "Cardio"]
              .contains(label)) {
            selectedWorkoutStyle = selected ? label : null;
          }
        });
      },
      selectedColor: AppColors.blueColor,
      backgroundColor: AppColors.greyShadeColor,
      elevation: 0,
    );
  }
}
