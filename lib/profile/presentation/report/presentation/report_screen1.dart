import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/profile/presentation/report/widgets/report_card_widget.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import 'package:provider/provider.dart';

import '../../../../res/utils.dart';
import '../domain/report_provider.dart';

class ReportScreen1 extends StatefulWidget {
  const ReportScreen1({super.key});

  @override
  State<ReportScreen1> createState() => _ReportScreen1State();
}

class _ReportScreen1State extends State<ReportScreen1> {
  final List<Map<String, dynamic>> _cardsData = [
    {
      "icon": Assets.generalOverview,
      "title": "General Overview",
      "selected": false
    },
    {
      "icon": Assets.bloodTestAnalysis,
      "title": "Blood Test Analysis",
      "selected": false
    },
    {"icon": Assets.wearableData, "title": "Wearable Data", "selected": false},
    {"icon": Assets.sleepSummary, "title": "Sleep Summary", "selected": false},
    {
      "icon": Assets.generalOverview,
      "title": "Interaction Analysis",
      "selected": false
    },
    {
      "icon": Assets.fitnessSummaryR,
      "title": "Fitness Summary",
      "selected": false
    },
    {
      "icon": Assets.medicationIntakeSummary,
      "title": "Medication Intake Summary",
      "selected": false
    },
    {
      "icon": Assets.supplementIntakeSummary,
      "title": "Supplement intake Summary",
      "selected": false
    },
    {
      "icon": Assets.nutritionSummary,
      "title": "Nutrition Summary",
      "selected": false
    },
    {
      "icon": Assets.generalOverview,
      "title": "Mental health Summary",
      "selected": false
    },
  ];

  bool get _isAnySelected => _cardsData.any((card) => card["selected"]);

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ReportProvider>(context, listen: false);
    provider.initContext(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReportProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.profileScreen);
            },
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(
                Assets.profileImage,
              ),
            ),
          ),
        ),
        title: const Text(
          'Reports',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              Assets.archive,
              height: 24,
              width: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.skyBlueColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: getHeight() * 0.02),
                      Text(
                        "What do you want to include in your report?",
                        style: TextStyle(
                          fontFamily: "Inter Tight",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 32,
                          width: sizes?.width,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Filter by Date",
                                  style: TextStyle(
                                    fontFamily: "Inter Tight",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                SvgPicture.asset(Assets.calendarRange),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ..._cardsData.asMap().entries.map((entry) {
                        final int index = entry.key;
                        final card = entry.value;
                        return ReportCardWidget(
                          icon: card["icon"],
                          title: card["title"],
                          isSelected: card["selected"],
                          onChanged: (bool? value) {
                            setState(() {
                              _cardsData[index]["selected"] = value ?? false;
                            });
                          },
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomWidgetButton(
              onPressed: _isAnySelected
                  ? () async {
                // Generate report when button is pressed
                List<String> selectedSections = _cardsData
                    .where((card) => card["selected"])
                    .map((card) => card["title"].replaceAll(" ", ""))
                    .cast<String>()
                    .toList();

                String? profileId = await PreferenceUtils.getProfileId();

                if (profileId != null && profileId.isNotEmpty) {
                  provider.generateReport(
                    profileId: profileId,
                    reportSections: selectedSections,
                  );
                } else {
                  print("Profile ID is not set.");
                  // Show a dialog or a snackbar to inform the user
                }
              }
                  : null,
              label: 'Generate Report',
            ),
          ),
        ],
      ),
    );
  }
}

class CustomWidgetButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const CustomWidgetButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: getWidth() * 0.9,
        height: getHeight() * 0.05,
        decoration: BoxDecoration(
          color: onPressed != null ? AppColors.primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}