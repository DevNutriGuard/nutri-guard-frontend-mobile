import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
import 'package:nutri_guard_mobile/features/home/home_widgets/daily_routine_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/scanner/scanner_widgets/gluten_info_widget.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/res/common_widgets.dart';
import 'package:nutri_guard_mobile/res/res.dart';

class ScanTestHistoryScreen extends StatefulWidget {
  const ScanTestHistoryScreen({super.key});

  @override
  State<ScanTestHistoryScreen> createState() => _ScanTestHistoryScreenState();
}

class _ScanTestHistoryScreenState extends State<ScanTestHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
          onBackPressed: (){
            Navigator.pop(context);
          },
          title: "Avocado Test",
        backButtonColor: AppColors.greyShadeColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: sizes!.height * 2,
                width: sizes!.width,
                decoration: BoxDecoration(
                  color: AppColors.greyShadeColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: getHeight() * 0.53,
                        width: sizes!.width,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: getHeight() * 0.21,
                                width: sizes!.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(Assets.dishImage),

                                  ],
                                ),
                              ),
                              SizedBox(height: getHeight() * 0.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: DailyRoutineWidget(
                                      svgIconPath: Assets.heartRate,
                                      number: "0",
                                      text: 'Protein',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: DailyRoutineWidget(
                                      svgIconPath: Assets.heartRate,
                                      number: "0",
                                      text: 'Carbs',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: DailyRoutineWidget(
                                      svgIconPath: Assets.heartRate,
                                      number: "0",
                                      text: 'Fat',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: DailyRoutineWidget(
                                      svgIconPath: Assets.heartRate,
                                      number: "0",
                                      text: 'Kcal',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: getHeight() *0.05,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.skyBlueColor,
                                        borderRadius: BorderRadius.circular(12)
                                      ),
                                      width: getWidth() * 0.5,
                                      height: getHeight() * 0.1,
                                      child: Padding(
                                          padding: EdgeInsets.all(16),
                                        child: Text("Rich in Potassium (450mg) to support heart health."),
                                      ),
                                    ),
                                    SizedBox(width: getWidth() * 0.02,),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.green.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(12)
                                        ),
                                        width: getWidth() * 0.5,
                                        height: getHeight() * 0.1,
                                        child: Padding(
                                          padding: EdgeInsets.all(16),
                                          child: Text("Contains Vitamin E (10% RDA), which helps improve skin and immune function."),
                                        ),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight() * 0.01,),
                      Container(
                        width: sizes!.width,
                        height: getHeight() * 0.44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.whiteColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child:Column(
                            children: [
                              CustomText(
                                text: "Allergen Detection",
                                fontSize: sizes!.fontSize14,
                                fontWeight: FontWeight.w600,
                                alignment: Alignment.topLeft,
                              ),
                              SizedBox(height: getHeight() * 0.02,),
                              GlutenInfoWidget(
                                  title: "Gluten",
                                  subtitle: "Found in most bread unless you choose gluten-free options.",
                                  imagePath: Assets.dishImage
                              )
                            ],
                          )
                        ),

                      )


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
