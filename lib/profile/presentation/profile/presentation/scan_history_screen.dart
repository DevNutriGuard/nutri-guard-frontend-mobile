import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/profile/presentation/scanner/presentation/scan_test_history_screen.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/profile/presentation/profile/widgets/profile_card_widget.dart';

class ScanHistoryScreen extends StatefulWidget {
  const ScanHistoryScreen({super.key});

  @override
  State<ScanHistoryScreen> createState() => _ScanHistoryScreenState();
}

class _ScanHistoryScreenState extends State<ScanHistoryScreen> {
  final List<Map<String, dynamic>> _cardsData = [
    {
      "icon": Assets.avocadoToast,
      "title": "Avocado Toast",
      "route": AppRoutes.scanHistoryScreen
    },
    {
      "icon": Assets.ibuprofen,
      "title": "Connect Device",
      "route": AppRoutes.aiCoachChatScreen
    },
    {
      "icon": Assets.optimumNutritionGold,
      "title": "Check Heart Rate",
      "route": AppRoutes.checkHeartRateScreen1
    },
    {
      "icon": Assets.avocadoToast,
      "title": "Avocado Toast",
      "route": AppRoutes.scanHistoryScreen
    },
    {
      "icon": Assets.ibuprofen,
      "title": "Connect Device",
      "route": AppRoutes.aiCoachChatScreen
    },
    {
      "icon": Assets.optimumNutritionGold,
      "title": "Check Heart Rate",
      "route": AppRoutes.checkHeartRateScreen1
    },
    {
      "icon": Assets.avocadoToast,
      "title": "Avocado Toast",
      "route": AppRoutes.scanHistoryScreen
    },
    {
      "icon": Assets.ibuprofen,
      "title": "Connect Device",
      "route": AppRoutes.aiCoachChatScreen
    },
    {
      "icon": Assets.optimumNutritionGold,
      "title": "Check Heart Rate",
      "route": AppRoutes.checkHeartRateScreen1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Scan History'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: _cardsData.map((card) {
                return ProfileCardWidget(
                  icon: card["icon"],
                  title: card["title"],
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ScanTestHistoryScreen()));
                    // Navigator.pushNamed(context, card["route"]);
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
