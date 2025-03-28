import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/domain/nutrition_provider.dart';
import 'package:provider/provider.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';

class CalorieNutrientTrackerWidget extends StatelessWidget {
  const CalorieNutrientTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NutritionProvider>(context);
    final nutritionData =
        provider.getNutritionPlanResponseModel.data?.nutritionPlanData;

    final mealOptions = nutritionData?.mealPlans
            ?.expand((meal) => meal.mealOptions ?? [])
            .toList() ??
        [];

    String proteinValue = "0/0g";
    String carbsValue = "0/0g";
    String fatsValue = "0/0g";

    if (mealOptions.isNotEmpty) {
      proteinValue = "${mealOptions[0].proteins}/200g";
      carbsValue = "${mealOptions[0].carbs}/400g";
      fatsValue = "${mealOptions[0].fats}/600g";
    }

    return Container(
      margin: const EdgeInsets.all(14.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
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
                    "Calorie & Nutrient Tracker",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Track your calories and macronutrients.",
                    style: TextStyle(
                      fontSize: 14,
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
                  Navigator.pushNamed(context, AppRoutes.nutritionScreen6);
                },
                child: const Text(
                  "View Logs",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              width: 150,
              height: 150,
              child: CustomPaint(
                painter: NutrientGraphPainter(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Consumed:",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      RichText(
                        text: TextSpan(
                          text: nutritionData?.mealPlans?.first.mealOptions
                              ?.first.totalCalories
                              .toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: const [
                            TextSpan(
                              text: " kcal",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "/2500",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NutrientDetail(
                    title: "Protein",
                    value: proteinValue,
                    color: Colors.orange),
                const SizedBox(width: 8),
                NutrientDetail(
                    title: "Carbs", value: carbsValue, color: Colors.green),
                const SizedBox(width: 8),
                NutrientDetail(
                    title: "Fat", value: fatsValue, color: Colors.teal),
                const SizedBox(width: 8),
                NutrientDetail(
                    title: "Burned",
                    value:
                        "${nutritionData?.mealPlans?.first.recommendedCalories.toString() ?? 0}/900 kcal",
                    color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NutrientGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 20.0;
    final double gapSize = 20.0;
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final List<Color> segmentColors = [
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.teal,
    ];
    final List<double> segmentValues = [0.30, 0.20, 0.15, 0.35];

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startAngle = -90.0;

    for (int i = 0; i < segmentColors.length; i++) {
      final sweepAngle = 360 * segmentValues[i] - gapSize;
      paint.color = segmentColors[i];

      canvas.drawArc(
        rect,
        degreesToRadians(startAngle),
        degreesToRadians(sweepAngle),
        false,
        paint,
      );

      startAngle += sweepAngle + gapSize;
    }
  }

  double degreesToRadians(double degrees) {
    return degrees * (3.141592653589793 / 180.0);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class NutrientDetail extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const NutrientDetail({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    List<String> valueParts = value.split('/');
    String beforeSlash = valueParts[0];
    String afterSlash = valueParts.length > 1 ? valueParts[1] : '';

    return Expanded(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: beforeSlash,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: ' /$afterSlash',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 4,
            color: color,
          ),
        ],
      ),
    );
  }
}
