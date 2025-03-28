import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/button_widget.dart';
import 'package:nutri_guard_mobile/res/common_widgets.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_circle_button_widget.dart';
import '../../../res/assets.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
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
            Image.asset(Assets.onboarding2),
            SizedBox(
              height: getHeight() * 0.04,
            ),
            Image.asset(Assets.onboardingImage2),
            SizedBox(
              height: getHeight() * 0.02,
            ),
            CustomText(
              text: "Fitness and Physical \n            Activity",
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
                "Whether you're building strength, improving endurance, or staying active, we provide insights and tracking tools to support your journey",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: sizes?.fontSize12,
                  color: AppColors.greyTextColor,

                ),
              ),
            ),
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
                        context, AppRoutes.onboarding3Screen);
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
