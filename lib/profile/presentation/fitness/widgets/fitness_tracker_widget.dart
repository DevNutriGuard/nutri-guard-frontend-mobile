// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';

class FitnessTrackerWidget extends StatelessWidget {
  const FitnessTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      width: double.infinity,
      height: 400.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fitness Tracker",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Your performance & achieve improvements",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 227, 238, 248),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    minimumSize: const Size(0, 40),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.fitnessLogsScreen);
                  },
                  child: const Text(
                    "View Logs",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("120",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text("100",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text("80",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text("60",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text("40",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildBar(80, [
                              const Color.fromARGB(255, 3, 76, 105),
                              const Color.fromARGB(255, 11, 104, 128),
                              const Color.fromARGB(255, 5, 135, 158),
                            ]),
                            _buildBar(100, [
                              const Color.fromARGB(255, 3, 76, 105),
                              const Color.fromARGB(255, 11, 104, 128),
                              const Color.fromARGB(255, 5, 135, 158),
                            ]),
                            _buildBar(60, [
                              const Color.fromARGB(255, 3, 76, 105),
                              const Color.fromARGB(255, 11, 104, 128),
                              const Color.fromARGB(255, 5, 135, 158),
                            ]),
                            _buildBar(120, [
                              const Color.fromARGB(255, 3, 76, 105),
                              const Color.fromARGB(255, 11, 104, 128),
                              const Color.fromARGB(255, 5, 135, 158),
                            ]),
                            _buildBar(90, [
                              const Color.fromARGB(255, 3, 76, 105),
                              const Color.fromARGB(255, 11, 104, 128),
                              const Color.fromARGB(255, 5, 135, 158),
                            ]),
                            _buildBar(70, [
                              const Color.fromARGB(255, 3, 76, 105),
                              const Color.fromARGB(255, 11, 104, 128),
                              const Color.fromARGB(255, 5, 135, 158),
                            ]),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Mon",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            Text("Tue",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            Text("Wed",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            Text("Thu",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            Text("Fri",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            Text("Sat",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard(
                  "25",
                  "Workout",
                  const Color.fromARGB(255, 3, 76, 105),
                ),
                _buildInfoCard(
                  "120 kg",
                  "Weight",
                  const Color.fromARGB(255, 11, 104, 128),
                ),
                _buildInfoCard(
                  "2 hrs",
                  "Time",
                  const Color.fromARGB(255, 5, 135, 158),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(double height, List<Color> colors) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 20,
          height: height * 0.33,
          color: colors[0],
        ),
        Container(
          width: 20,
          height: height * 0.33,
          color: colors[1],
        ),
        Container(
          width: 20,
          height: height * 0.34,
          color: colors[2],
        ),
      ],
    );
  }

  Widget _buildInfoCard(String value, String title, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "-",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
