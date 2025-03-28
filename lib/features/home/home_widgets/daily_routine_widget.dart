import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/res.dart';

import '../../../res/common_widgets.dart';

class DailyRoutineWidget extends StatelessWidget {
  final String svgIconPath;
  final String number;
  final String text;

  const DailyRoutineWidget({
    super.key,
    required this.svgIconPath,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77,
      height: 112,
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6),
        border: const Border(
          top: BorderSide(width: 1, color: Colors.white),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SvgPicture.asset(
            svgIconPath,
          ),

          const SizedBox(height: 15),
          Text(
            number,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
          CustomText(
            text: text,
            fontSize: sizes?.fontSize12,
            color: AppColors.greyTextColor,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
