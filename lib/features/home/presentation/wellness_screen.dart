import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/features/home/home_widgets/biohacking_widget.dart';
import 'package:nutri_guard_mobile/features/home/home_widgets/custom_chat_widget.dart';
import 'package:nutri_guard_mobile/features/home/home_widgets/custom_discover_widget.dart';
import 'package:nutri_guard_mobile/features/home/home_widgets/date_navigator_widget.dart';
import 'package:nutri_guard_mobile/features/home/home_widgets/ecg_widget.dart';
import 'package:nutri_guard_mobile/features/home/home_widgets/goal_widget.dart';
import 'package:nutri_guard_mobile/features/home/home_widgets/respiratory_widget.dart';
import 'package:nutri_guard_mobile/features/home/home_widgets/semi_circular_guage_widget.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/res/common_widgets.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import 'package:provider/provider.dart';
import '../domain/home_provider.dart';
import '../home_widgets/bar_chart_widget.dart';
import '../home_widgets/daily_routine_widget.dart';
import '../home_widgets/medication_card.dart';
import '../home_widgets/weight_indicator_widget.dart';

class WellnessScreen extends StatefulWidget {
  final String profileId;

  const WellnessScreen({super.key, required this.profileId});

  @override
  State<WellnessScreen> createState() => _WellnessScreenState();
}

class _WellnessScreenState extends State<WellnessScreen> {
  late String startDate;
  late String endDate;

  @override
  void initState() {
    super.initState();
    _setDates();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeProvider = Provider.of<HomeProvider>(context, listen: false);
      homeProvider.initContext(context);
      homeProvider.fetchHomeData(
        profileId: widget.profileId,
        startDate: startDate,
        endDate: endDate,
      );
    });
  }

  void _setDates() {
    final today = DateTime.now();
    final start = today.subtract(const Duration(days: 7));
    final formatter = DateFormat('yyyy-MM-dd');
    startDate = formatter.format(start);
    endDate = formatter.format(today);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton:
        Stack(
            children:[
          Positioned(
            bottom: 100,
              right: 20,
              child: CustomChatFAB())
            ]
        ),
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child:  Consumer<HomeProvider>(
                builder: (BuildContext context, homeProvider, child) {
                  if (homeProvider.homeDataResponse == null) {
                    return const Center(child: Text("No data available"));
                  }
                  final dailyStats = homeProvider.homeDataResponse?.data
                      ?.homeData?.dailyStats;
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 24,
                                  backgroundImage: AssetImage(
                                      Assets.profileImage),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'Hello,',
                                      fontSize: sizes?.fontSize12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    CustomText(
                                      text: 'Muhammad Akil',
                                      fontSize: sizes?.fontSize18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: SvgPicture.asset(Assets.alertIcon),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                      Assets.notificationIcon),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.notificationScreen);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getHeight() * 0.02,),
                      DateNavigator(),
                      SizedBox(height: getHeight() * 0.02,),
                      Container(
                        width: getWidth() * 0.9,
                        height: sizes!.height * 0.04,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(46)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: sizes!.width * 0.01,),
                              SvgPicture.asset(
                                Assets.appIcon, width: 16, height: 16,),
                              SizedBox(width: getWidth() * 0.02,),
                              CustomText(
                                text: "Chat with your Ai health coach...",
                                fontSize: sizes?.fontSize12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.botTextColor,
                              ),
                              SizedBox(width: getWidth() * 0.3,),
                              SvgPicture.asset(
                                Assets.starIcon, width: 16, height: 16,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight() * 0.02,),
                      Container(
                        width: getWidth() * 0.9,
                        height: getHeight() * 0.46,
                        decoration: BoxDecoration(
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              CustomText(
                                text: "Your daily progress",
                                fontWeight: FontWeight.w600,
                                fontSize: sizes?.fontSize18,
                                color: AppColors.blackTextColor,
                                alignment: Alignment.topLeft,
                                fontFamily: 'Inter Tight',
                              ),
                              SizedBox(height: getHeight() * 0.02,),
                              Container(
                                  height: getHeight() * 0.2,
                                  width: getWidth() * 0.9,
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 65.0),
                                    child: CircularProgressIndicatorWidget(
                                        percentage: 80),
                                  )
                              ),
                              SizedBox(height: getHeight() * 0.02,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                            context, AppRoutes.readinessScreen);
                                      },
                                      child: DailyRoutineWidget(
                                        svgIconPath: Assets.readiness,
                                        // number: '54',
                                        number: dailyStats?.readinessScore
                                            .toString() ?? "0",
                                        text: 'Readiness',
                                      ),
                                    ),
                                    SizedBox(width: getWidth() * 0.01,),
                                    GestureDetector(
                                      onTap: () {},
                                      child: DailyRoutineWidget(
                                        svgIconPath: Assets.sleep,
                                        number: dailyStats?.sleep.toString() ?? "0",
                                        text: 'Sleep',
                                      ),
                                    ),
                                    SizedBox(width: getWidth() * 0.01,),
                                    GestureDetector(
                                      onTap: () {},
                                      child: DailyRoutineWidget(
                                        svgIconPath: Assets.heartRate,
                                        number: dailyStats?.heartRate.toString() ?? "0",
                                        text: 'Heart Rate',
                                      ),
                                    ),
                                    SizedBox(width: getWidth() * 0.01,),
                                    GestureDetector(
                                      onTap: () {},
                                      child: DailyRoutineWidget(
                                        svgIconPath: Assets.steps,
                                        number: dailyStats?.steps.toString() ?? "0",
                                        text: 'Steps',
                                      ),
                                    ),
                                    SizedBox(width: getWidth() * 0.01,),
                                    GestureDetector(
                                      onTap: () {},
                                      child: DailyRoutineWidget(
                                        svgIconPath: Assets.calories,
                                        number: dailyStats?.calories.toString() ?? "0",
                                        text: 'Calories',
                                      ),
                                    ),
                                    SizedBox(width: getWidth() * 0.01,),
                                    GestureDetector(
                                      onTap: () {},
                                      child: DailyRoutineWidget(
                                        svgIconPath: Assets.stress,
                                        number: dailyStats?.stress.toString() ?? "0",
                                        text: 'Stress',
                                      ),
                                    ),
                                    SizedBox(width: getWidth() * 0.01,),
                                    GestureDetector(
                                      onTap: () {},
                                      child: DailyRoutineWidget(
                                        svgIconPath: Assets.hydration,
                                        number: dailyStats?.stress.toString() ?? "0",
                                        text: 'Hydration',
                                      ),
                                    ),
                                    SizedBox(width: getWidth() * 0.01,),
                                    GestureDetector(
                                      onTap: () {},
                                      child: DailyRoutineWidget(
                                        svgIconPath: Assets.weight,
                                        number: dailyStats?.weight.toString() ?? "0",
                                        text: 'Weight',
                                      ),
                                    ),
                                    SizedBox(width: getWidth() * 0.01,),
                                    GestureDetector(
                                      onTap: () {},
                                      child: DailyRoutineWidget(
                                        svgIconPath: Assets.spo2,
                                        number: dailyStats?.spO2.toString() ?? "0",
                                        text: 'SpO2',
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight() * 0.02,),
                      Container(
                        width: getWidth() * 0.9,
                        height: getHeight() * 0.41,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    const GoalWidget(
                                      svgIconPath: Assets.goal,
                                      goalTitle: "Your Goal",
                                      goalSubtitle: "Today",
                                      progressValues: [
                                        0.8,
                                        0.6,
                                        0.5,
                                        0.0,
                                        0.0,
                                        0.0,
                                        0.0
                                      ],
                                    ),
                                    Container(
                                      width: 126,
                                      height: 117,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    16.0),
                                                child: Container(
                                                  width: 42,
                                                  height: 42,
                                                  decoration: const BoxDecoration(
                                                    color: AppColors
                                                        .lightBlueBackgroundColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: SvgPicture.asset(
                                                        Assets
                                                            .longTermHealthIcon),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: (){Navigator.pushReplacementNamed(context, AppRoutes.longTermHealthScreen);},
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 16.0),
                                                  child: Container(
                                                    width: 24,
                                                    height: 24,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.boxColor,
                                                      borderRadius: BorderRadius
                                                          .circular(6),
                                                    ),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        Assets.forwardIcon,
                                                        color: AppColors
                                                            .blackTextColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: getHeight() * 0.02),
                                          CustomText(
                                            text: "Long Term Health",
                                            fontSize: sizes?.fontSize12,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackTextColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: getHeight() * 0.01),
                              Container(
                                width: 327,
                                height: 216,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 42,
                                      height: 42,
                                      decoration: const BoxDecoration(
                                        color: AppColors.badgeColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(Assets.awardIcon),
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [
                                          CustomText(
                                            text: "You hit your weekly target!",
                                            fontSize: sizes?.fontSize15,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackTextColor,
                                          ),
                                          const SizedBox(height: 4.0),
                                          CustomText(
                                            text: "Sep 3-9",
                                            fontSize: sizes?.fontSize12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.greyTextColor,
                                          ),
                                          const SizedBox(height: 8.0),
                                          Container(
                                            width: 287,
                                            height: 64,
                                            decoration: BoxDecoration(
                                                color: AppColors.greyColor,
                                                borderRadius: BorderRadius
                                                    .circular(8)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: CustomText(
                                                text: "Nice work, Akil! Scoring at least 150 Heart Points each week helps you stay fit and healthy.",
                                                fontSize: sizes?.fontSize12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.greyTextColor,
                                                lines: 3,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: getHeight() * 0.01,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              CustomText(
                                                text: "Total Score",
                                                fontSize: sizes?.fontSize14,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.blackTextColor,
                                              ),
                                              CustomText(
                                                text: "120 of 150",
                                                fontSize: sizes?.fontSize14,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.greyTextColor,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8.0),
                                          Container(
                                            width: double.infinity,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: AppColors.greyColor,
                                              borderRadius: BorderRadius.circular(
                                                  4),
                                            ),
                                            child: FractionallySizedBox(
                                              widthFactor: 120 / 150,
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      4),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight() * 0.02,),
                      Container(
                        height: getHeight() * 0.45,
                        width: getWidth() * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Upcoming Events",
                                    fontWeight: FontWeight.w500,
                                    fontSize: sizes?.fontSize18,
                                    color: AppColors.blackTextColor,
                                    fontFamily: "Inter Tight",
                                  ),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: const BoxDecoration(
                                        color: AppColors.whiteColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child:
                                      CustomText(
                                        text: "+",
                                        fontSize: sizes?.fontSize16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    MedicationCard(
                                      medicineName: 'Panadol',
                                      dosage: '500',
                                      frequency: '20',
                                      time: '5:06 Pm',
                                      onTap: () {},
                                    ),
                                    SizedBox(width: getWidth() * 0.02,),
                                    MedicationCard(
                                      medicineName: 'Panadol',
                                      dosage: '500',
                                      frequency: '20',
                                      time: '5:06 Pm',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: sizes?.mediumPadding,),
                      Container(
                        height: getHeight() * 0.34,
                        width: sizes?.width,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              CustomText(
                                text: "Biohacking Insights",
                                fontSize: sizes?.fontSize18,
                                fontWeight: FontWeight.w500,
                                alignment: Alignment.topLeft,
                                color: AppColors.blackTextColor,
                                fontFamily: "Inter Tight",
                              ),
                              SizedBox(height: sizes?.mediumPadding,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){Navigator.pushReplacementNamed(context, AppRoutes.biohackingAndAdvancedHealthScreen);},
                                      child: const BiohackingWidget(
                                          textLine1: "Biohacking & Advanced Health Optimization",
                                          imageAssetPath: Assets.biohackingImage1
                                      ),
                                    ),
                                    SizedBox(width: sizes?.mediumPadding,),
                                    GestureDetector(
                                      onTap: (){Navigator.pushReplacementNamed(context, AppRoutes.mentalAndCognitveHealthScreen1);},
                                      child: const BiohackingWidget(
                                          textLine1: "Mental & Cognitve Health Recommendations",
                                          imageAssetPath: Assets.biohackingImage2
                                      ),
                                    )
                                    , SizedBox(width: sizes?.mediumPadding,),
                                    GestureDetector(
                                      onTap: (){Navigator.pushReplacementNamed(context, AppRoutes.sleepAndRecoveryScreen);},
                                      child: const BiohackingWidget(
                                          textLine1: "Sleep & Recovery Recommendations",
                                          imageAssetPath: Assets.biohackingImage3
                                      ),
                                    ),
                                    SizedBox(width: sizes?.mediumPadding,),
                                    GestureDetector(
                                      onTap: (){Navigator.pushReplacementNamed(context, AppRoutes.medicationAndSupplementScreen);},
                                      child: const BiohackingWidget(
                                          textLine1: "Medication & Supplement Interaction Monitoring",
                                          imageAssetPath: Assets.biohackingImage4
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: sizes?.mediumPadding,),
                      Container(
                        height: getHeight() * 0.81,
                        width: sizes?.width,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              CustomText(
                                text: "Trends",
                                fontSize: sizes?.fontSize18,
                                fontWeight: FontWeight.w500,
                                alignment: Alignment.topLeft,
                                color: AppColors.blackTextColor,
                                fontFamily: "Inter Tight",
                              ),
                              SizedBox(height: sizes?.smallPadding,),
                              Container(
                                height: getHeight() * 0.23,
                                width: sizes?.width,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              width: 44,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    500),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    12),
                                                child: SvgPicture.asset(
                                                    Assets.sleepIcon),
                                              )
                                          ),
                                          SizedBox(
                                            width: sizes?.mediumPadding,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              CustomText(
                                                text: "Sleep Duration",
                                                fontSize: sizes?.fontSize18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Inter Tight',
                                                color: AppColors.blackTextColor,
                                              ),
                                              CustomText(
                                                text: "Last 7 days",
                                                fontSize: sizes?.fontSize13,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Inter Tight',
                                                color: AppColors.greyTextColor,
                                                alignment: Alignment.topLeft,
                                              ),

                                            ],
                                          ),
                                          SizedBox(width: getWidth() * 0.18),
                                          Container(
                                            height: 44,
                                            width: 44,
                                            decoration: BoxDecoration(
                                                color: AppColors.boxColor,
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    16)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: SvgPicture.asset(
                                                Assets.forwardIcon,
                                                color: AppColors
                                                    .blackTextColor,),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: sizes?.mediumPadding,),
                                      Row(
                                        children: List.generate(
                                            150 ~/ 3, (index) =>
                                            Expanded(
                                              child: Container(
                                                color: index % 2 == 0 ? Colors
                                                    .transparent
                                                    : AppColors.borderColor,
                                                height: 1,
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: sizes?.mediumPadding,),
                                      Row(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: AppColors.boxColor,
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  500),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: SvgPicture.asset(
                                                  Assets.timerIcon),
                                            ),
                                          ),
                                          SizedBox(
                                            width: sizes?.mediumPadding,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              CustomText(
                                                text: "9h 3m",
                                                fontSize: sizes?.fontSize18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Inter Tight',
                                                color: AppColors.blackTextColor,
                                              ),
                                              CustomText(
                                                text: "Average",
                                                fontSize: sizes?.fontSize13,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Inter Tight',
                                                color: AppColors.greyTextColor,
                                                alignment: Alignment.topLeft,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: sizes?.largerPadding,),
                                          const BarChartWidget(
                                            barHeights: [
                                              40,
                                              70,
                                              30,
                                              40,
                                              50,
                                              60,
                                              60
                                            ],
                                            labels: [
                                              'F',
                                              'S',
                                              'S',
                                              'M',
                                              'T',
                                              'W',
                                              'T'
                                            ],
                                            selectedIndex: 1,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: sizes?.mediumPadding,),
                              Container(
                                height: getHeight() * 0.3,
                                width: sizes?.width,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Container(
                                          height: getHeight() * 0.1,
                                          width: sizes?.width,
                                          decoration: BoxDecoration(
                                              color: AppColors.greyColor,
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  12)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 42,
                                                      height: 42,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .whiteColor,
                                                        borderRadius: BorderRadius
                                                            .circular(500),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .all(12),
                                                        child: SvgPicture.asset(
                                                            Assets
                                                                .cardiologyIcon),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: sizes
                                                          ?.mediumPadding,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        CustomText(
                                                          text: "Heart Points",
                                                          fontSize: sizes
                                                              ?.fontSize15,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          fontFamily: 'Inter Tight',
                                                          color: AppColors
                                                              .blackTextColor,
                                                        ),
                                                        CustomText(
                                                          text: "Last 7 days",
                                                          fontSize: sizes
                                                              ?.fontSize13,
                                                          fontWeight: FontWeight
                                                              .w400,
                                                          fontFamily: 'Inter Tight',
                                                          color: AppColors
                                                              .greyTextColor,
                                                          alignment: Alignment
                                                              .topLeft,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: sizes?.largePadding,),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 42,
                                                      height: 42,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .whiteColor,
                                                        borderRadius: BorderRadius
                                                            .circular(500),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .all(12),
                                                        child: SvgPicture.asset(
                                                          Assets.timerIcon,
                                                          color: AppColors
                                                              .redColor,),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: sizes
                                                          ?.mediumPadding,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        CustomText(
                                                          text: "66 pts",
                                                          fontSize: sizes
                                                              ?.fontSize15,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          fontFamily: 'Inter Tight',
                                                          color: AppColors
                                                              .blackTextColor,
                                                        ),
                                                        CustomText(
                                                          text: "BPM",
                                                          fontSize: sizes
                                                              ?.fontSize13,
                                                          fontWeight: FontWeight
                                                              .w400,
                                                          fontFamily: 'Inter Tight',
                                                          color: AppColors
                                                              .greyTextColor,
                                                          alignment: Alignment
                                                              .topLeft,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                      ),
                                      SizedBox(height: sizes?.mediumPadding,),
                                      const ECGWidget()
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: sizes?.mediumPadding,),

                              Row(
                                children: [
                                  Container(
                                    width: 167,
                                    height: 132,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 148,
                                            height: 52,
                                            decoration: BoxDecoration(
                                                color: AppColors.greyColor,
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    8)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 38,
                                                    height: 38,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .primaryColor,
                                                        borderRadius: BorderRadius
                                                            .circular(500)
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .all(
                                                          12.0),
                                                      child: SvgPicture.asset(
                                                          Assets
                                                              .respiratoryIcon),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: sizes
                                                        ?.smallPadding,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      CustomText(
                                                        text: "Respiratory rate",
                                                        fontFamily: 'Inter Tight',
                                                        fontSize: sizes
                                                            ?.fontSize12,
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        color: AppColors
                                                            .greyTextColor,
                                                      ),
                                                      CustomText(
                                                        text: "14rpm",
                                                        fontFamily: 'Inter Tight',
                                                        fontSize: sizes
                                                            ?.fontSize13,
                                                        fontWeight: FontWeight
                                                            .w500,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: sizes?.smallPadding,),
                                          const RespiratoryWidget()
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: sizes?.smallPadding,),

                                  Container(
                                    width: 150,
                                    height: 132,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 148,
                                            height: 52,
                                            decoration: BoxDecoration(
                                              color: AppColors.greyColor,
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  8),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 38,
                                                    height: 38,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .whiteColor,
                                                        borderRadius: BorderRadius
                                                            .circular(500)
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .all(
                                                          12.0),
                                                      child: SvgPicture.asset(
                                                          Assets.bodyIcon),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: sizes
                                                        ?.smallPadding,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      CustomText(
                                                        text: "Weight",
                                                        fontFamily: 'Inter Tight',
                                                        fontSize: sizes
                                                            ?.fontSize12,
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        color: AppColors
                                                            .greyTextColor,
                                                      ),
                                                      CustomText(
                                                        text: "75 kg",
                                                        fontFamily: 'Inter Tight',
                                                        fontSize: sizes
                                                            ?.fontSize13,
                                                        fontWeight: FontWeight
                                                            .w500,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: sizes?.mediumPadding,),

                                          WeightIndicatorWidget(
                                            currentWeight: 75.6,
                                            onWeightChanged: (newWeight) {
                                              debugPrint(
                                                  "Selected Weight: $newWeight");
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: sizes?.mediumPadding,),
                      Container(
                          width: sizes?.width,
                          height: getHeight() * 0.3,
                          decoration: BoxDecoration(
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                CustomText(
                                  text: "Discover",
                                  fontSize: sizes?.fontSize18,
                                  fontFamily: 'Inter Tight',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackTextColor,
                                  alignment: Alignment.topLeft,
                                ),
                                SizedBox(height: sizes?.mediumPadding,),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      const CustomDiscoverWidget(
                                          svgIconPath: Assets.wearableIcon,
                                          iconBackgroundColor: AppColors
                                              .primaryColor,
                                          title: "Your Wearable Data in \n NutriGuard.ai",
                                          subtitle: "Connect your wearable device \n to monitor and optimize your health \n seamlessly with NutriGuard.ai.",
                                          actionText: "Learn More"
                                      ),
                                      SizedBox(width: sizes?.mediumPadding,),
                                      const CustomDiscoverWidget(
                                          svgIconPath: Assets.wearableIcon,
                                          iconBackgroundColor: AppColors
                                              .primaryColor,
                                          title: "Your Wearable Data in \n NutriGuard.ai",
                                          subtitle: "Connect your wearable device \n to monitor and optimize your health \n seamlessly with NutriGuard.ai.",
                                          actionText: "Learn More"
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  );
                }
                ),

            ),
        ),
      ),
    // ),
    );
  }
}
