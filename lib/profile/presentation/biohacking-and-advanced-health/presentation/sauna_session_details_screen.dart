// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/detailed_content_widget.dart';
import '../../../../../res/assets.dart';

class SaunaSessionDetailsScreen extends StatelessWidget {
  const SaunaSessionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: DetailedContentWidget(
          title: "Breathing Exercise Details",
          imageTitle: 'Guidance from the American Academy of Sleep Medicine',
          imagePath: Assets.onboardingImage3,
          paragraph:
              'Simple and effective breathing exercises can help reduce stress, improve focus, and promote better sleep. By calming your mind and body, these exercises are a powerful tool for maintaining emotional and physical well-being.',
          card1Title: 'What the Science Says:',
          card1Paragraph:
              'Research shows that practicing controlled breathing helps regulate the nervous system, lowering heart rate and reducing anxiety. Consistent practice can enhance mental clarity, improve sleep quality, and foster resilience in everyday life.”',
          card2Paragraph:
              'Research shows that practicing controlled breathing helps regulate the nervous system, lowering heart rate and reducing anxiety. Consistent practice can enhance mental clarity, improve sleep quality, and foster resilience in everyday life.”',
        ),
      ),
    );
  }
}
