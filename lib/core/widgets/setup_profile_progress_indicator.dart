// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class SetupProfileProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const SetupProfileProgressIndicator({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: MediaQuery.of(context).size.width * 0.2,
          height: 6,
          color: index <= currentStep
              ? AppColors.primaryColor
              : AppColors.lightGrey,
        );
      }),
    );
  }
}
