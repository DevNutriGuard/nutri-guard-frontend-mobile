import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/res/res.dart';

import '../../../core/constants/app_colors.dart';

class BarChartWidget extends StatelessWidget {
  final List<double> barHeights;
  final List<String> labels;
  final int selectedIndex;

  const BarChartWidget({
    super.key,
    required this.barHeights,
    required this.labels,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(barHeights.length, (index) {
        final isSelected = index == selectedIndex;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 22,
                height: barHeights[index],
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : AppColors.boxColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: sizes?.smallPadding),
            Text(
              labels[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
          ],
        );
      }),
    );
  }
}
