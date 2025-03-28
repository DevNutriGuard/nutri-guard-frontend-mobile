import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/models/long_term_health_response_model.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/widgets/horizonalScrollableCards.dart';

class RoutineAdjustments extends StatelessWidget {
  final List<LongTermHealthResponseModel>? routineAdjustments;

  const RoutineAdjustments({super.key, this.routineAdjustments});

  @override
  Widget build(BuildContext context) {
    if (routineAdjustments == null || routineAdjustments!.isEmpty) {
      return const Center(child: Text('No routine adjustments available.'));
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Routine Adjustments',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Suggestions to Improve Your Routine',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                HorizontalScrollableCards(
                  items: routineAdjustments!.map((adjustment) {
                    return CardItem(
                      icon: Icons.sports_gymnastics_rounded,
                      title: adjustment.data?.longTermHealth?.longTermHealthData?.routineAdjustments.toString() ?? 'No Title',
                      subtitle: adjustment.data?.longTermHealth?.longTermHealthData?.routineAdjustments.toString() ?? 'No Description',
                      onTap: () {},
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
