// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/res/res_export.dart';

class ScannerScreen2 extends StatefulWidget {
  const ScannerScreen2({super.key});

  @override
  ScannerScreen2State createState() => ScannerScreen2State();
}

class ScannerScreen2State extends State<ScannerScreen2> {
  DateTime selectedDate = DateTime.now();

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

  final List<Map<String, String>> scanneedData = [
    {'icon': Assets.circleCheck, 'title': '', 'value': "No Allergen Detected"},
    {
      'icon': Assets.nounWarning,
      'title': 'Soy',
      'value': "May be present in some bread replace regular  gluten-free."
    },
    {
      'icon': Assets.nounWarning,
      'title': 'Soy',
      'value': "May be present in some bread replace regular  gluten-free."
    },
    {
      'icon': Assets.nounWarningYellow,
      'title': 'Artificial Color',
      'value': "May cause issues for lactose intolerant "
    },
    {
      'icon': Assets.nounWarningRed,
      'title': 'Medication',
      'value': "May interact with Medication X."
    },
    {
      'icon': Assets.nounWarning,
      'title': 'Soy',
      'value': "May be present in some bread replace regular  gluten-free."
    },
  ];

  final List<Map<String, String>> certifications = [
    {
      'icon': Assets.circleCheck,
      'title': 'Certified',
      'value':
          "GMP-Certified, Informed Choice (Banned Substance Tested) FDA-Compliant Labeling:",
      'endIcon': Assets.certifiedBlue,
    },
    {
      'icon': Assets.circleX,
      'title': 'Not Certified',
      'value':
          "GMP-Certified, Informed Choice (Banned Substance Tested) FDA-Compliant Labeling:",
      'endIcon': Assets.certifiedRed,
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: double.infinity,
                padding: const EdgeInsets.all(8.0),
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
                      const SizedBox(height: 6),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(scanneedData.length, (index) {
                            if (index % 2 == 0) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildCard(scanneedData[index]),
                                    _buildCard(scanneedData[index + 1]),
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              List.generate(certifications.length, (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      certifications[index]['icon']!,
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            certifications[index]['title']!,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            certifications[index]['value']!,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Image.asset(
                                      certifications[index]['endIcon']!,
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
}

Widget _buildCard(Map<String, String> data) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  data['icon']!,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  data['title']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              data['value']!,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  );
}
