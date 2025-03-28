import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class LinearProgressIndicatorWidget extends StatelessWidget {
  final int completedSections;

  const LinearProgressIndicatorWidget({super.key, required this.completedSections});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return Container(
            width: 47,
            height: 5,
            decoration: BoxDecoration(
              color: index < completedSections
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
              borderRadius: BorderRadius.circular(2.5),
            ),
          );
        }),
      ),
    );
  }
}
