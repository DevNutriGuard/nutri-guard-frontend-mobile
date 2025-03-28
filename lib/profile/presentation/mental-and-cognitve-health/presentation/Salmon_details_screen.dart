// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/detailed_content_widget.dart';
import '../../../../../res/assets.dart';

class SalmonDetailsScreen extends StatelessWidget {
  const SalmonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: DetailedContentWidget(
          title: "Salmon Details",
          imageTitle: 'salmon image and details  ',
          imagePath: Assets.onboardingImage3,
          paragraph:
              'Salmon is rich in Omega-3 fatty acids, which play a vital role in improving cognitive function and promoting restful sleep. Incorporating salmon into your diet can enhance mental clarity, reduce stress, and support overall well-being. \t Studies have shown that Omega-3s in salmon not only benefit brain health but also aid in regulating sleep patterns. Getting sufficient sleep is critical for cognitive performance and emotional stability. ',
          card1Title: 'What the Science Says:',
          card1Paragraph:
              'Studies have shown that Omega-3s in salmon not only benefit brain health but also aid in regulating sleep patterns. Getting sufficient sleep is critical for cognitive performance and emotional stability.”',
        ),
      ),
    );
  }
}
