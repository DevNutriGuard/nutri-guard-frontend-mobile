import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Gradient? gradient; // Add gradient parameter

  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor = const Color(0xFF1F4E6A),
    this.gradient, // Initialize gradient
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient, // Apply gradient to the container
        borderRadius: BorderRadius.circular(9.0), // Match button's border radius
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primarySecondColor, // Make button background transparent
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 15,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}