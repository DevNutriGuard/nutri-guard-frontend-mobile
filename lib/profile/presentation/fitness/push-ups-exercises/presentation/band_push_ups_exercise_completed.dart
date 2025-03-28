// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/push-ups-exercises/widgets/complete_progress_indicator.dart';
import 'package:nutri_guard_mobile/res/assets.dart';

class BandPushUpsExerciseCompleted extends StatefulWidget {
  const BandPushUpsExerciseCompleted({Key? key}) : super(key: key);

  @override
  _BandPushUpsExerciseCompletedState createState() =>
      _BandPushUpsExerciseCompletedState();
}

class _BandPushUpsExerciseCompletedState
    extends State<BandPushUpsExerciseCompleted> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.bandPushUpsExerciseScreen);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                Assets.completeCheck,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'DB Bench Row Completed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            CompleteProgressIndicator(currentStep: currentStep, totalSteps: 5),
            SizedBox(height: 50),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentStep++;
                      });
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.medicalBackground2Screen,
                      );
                    },
                    child: Text(
                      'Move to Next Exercise',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
