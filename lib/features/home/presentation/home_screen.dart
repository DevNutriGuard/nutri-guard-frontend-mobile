import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/features/home/domain/home_provider.dart';
import 'package:nutri_guard_mobile/features/home/presentation/wellness_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/fitness_screen1.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/presentation/nutrition_screen1.dart';
import 'package:nutri_guard_mobile/profile/presentation/report/presentation/report_screen1.dart';
import 'package:nutri_guard_mobile/res/res_export.dart';
import 'package:nutri_guard_mobile/res/utils.dart';

import '../home_widgets/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider homeProvider = HomeProvider();
  int _currentIndex = 0;

  final List<Widget> _screens = [
    WellnessScreen(profileId: PreferenceUtils.getString(Strings.profileId)??""),
    NutritionScreen1(
      profileId: PreferenceUtils.getString(Strings.profileId ) ?? ""
    ),
    const SizedBox(),
    const FitnessScreen1(),
    const ReportScreen1(),
  ];

  void onItemTapped(int index) {
    if (index == 2) {
      return;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
