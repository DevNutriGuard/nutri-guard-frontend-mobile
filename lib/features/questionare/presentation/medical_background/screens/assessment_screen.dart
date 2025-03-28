// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import '../../../../../res/assets.dart';
import 'package:nutri_guard_mobile/core/widgets/assessment_card_widget.dart';
import '../../../../../core/routes/app_routes.dart';

class AssessmentScreen extends StatelessWidget {
  const AssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.onboardingWeightScreen,
                  );
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              SvgPicture.asset(
                Assets.appLogo,
                height: 40,
                width: 40,
              ),
              SizedBox(width: 24),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Personalized Wellness Plans in Just Simple Steps!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  String title = '';
                  String subtitle = '';
                  String route = '';

                  if (index == 0) {
                    title = 'Medical Background';
                    subtitle =
                        'Share your medical history for tailored guidance.';
                    route = AppRoutes.medicalBackground1Screen;
                  } else if (index == 1) {
                    title = 'Lifestyle and Daily Habits';
                    subtitle = 'Tell us your habits to create a fitting plan.';
                    route = AppRoutes.lifestyleScreen1;
                  } else if (index == 2) {
                    title = 'Diet and Nutrition Preferences';
                    subtitle = 'Set preferences to unlock personalized meals.';
                    route = AppRoutes.dietNurtion1;
                  } else if (index == 3) {
                    title = 'Fitness and Physical Activity';
                    subtitle = 'Track fitness for customized insights.';
                    route = AppRoutes.fitnessAndPhysicalActitvity1;
                  } else if (index == 4) {
                    title = 'Health and Biohacking Goals';
                    subtitle = 'Define goals to optimize your health.';
                    route = AppRoutes.healthAndBiohackingScreen1;
                  } else if (index == 5) {
                    title = 'Comprehensive Health Testing';
                    subtitle = 'Use health tests to refine your plan.';
                    route = AppRoutes.comprehensiveHealthTestingScreen1;
                  } else if (index == 6) {
                    title = 'Preferences for Plan Customization';
                    subtitle = 'Customize your plan with expert help.';
                    route = AppRoutes.preferencesForPlanCustomizationScreen1;
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, route);
                    },
                    child: AssessmentCard(
                      stepNumber: index + 1,
                      title: title,
                      subtitle: subtitle,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                label: "Let's Begin",
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.medicalBackground1Screen,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
