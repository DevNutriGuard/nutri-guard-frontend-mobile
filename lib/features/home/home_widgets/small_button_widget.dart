import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class SmallButtonWidget extends StatelessWidget {
  final String svgIconPath;

  const SmallButtonWidget({
    super.key,
    required this.svgIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.smallButtonColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Opacity(
        opacity: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            svgIconPath,
            fit: BoxFit.contain,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
