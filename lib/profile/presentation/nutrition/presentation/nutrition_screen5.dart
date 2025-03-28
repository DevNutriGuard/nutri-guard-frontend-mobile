// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/add_meal_modal.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/edit_meal_modal.dart';
import 'package:nutri_guard_mobile/res/res_export.dart';

class NutritionScreen5 extends StatefulWidget {
  const NutritionScreen5({super.key});

  @override
  NutritionScreen5State createState() => NutritionScreen5State();
}

class NutritionScreen5State extends State<NutritionScreen5> {
  DateTime selectedDate = DateTime.now();

  final List<Map<String, String>> cardData = [
    {'icon': Assets.proteinMeal, 'title': 'Protein', 'value': '100 G'},
    {'icon': Assets.carbMeal, 'title': 'Carbs', 'value': '20 G'},
    {'icon': Assets.fatMeal, 'title': 'Fat', 'value': '30 G'},
    {'icon': Assets.kcalMeal, 'title': 'Kcal', 'value': '380'},
  ];

  List<Map<String, String>> addedMeals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Column(
            children: [
              const SizedBox(height: 16),
              const Text("Breakfast",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              const SizedBox(height: 4),
              const Text(
                "Russian Salad",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
            ],
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.97,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        Assets.salad,
                        width: double.infinity,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    cardData[index]['icon']!,
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(cardData[index]['title']!,
                                      style: const TextStyle(fontSize: 14)),
                                  const SizedBox(height: 8),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(cardData[index]['value']!,
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text("Edit Your Meal",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: addedMeals.length,
                  itemBuilder: (context, index) {
                    final meal = addedMeals[index];
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${meal['type']}: ${meal['name']}"),
                          IconButton(
                            icon: Image.asset(
                              Assets.edit,
                              width: 24,
                              height: 24,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => EditMealModal(
                                  meal: meal,
                                ),
                              ).then((result) {
                                if (result != null) {
                                  setState(() {
                                    addedMeals[index] = {
                                      'type': result['type'],
                                      'name': result['name'],
                                    };
                                  });
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddMealModal(),
                      ).then((result) {
                        if (result != null) {
                          setState(() {
                            addedMeals.add({
                              'type': result['type'],
                              'name': result['name'],
                            });
                          });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child:
                        const Text("Add Meal", style: TextStyle(fontSize: 16)),
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
