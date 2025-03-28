import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/res/res.dart';

import '../../res/common_widgets.dart';

class CustomAssessmentWidget extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;

  const CustomAssessmentWidget({
    super.key,
    required this.number,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth() * 0.9,
      height: getHeight() * 0.12,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightBlueColor,
                ),
                child: Center(
                  child: CustomText(
                    text: number,
                    fontWeight: FontWeight.w600,
                    fontSize: sizes?.fontSize16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SvgPicture.asset(Assets.line)
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: sizes?.fontSize14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.silverTextColor,
                ),
                SizedBox(height: getHeight() * 0.01),
                CustomText(
                  text: subtitle,
                  fontSize: sizes?.fontSize12,
                  color: AppColors.greyTextColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
