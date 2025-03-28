// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
// import 'package:nutri_guard_mobile/features/home/domain/home_provider.dart';
// import 'package:nutri_guard_mobile/features/home/home_widgets/small_button_widget.dart';
// import 'package:nutri_guard_mobile/features/home/presentation/home_screens/readiness_widget/readiness_widget.dart';
// import 'package:nutri_guard_mobile/res/common_widgets.dart';
// import 'package:nutri_guard_mobile/res/res.dart';
//
// import '../../../../res/assets.dart';
//
// class Readiness extends StatefulWidget {
//   const Readiness({super.key});
//
//   @override
//   State<Readiness> createState() => _ReadinessState();
// }
//
// class _ReadinessState extends State<Readiness> {
//   HomeProvider homeProvider = HomeProvider();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: CustomAppBar(
//           onBackPressed: (){
//             Navigator.pop(context);
//           },
//         title: "Readiness",
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: sizes?.width,
//                 height: getHeight() * 0.25,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: AppColors.greyColor
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: sizes?.width,
//                         height: getHeight() * 0.15,
//                         decoration: BoxDecoration(
//                           color: AppColors.primaryColor,
//                           borderRadius: BorderRadius.circular(12)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: sizes?.width,
//                                 height: getHeight() * 0.06,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   color: AppColors.primaryColor,
//                                   border: Border.all(
//                                     color: AppColors.borderContainerColor
//                                   )
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     SingleChildScrollView(
//                                       scrollDirection: Axis.horizontal,
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 CustomText(
//                                                     text: "December",
//                                                   fontFamily: 'Inter Tight',
//                                                   fontSize: sizes?.fontSize18,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: AppColors.homeTextColor,
//                                                 ),
//                                             RichText(
//                                               text: TextSpan(
//                                                 text: 'Average Readiness:',
//                                                 style: TextStyle(
//                                                   fontSize: sizes?.fontSize12,
//                                                   color: AppColors.whiteColor,
//                                                   fontWeight: FontWeight.w500,
//                                                   fontFamily: 'Inter Tight'
//                                                 ),
//                                                 children: [
//                                                   TextSpan(
//                                                     text: ' 40',
//                                                     style: TextStyle(
//                                                         fontSize: sizes?.fontSize12,
//                                                         color: AppColors.whiteColor,
//                                                         fontWeight: FontWeight.w500,
//                                                         fontFamily: 'Inter Tight'
//                                                     ),
//                                                   ),
//                                                   TextSpan(
//                                                     text: '%',
//                                                     style: TextStyle(
//                                                         fontSize: sizes?.fontSize12,
//                                                         color: AppColors.whiteColor,
//                                                         fontWeight: FontWeight.w500,
//                                                         fontFamily: 'Inter Tight'
//                                                     ),
//                                                   ),
//
//                                                 ],
//                                               ),
//                                             )
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(width: getWidth() * 0.06,),
//                                           const SmallButtonWidget(
//                                             svgIconPath: Assets.backwardIcon,
//                                           ),
//                                           SizedBox(width: getWidth() * 0.004,),
//                                           const SmallButtonWidget(
//                                             svgIconPath: Assets.forwardIcon,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(height: getHeight() * 0.003,),
//                                     SizedBox(
//                                       height: 83,
//                                       child: SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child: Container(
//                                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                                           child: Row(
//                                             children: [
//                                               _buildDayCard("Sun", "01", false),
//                                               SizedBox(width: getWidth() * 0.004,),
//                                               _buildDayCard("Mon", "02", false),
//                                               SizedBox(width: getWidth() * 0.004,),
//                                               _buildDayCard("Tue", "03", true),
//                                               SizedBox(width: getWidth() * 0.004,),
//                                               _buildDayCard("Wed", "04", false),
//                                               SizedBox(width: getWidth() * 0.004,),
//                                               _buildDayCard("Thu", "05", false),
//                                               SizedBox(width: getWidth() * 0.004,),
//                                               _buildDayCard("Fri", "06", false),
//                                               SizedBox(width: getWidth() * 0.004,),
//                                               _buildDayCard("Sat", "07", false),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: getHeight() * 0.01,),
//                               SizedBox(
//                                 width: 308,
//                                 height: 179,
//                                 child: CustomPaint(
//                                   painter: GraphPainter(),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                                     children: [
//                                       _buildBarColumn("00:00", "32%"),
//                                       _buildBarColumn("04:00", "39%"),
//                                       _buildBarColumn("08:00", "41%"),
//                                       _buildBarColumn("12:00", "39%", isHighlighted: true),
//                                       _buildBarColumn("16:00", "33%"),
//                                       _buildBarColumn("20:00", "31%"),
//                                       _buildBarColumn("24:00", "10%"),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: getHeight() * 0.004,),
//                       Container(
//                         height: getHeight() * 0.085,
//                         width: sizes?.width,
//                         decoration: BoxDecoration(
//                           color: AppColors.whiteColor,
//                           borderRadius: BorderRadius.circular(12)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                       width: 42,
//                                       height: 42,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.yellowColor,
//                                         borderRadius: BorderRadius.circular(
//                                             500),
//                                       ),
//                                       child: SvgPicture.asset(
//                                           Assets.readiness)
//                                   ),
//                                   SizedBox(width: getWidth() * 0.01,),
//                                   CustomText(
//                                     text: "Readiness summary",
//                                     fontSize: sizes?.fontSize18,
//                                     fontWeight: FontWeight.w500,
//                                     alignment: Alignment.topLeft,
//                                     color: AppColors.blackTextColor,
//                                     fontFamily: "Inter Tight",
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: getHeight() * 0.004,),
//                               Container(
//                                 width: sizes?.width,
//                                 height: getHeight() * 0.05,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.greyColor,
//                                   borderRadius: BorderRadius.circular(12)
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Column(
//                                     children: [
//                                       CustomText(
//                                         text: "Readiness indicates your body's preparedness for physical and mental performance, taking into account factors such as recovery, stress levels, and overall energy balance.",
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: sizes?.fontSize12,
//                                         lines: 4,
//                                         fontFamily: 'Inter Tight',
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//
//                   ),
//                 )
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildDayCard(String dayName, String dayNumber, bool isSelected) {
//     return Container(
//       width: 65,
//       decoration: BoxDecoration(
//         color: isSelected ? const Color(0xFF2D4661) : const Color(0xFF1A2C3E),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             dayName,
//             style: TextStyle(
//               color: isSelected ? Colors.white : const Color(0xFF8195A7),
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: sizes?.mediumPadding),
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: isSelected ? const Color(0xFF3D5C85) : Colors.transparent,
//             ),
//             child: Center(
//               child: Text(
//                 dayNumber,
//                 style: TextStyle(
//                   color: isSelected ? Colors.white : const Color(0xFF8195A7),
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildBarColumn(String time, String percentage, {bool isHighlighted = false}) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: isHighlighted
//                   ? Colors.white
//                   : const Color(0xFF1A4179).withOpacity(0.8),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Text(
//               percentage,
//               style: TextStyle(
//                 color: isHighlighted ? const Color(0xFF1A4179) : Colors.white70,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 4),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF1A2C3E),
//                 borderRadius: BorderRadius.circular(8),
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     const Color(0xFF1A2C3E).withOpacity(0.3),
//                     const Color(0xFF1A2C3E),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             time,
//             style: const TextStyle(
//               color: Colors.white70,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
//

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
import 'package:nutri_guard_mobile/features/home/domain/home_provider.dart';
import 'package:nutri_guard_mobile/features/home/home_widgets/small_button_widget.dart';
import 'package:nutri_guard_mobile/features/home/presentation/home_screens/readiness_widget/readiness_widget.dart';
import 'package:nutri_guard_mobile/res/common_widgets.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import 'package:nutri_guard_mobile/res/res_export.dart';
import 'package:nutri_guard_mobile/res/utils.dart';
import '../../../../res/assets.dart';

class Readiness extends StatefulWidget {
  const Readiness({super.key});

  @override
  State<Readiness> createState() => _ReadinessState();
}

class _ReadinessState extends State<Readiness> {
  late HomeProvider homeProvider;
  String selectedDate = "2024-12-26";
  int selectedDayIndex = 2;

  @override
  void initState() {
    super.initState();
    homeProvider = HomeProvider();
    fetchReadinessData();
  }

  Future<void> fetchReadinessData() async {
    await homeProvider.fetchReadinessData(
      profileId: PreferenceUtils.getString(Strings.profileId)??"",
      startDate: selectedDate,
      endDate: selectedDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        onBackPressed: () {
          Navigator.pop(context);
        },
        title: "Readiness",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: sizes?.width,
                  height: getHeight() * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.greyColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children: [
                        Container(
                          width: sizes?.width,
                          height: getHeight() * 0.15,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _buildMonthHeader(),
                                SizedBox(height: getHeight() * 0.003),
                                _buildWeekView(),
                                SizedBox(height: getHeight() * 0.01),
                                _buildReadinessGraph(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: getHeight() * 0.004),
                        _buildReadinessSummary(),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthHeader() {
    return Container(
      width: sizes?.width,
      height: getHeight() * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor,
          border: Border.all(color: AppColors.borderContainerColor)
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "December",
                    fontFamily: 'Inter Tight',
                    fontSize: sizes?.fontSize18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.homeTextColor,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Average Readiness:',
                      style: TextStyle(
                          fontSize: sizes?.fontSize12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter Tight'
                      ),
                      children: [
                        TextSpan(
                          text: ' ${_calculateAverageReadiness()}%',
                          style: TextStyle(
                              fontSize: sizes?.fontSize12,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter Tight'
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: getWidth() * 0.06),
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      children: [
        GestureDetector(
          onTap: (){},
          child: const SmallButtonWidget(
            svgIconPath: Assets.backwardIcon,
          ),
        ),
        SizedBox(width: getWidth() * 0.004),
        GestureDetector(
          onTap: () {
          },
          child: const SmallButtonWidget(
            svgIconPath: Assets.forwardIcon,
          ),
        ),
      ],
    );
  }

  Widget _buildWeekView() {
    return SizedBox(
      height: 83,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildDayCard("Sun", "01", selectedDayIndex == 0),
              SizedBox(width: getWidth() * 0.004),
              _buildDayCard("Mon", "02", selectedDayIndex == 1),
              SizedBox(width: getWidth() * 0.004),
              _buildDayCard("Tue", "03", selectedDayIndex == 2),
              SizedBox(width: getWidth() * 0.004),
              _buildDayCard("Wed", "04", selectedDayIndex == 3),
              SizedBox(width: getWidth() * 0.004),
              _buildDayCard("Thu", "05", selectedDayIndex == 4),
              SizedBox(width: getWidth() * 0.004),
              _buildDayCard("Fri", "06", selectedDayIndex == 5),
              SizedBox(width: getWidth() * 0.004),
              _buildDayCard("Sat", "07", selectedDayIndex == 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayCard(String dayName, String dayNumber, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDayIndex = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
              .indexOf(dayName);
          // Update selectedDate based on the selected day
          fetchReadinessData();
        });
      },
      child: Container(
        width: 65,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2D4661) : const Color(0xFF1A2C3E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayName,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF8195A7),
                fontSize: 16,
              ),
            ),
            SizedBox(height: sizes?.mediumPadding),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? const Color(0xFF3D5C85) : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  dayNumber,
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF8195A7),
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadinessGraph() {
    return SizedBox(
      width: 308,
      height: 179,
      child: CustomPaint(
        painter: GraphPainter(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildBarColumn("00:00", "32%"),
            _buildBarColumn("04:00", "39%"),
            _buildBarColumn("08:00", "41%"),
            _buildBarColumn("12:00", "39%", isHighlighted: true),
            _buildBarColumn("16:00", "33%"),
            _buildBarColumn("20:00", "31%"),
            _buildBarColumn("24:00", "10%"),
          ],
        ),
      ),
    );
  }

  Widget _buildBarColumn(String time, String percentage, {bool isHighlighted = false}) {
    num? readinessValue;
    if (homeProvider.readinessData?.data?.readinessData != null) {
      switch (time) {
        case "00:00":
          readinessValue = homeProvider.readinessData?.data?.readinessData?.midnightTo4am;
          break;
        case "04:00":
          readinessValue = homeProvider.readinessData?.data?.readinessData?.fourAmTo8am;
          break;
        case "08:00":
          readinessValue = homeProvider.readinessData?.data?.readinessData?.eightAmTo12pm;
          break;
        case "12:00":
          readinessValue = homeProvider.readinessData?.data?.readinessData?.twelvePmTo4pm;
          break;
        case "16:00":
          readinessValue = homeProvider.readinessData?.data?.readinessData?.fourPmTo8pm;
          break;
        case "20:00":
          readinessValue = homeProvider.readinessData?.data?.readinessData?.eightPmToMidnight;
          break;
      }
    }

    String displayPercentage = "${readinessValue ?? 0}%";

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isHighlighted
                  ? Colors.white
                  : const Color(0xFF1A4179).withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              displayPercentage,
              style: TextStyle(
                color: isHighlighted ? const Color(0xFF1A4179) : Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF1A2C3E),
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF1A2C3E).withOpacity(0.3),
                    const Color(0xFF1A2C3E),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadinessSummary() {
    return Container(
      height: getHeight() * 0.085,
      width: sizes?.width,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.yellowColor,
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: SvgPicture.asset(Assets.readiness)
                ),
                SizedBox(width: getWidth() * 0.01),
                CustomText(
                  text: "Readiness summary",
                  fontSize: sizes?.fontSize18,
                  fontWeight: FontWeight.w500,
                  alignment: Alignment.topLeft,
                  color: AppColors.blackTextColor,
                  fontFamily: "Inter Tight",
                ),
              ],
            ),
            SizedBox(height: getHeight() * 0.004),
            Container(
              width: sizes?.width,
              height: getHeight() * 0.05,
              decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomText(
                      text: "Readiness indicates your body's preparedness for physical and mental performance, taking into account factors such as recovery, stress levels, and overall energy balance.",
                      fontWeight: FontWeight.w500,
                      fontSize: sizes?.fontSize12,
                      lines: 4,
                      fontFamily: 'Inter Tight',
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _calculateAverageReadiness() {
    if (homeProvider.readinessData?.data?.readinessData == null) {
      return "0";
    }

    final readinessData = homeProvider.readinessData!.data!.readinessData!;
    final values = [
      readinessData.midnightTo4am,
      readinessData.fourAmTo8am,
      readinessData.eightAmTo12pm,
      readinessData.twelvePmTo4pm,
      readinessData.fourPmTo8pm,
      readinessData.eightPmToMidnight,
    ].where((value) => value != null);

    if (values.isEmpty) return "0";

    final average = values.reduce((a, b) => a! + b!)! / values.length;
    return average.toStringAsFixed(0);
  }
}