// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/res/res_export.dart';

class AvocadoToastDetailsScreen extends StatelessWidget {
  AvocadoToastDetailsScreen({super.key});

  final List<Map<String, String>> cardData = [
    {
      'icon': Assets.proteinMeal,
      'title': 'Protein',
      'value': '100 G',
    },
    {
      'icon': Assets.carbMeal,
      'title': 'Carbs',
      'value': '20 G',
    },
    {
      'icon': Assets.fatMeal,
      'title': 'Fat',
      'value': '30 G',
    },
    {
      'icon': Assets.proteinMeal,
      'title': 'Fiber',
      'value': '6 G',
    },
    {
      'icon': Assets.kcalMeal,
      'title': 'Kcal',
      'value': '380',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Breakfast',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.nutritionScreen1,
            );
          },
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Text(
                'Avocado Toast',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: double.infinity,
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
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
                                Assets.avocadoToast,
                                width: MediaQuery.of(context).size.width * 0.90,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(5, (index) {
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            cardData[index]['icon']!,
                                            width: 30,
                                            height: 30,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            cardData[index]['title']!,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              cardData[index]['value']!,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 243, 233, 219),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Vitamine',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          _buildBulletVitamineList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 226, 237, 247),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Minerals',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          _buildBulletMineralsList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                'Avocado Toast is a quick, nutritious breakfast option packed with healthy fats, vitamins, and fiber. It contains 320 kcal, with 10g protein, 18g fat, and 28g carbohydrates. Perfect for boosting energy, improving focus, and supporting overall.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
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
                            const Text(
                              'Benefits',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildBulletHealthBenefitsList(),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
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
                            const Text(
                              'Ingredients',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildBulletIngerdientsList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletVitamineList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('• Vitamin A 20g', style: TextStyle(fontSize: 12)),
        Text('• Vitamin C 30g', style: TextStyle(fontSize: 12)),
        Text('• Vitamin B6 & B12', style: TextStyle(fontSize: 12)),
        Text('• Folate 7g', style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildBulletMineralsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('• Potassium 4g', style: TextStyle(fontSize: 12)),
        Text('• Magnesium 2g', style: TextStyle(fontSize: 12)),
        Text('• Phosphorus 7g', style: TextStyle(fontSize: 12)),
        Text('• Iron 54g', style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildBulletHealthBenefitsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('• Rich in healthy fats to promote brain function and energy.',
            style: TextStyle(fontSize: 12)),
        Text('• High in fiber for improved digestion and gut health.',
            style: TextStyle(fontSize: 12)),
        Text(
            '• Contains vitamins like Vitamin E and potassium to support skin health and regulate blood pressure.',
            style: TextStyle(fontSize: 12)),
        Text('• A great source of antioxidants for reducing inflammation.',
            style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildBulletIngerdientsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('• 2 Slices of whole-grain bread', style: TextStyle(fontSize: 12)),
        Text('• 1 Ripe avocado', style: TextStyle(fontSize: 12)),
        Text('• 1 Tablespoon lemon juice', style: TextStyle(fontSize: 12)),
        Text('• A pinch of salt and pepper', style: TextStyle(fontSize: 12)),
        Text('• Optional toppings:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('◦ Cherry tomatoes (halved)',
                  style: TextStyle(fontSize: 12)),
              Text('◦ Red chili flakes or paprika',
                  style: TextStyle(fontSize: 12)),
              Text('◦ A sprinkle of sesame or chia seeds',
                  style: TextStyle(fontSize: 12)),
              Text('◦ Microgreens or arugula for garnish',
                  style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
