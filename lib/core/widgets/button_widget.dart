import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/common_widgets.dart';
import 'package:nutri_guard_mobile/res/res.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor; // Optional background color
  final Color? textColor; // Optional text color

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor, // Initialize background color
    this.textColor, // Initialize text color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 130,
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color.fromRGBO(239, 239, 239, 1), // Use provided background color or default
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CustomText(
            text: text,
            fontSize: sizes?.fontSize16,
            color: textColor ?? AppColors.primaryColor, // Use provided text color or default
          ),
        ),
      ),
    );
  }
}