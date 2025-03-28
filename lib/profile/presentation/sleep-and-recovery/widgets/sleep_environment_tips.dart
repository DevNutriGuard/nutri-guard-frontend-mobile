import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/domain/sleep_and_recovery_provider.dart';
import './horizonalScrollableCards.dart';

class SleepEnvironmentTips extends StatelessWidget {
  const SleepEnvironmentTips({super.key, required List<SleepAndRecoveryProvider> tips});
  @override
  Widget build(BuildContext context) {
    final items = [
      CardItem(
        icon: Icons.favorite,
        title: 'Healthy Heart',
        subtitle: 'Tips to maintain heart health.',
        onTap: () {},
      ),
      CardItem(
        icon: Icons.check,
        title: 'Brain Boost',
        subtitle: 'Enhance your cognitive abilities.',
        onTap: () {},
      ),
      CardItem(
        icon: Icons.self_improvement,
        title: 'Mindfulness',
        subtitle: 'Practice meditation and mindfulness.',
        onTap: () {},
      ),
    ];

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
                  'Sleep Environment Tips',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Improve your sleep quality with these simple, actionable tips.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                HorizontalScrollableCards(items: items),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
