import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/domain/nutrition_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/intake_trackers_dialog.dart';
import 'package:provider/provider.dart';
import '../../../../../res/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntakeTrackersWidget extends StatefulWidget {
  const IntakeTrackersWidget({super.key});

  @override
  State<IntakeTrackersWidget> createState() => _IntakeTrackersWidgetState();
}

class _IntakeTrackersWidgetState extends State<IntakeTrackersWidget> {
  int waterValue = 0;
  int caffeineValue = 0;
  int nicotineValue = 0;
  int alcoholValue = 0;

  final int maxWater = 7;
  final int maxCaffeine = 100;
  final int maxNicotine = 100;
  final int maxAlcohol = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      width: double.infinity,
      height: 300.0,
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
                const Text(
                  "Intake Trackers",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.circlePlus,
                    width: 25.0,
                    height: 25.0,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const IntakeTrackersDialog(),
                    );
                  },
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCard(
                  title: "Water",
                  topColor: Colors.white,
                  bottomColor: const Color.fromARGB(255, 85, 155, 202),
                  boldText: "$waterValue",
                  text: "liters",
                  iconPath: Assets.water,
                  value: waterValue,
                  maxValue: maxWater,
                  onIncrement: () {
                    setState(() {
                      if (waterValue < maxWater) waterValue++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (waterValue > 0) waterValue--;
                    });
                  },
                ),
                _buildCard(
                  title: "Caffeine",
                  topColor: Colors.white,
                  bottomColor: Colors.brown,
                  boldText: "$caffeineValue",
                  text: "mg",
                  iconPath: Assets.caffeine,
                  value: caffeineValue,
                  maxValue: maxCaffeine,
                  onIncrement: () {
                    setState(() {
                      if (caffeineValue < maxCaffeine) caffeineValue++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (caffeineValue > 0) caffeineValue--;
                    });
                  },
                ),
                _buildCard(
                  title: "Nicotine",
                  topColor: Colors.white,
                  bottomColor: const Color.fromARGB(255, 51, 53, 54),
                  boldText: "$nicotineValue",
                  text: "mg",
                  iconPath: Assets.nicotine,
                  value: nicotineValue,
                  maxValue: maxNicotine,
                  onIncrement: () {
                    setState(() {
                      if (nicotineValue < maxNicotine) nicotineValue++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (nicotineValue > 0) nicotineValue--;
                    });
                  },
                ),
                _buildCard(
                  title: "Alcohol",
                  topColor: Colors.white,
                  bottomColor: const Color.fromARGB(255, 216, 126, 65),
                  boldText: "$alcoholValue",
                  text: "units",
                  iconPath: Assets.alcohol,
                  value: alcoholValue,
                  maxValue: maxAlcohol,
                  onIncrement: () {
                    setState(() {
                      if (alcoholValue < maxAlcohol) alcoholValue++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (alcoholValue > 0) alcoholValue--;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required Color topColor,
    required Color bottomColor,
    required String boldText,
    required String text,
    required String iconPath,
    required int value,
    required int maxValue,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    double fillHeight = (value / maxValue) * 200.0;

    Color textAndIconColor;
    if (title == "Water") {
      textAndIconColor = value < 1
          ? const Color.fromARGB(255, 155, 209, 216)
          : const Color.fromARGB(255, 155, 209, 216);
    } else {
      textAndIconColor = value < 32
          ? const Color.fromARGB(255, 155, 209, 216)
          : const Color.fromARGB(255, 155, 209, 216);
    }

    return Container(
      width: 80.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: topColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: fillHeight,
              decoration: BoxDecoration(
                color: bottomColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image.asset(
                  iconPath,
                  width: 50.0,
                  height: 50.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: textAndIconColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0.0,
                        right: 2.0,
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add),
                              color: textAndIconColor,
                              onPressed: onIncrement,
                            ),
                            const SizedBox(height: 4),
                            IconButton(
                              icon: const Icon(Icons.remove),
                              color: textAndIconColor,
                              onPressed: onDecrement,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 9.0,
                        left: 8.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              boldText,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: textAndIconColor,
                              ),
                            ),
                            Text(
                              text,
                              style: TextStyle(
                                color: textAndIconColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
