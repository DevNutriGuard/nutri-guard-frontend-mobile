// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'ai_coach_card.dart';

class AICoachSelectionScreen extends StatefulWidget {
  const AICoachSelectionScreen({Key? key}) : super(key: key);

  @override
  State<AICoachSelectionScreen> createState() => _AICoachSelectionScreenState();
}

class _AICoachSelectionScreenState extends State<AICoachSelectionScreen> {
  List<Map<String, String>> filteredCoaches = aiCoaches;
  TextEditingController searchController = TextEditingController();

  void onSearch(String query) {
    setState(() {
      filteredCoaches = aiCoaches
          .where((coach) =>
              coach['name']!.toLowerCase().contains(query.toLowerCase()) ||
              coach['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'AI Health Coach',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: searchController,
                onChanged: onSearch,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Choose your AI Health Coach to receive personalized guidance for achieving your wellness goals.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCoaches.length,
                itemBuilder: (context, index) {
                  final coach = filteredCoaches[index];
                  return AICoachCard(
                    image: coach['image']!,
                    name: coach['name']!,
                    title: coach['title']!,
                    route: coach['route']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const aiCoaches = [
  {
    'image': Assets.nutritionAiCoach,
    'name': 'Adam Smith',
    'title': 'Nutrition Ai Coach',
    'route': '/nutritionCoach',
  },
  {
    'image': Assets.fitnessAiCoach,
    'name': 'Alex Warner',
    'title': 'Fitness Ai Coach',
    'route': '/fitnessCoach',
  },
  {
    'image': Assets.sleepAiCoach,
    'name': 'Agwa Wright',
    'title': 'Sleep Ai Coach',
    'route': '/mentalHealthCoach',
  },
  {
    'image': Assets.medicationAndSupplementManagementAiCoach,
    'name': 'Alex Warner',
    'title': 'Medication & Supplement Management Ai Coach',
    'route': '/sleepCoach',
  },
];
