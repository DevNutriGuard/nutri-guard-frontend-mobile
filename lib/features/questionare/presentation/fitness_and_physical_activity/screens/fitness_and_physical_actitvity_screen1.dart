// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import '../../../../../res/assets.dart';
import '../../../../../core/routes/app_routes.dart';

class FitnessAndPhysicalActitvityScreen1 extends StatelessWidget {
  const FitnessAndPhysicalActitvityScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.dietNurtion8,
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.ilustrationImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    "Just a few more steps to personalize your plan!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We’re almost there! Answer the next few questions to unlock a fully customized experience tailored just for you.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      label: "Continue",
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.fitnessAndPhysicalActitvity2,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
