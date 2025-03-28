import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_colors.dart';
import '../../../res/assets.dart';
import '../../../res/common_widgets.dart';
import '../../../res/res.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const NotificationWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightBlueColor,
                    ),
                    child: Padding(padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(Assets.notificationIcon),)
                ),
                SizedBox(width: sizes?.mediumPadding),
                CustomText(
                  text: title,
                  fontFamily: 'Inter Tight',
                  fontSize: sizes?.fontSize12,
                  fontWeight: FontWeight.w500,
                  lines: 2,
                ),
                SizedBox(width:getWidth() * 0.17),
                CustomText(
                  text: time,
                  fontFamily: 'Inter Tight',
                  fontSize: sizes?.fontSize10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyTextColor,
                ),
              ],
            ),
            SizedBox(height: sizes?.mediumPadding,),
            CustomText(
              text: subtitle,
              fontFamily: 'Inter Tight',
              fontSize: sizes?.fontSize10,
              fontWeight: FontWeight.w500,
              color: AppColors.greyTextColor,
              alignment:Alignment.center,
              lines: 2,
            ),
          ],
        ),

      ),
    );
  }
}