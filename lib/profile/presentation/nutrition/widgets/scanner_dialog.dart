import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/res/res.dart';

import '../../../../res/assets.dart';
import '../../../../res/common_widgets.dart';

class CustomScannerDialog extends StatelessWidget {
  const CustomScannerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: AppColors.dialogBg,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Meals
            GestureDetector(
              onTap: (){
                // Navigator.pushReplacementNamed(context, AppRoutes.scannerScreenNutrition);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.skyBlueColor,
                            borderRadius: BorderRadius.circular(
                                500),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                Assets.meals),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomText(
                          text: "Meals Scanning",
                          fontSize: sizes?.fontSize13,
                          fontWeight: FontWeight.w500,
                          alignment: Alignment.topLeft,
                          color: AppColors.blackTextColor,
                          fontFamily: "Inter Tight",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: sizes?.mediumPadding,),
            /// Food
            GestureDetector(
              onTap: (){},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.paleYellowColor,
                            borderRadius: BorderRadius.circular(
                                500),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                Assets.food),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomText(
                          text: " Food Product Scanning",
                          fontSize: sizes?.fontSize13,
                          fontWeight: FontWeight.w500,
                          alignment: Alignment.topLeft,
                          color: AppColors.blackTextColor,
                          fontFamily: "Inter Tight",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: sizes?.mediumPadding,),
            /// Medicine
            GestureDetector(
              onTap: (){},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(
                                500),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                Assets.medicine),
                          )
                      ),
                      SizedBox(width: getWidth() * 0.01,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomText(
                          text: "Medication Scanning",
                          fontSize: sizes?.fontSize13,
                          fontWeight: FontWeight.w500,
                          alignment: Alignment.topLeft,
                          color: AppColors.blackTextColor,
                          fontFamily: "Inter Tight",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: sizes?.mediumPadding,),
           /// Supplement
            GestureDetector(
              onTap: (){},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.lightPurpleColor,
                            borderRadius: BorderRadius.circular(
                                500),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                Assets.supplement),
                          )
                      ),
                      SizedBox(width: getWidth() * 0.01,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomText(
                          text: "Supplement Scanning",
                          fontSize: sizes?.fontSize13,
                          fontWeight: FontWeight.w500,
                          alignment: Alignment.topLeft,
                          color: AppColors.blackTextColor,
                          fontFamily: "Inter Tight",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
