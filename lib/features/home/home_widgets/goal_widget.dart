import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoalWidget extends StatelessWidget {
  final String svgIconPath; // Path to SVG icon asset
  final String goalTitle;
  final String goalSubtitle;
  final List<double> progressValues; // Weekly progress percentages (0.0 to 1.0)

  const GoalWidget({
    super.key,
    required this.svgIconPath,
    required this.goalTitle,
    required this.goalSubtitle,
    required this.progressValues,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 193, // Fixed width
      height: 117, // Fixed height
      padding: const EdgeInsets.all(8), // Padding: 8px
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6), // Border radius: 6px 0px 0px 0px
        color: Colors.white.withOpacity(1), // Background color
        border: Border.all(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon on the left
              SvgPicture.asset(
                svgIconPath,
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8), // Gap between icon and text
              // Texts on the right
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    goalTitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    goalSubtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10), // Gap between sections
          // Weekly progress section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(progressValues.length, (index) {
              return Column(
                children: [
                  // Progress icon
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 16, // Smaller size for the progress indicator
                        height: 16,
                        child: CircularProgressIndicator(
                          value: progressValues[index],
                          strokeWidth: 2,
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                        ),
                      ),
                      // Dot in the center of progress
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 0), // Gap removed as per request
                  // Day label
                  Text(
                    _getDayLabel(index),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  // Helper function to get the day labels
  String _getDayLabel(int index) {
    const days = ['F', 'S', 'S', 'M', 'T', 'W', 'T'];
    return days[index % days.length];
  }
}
