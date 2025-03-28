import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/res/common_widgets.dart';

import '../../../core/constants/app_colors.dart';
import '../../../res/assets.dart';
import '../../../res/res.dart';

class CustomDiscoverWidget extends StatelessWidget {
  final String svgIconPath;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final String actionText;

  const CustomDiscoverWidget({
    super.key,
    required this.svgIconPath,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
   return Container(
     width: 262,
     height: 168,
     decoration: BoxDecoration(
       color: AppColors.primaryColor,
       borderRadius: BorderRadius.circular(12),
     ),
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 width: 39,
                 height: 39,
                 decoration: BoxDecoration(
                   color: AppColors.primaryColor,
                   borderRadius: BorderRadius.circular(500)
                 ),
                 child: Padding(
                     padding: const EdgeInsets.all(12),
                     child: SvgPicture.asset(svgIconPath),
                 )
               ),
               SizedBox(width: sizes?.mediumPadding,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomText(
                     text: title,
                     fontWeight: FontWeight.w500,
                     fontSize: sizes?.fontSize15,
                     fontFamily: 'Inter Tight',
                     color: AppColors.whiteColor,
                     alignment: Alignment.topLeft,
                     lines: 2,
                   ),
                   SizedBox(height: sizes?.mediumPadding,),
                   CustomText(
                     text: subtitle,
                     fontWeight: FontWeight.w400,
                     fontSize: sizes?.fontSize10,
                     fontFamily: 'Inter Tight',
                     color: AppColors.whiteColor,
                     alignment: Alignment.topLeft,
                     lines: 3,
                   )
                 ],
               )
             ],
           ),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Row(
               children: [
                 CustomText(
                   text: actionText,
                   fontWeight: FontWeight.w500,
                   fontSize: sizes?.fontSize15,
                   fontFamily: 'Inter Tight',
                   color: AppColors.whiteColor,
                   alignment: Alignment.topLeft,
                 ),
                 SizedBox(width: sizes?.mediumPadding,),
                 SvgPicture.asset(Assets.forwardIcon),
               ],
             ),
           )
         ],
       ),
     ),
   );
  }
}
