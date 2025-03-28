import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/assets.dart';

class CustomChatFAB extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomChatFAB({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Handle tap action
      child: Container(
        width: 60, // Adjust size as needed
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primaryColor, // Dark blue color
          borderRadius: BorderRadius.circular(15), // Rounded square
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3), // Glow effect
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Chat icon
            SvgPicture.asset(Assets.messageSquare),
            // const Icon(
            //   Icons.chat_bubble_outline,
            //   color: Colors.white,
            //   size: 30, // Adjust size as needed
            // ),
            // Sparkles
            Positioned(
              top: 10,
              right: 10,
              child: Transform.rotate(
                angle: 0.8, // Slight rotation for visual effect
                child: const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 12, // Small sparkle
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Transform.rotate(
                angle: -0.5, // Slight rotation for visual effect
                child: const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 10, // Smaller sparkle
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}