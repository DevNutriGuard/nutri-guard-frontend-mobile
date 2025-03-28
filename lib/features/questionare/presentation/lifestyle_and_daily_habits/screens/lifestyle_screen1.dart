// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import '../../../../../res/assets.dart';
import '../../../../../core/routes/app_routes.dart';

class LifestyleScreen1 extends StatelessWidget {
  const LifestyleScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 236, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 224, 236, 247),
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.medicalBackground6Screen,
                )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  Assets.doubleQuotationImage,
                  height: 130,
                  width: 130,
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\"Every step you take toward understanding your body brings you closer to a healthier, happier you. Your journey matters, and NutriGuard.ai is here to guide you every step of the way.\"",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "The NutriGuard.ai Team",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                label: "Continue",
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.lifestyleScreen2,
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
