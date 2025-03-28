import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/button_widget.dart';
import 'package:nutri_guard_mobile/res/common_widgets.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_circle_button_widget.dart';
import '../../../res/assets.dart';

class Onboarding4 extends StatefulWidget {
  const Onboarding4({super.key});

  @override
  State<Onboarding4> createState() => _Onboarding4State();
}

class _Onboarding4State extends State<Onboarding4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: getHeight() * 0.08,
            ),
            Image.asset(Assets.onboarding4),
            SizedBox(
              height: getHeight() * 0.04,
            ),
            Image.asset(Assets.onboardingImage4),
            SizedBox(
              height: getHeight() * 0.02,
            ),
            CustomText(
              text: "Preferences for Plan \n     Customization",
              fontWeight: FontWeight.w500,
              fontSize: sizes?.fontSize24,
              alignment: Alignment.center,
              color: AppColors.blackTextColor,
              fontFamily: 'Inter Tight',
            ),
            SizedBox(
              height: getHeight() * 0.02,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Customizable plans that adapt to your goals. Connect with your doctor or coach for expert guidance and stay on top of your progress.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: sizes?.fontSize12,
                  color: AppColors.greyTextColor,

                ),
              ),
            ),
            // CustomText(
            //   text:
            //       "Customizable plans that adapt to your goals. Connect with your doctor or coach for expert guidance and stay on top of your progress.",
            //   fontWeight: FontWeight.w400,
            //   lines: 3,
            //   fontSize: sizes?.fontSize12,
            //   color: AppColors.greyTextColor,
            //   alignment: Alignment.center,
            //   textAlign: TextAlign.center,
            // ),
            SizedBox(
              height: getHeight() * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: CustomButtonWidget(
                      text: "Skip",
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.createAccountScreen);
                      }),
                ),
                CustomCircleButton(
                  svgIconPath: Assets.forwardIcon,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.createAccountScreen);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
