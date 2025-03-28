import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_colors.dart';

class CustomCircleButton extends StatelessWidget {
  final String svgIconPath;
  final VoidCallback onPressed;

  const CustomCircleButton({
    super.key,
    required this.svgIconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50.0,
        height: 50.0,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: SvgPicture.asset(
            svgIconPath,
            width: 20.0,
            height: 20.0,
          ),
        ),
      ),
    );
  }
}