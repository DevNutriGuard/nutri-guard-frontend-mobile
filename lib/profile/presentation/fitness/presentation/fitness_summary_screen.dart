import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../res/assets.dart';
import '../domain/fitness_provider.dart';

class FitnessSummaryScreen extends StatefulWidget {
  const FitnessSummaryScreen({super.key});

  @override
  FitnessSummaryScreenState createState() => FitnessSummaryScreenState();
}

class FitnessSummaryScreenState extends State<FitnessSummaryScreen> {
  @override
  void initState() {
    super.initState();
    final fitnessProvider = Provider.of<FitnessProvider>(context, listen: false);
    fitnessProvider.fetchFitnessSummary();
  }

  @override
  Widget build(BuildContext context) {
    final fitnessProvider = Provider.of<FitnessProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Summary',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 20,
                  right: 20,
                  top: 20,
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 100),
                    painter: MountainLinePainter(),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: Text(
                    'kcal ${fitnessProvider.fitnessSummary['calories'] ?? '0'}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: MediaQuery.of(context).size.width / 2.0,
                  child: Text(
                    'kcal ${fitnessProvider.fitnessSummary['calories'] ?? '0'}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: MediaQuery.of(context).size.width / 1.3,
                  child: Text(
                    'kcal ${fitnessProvider.fitnessSummary['calories'] ?? '0'}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  top: 170,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      Assets.fitnessSummaryImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 90.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Share your achievement with friends',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${fitnessProvider.fitnessSummary['caloriesBurnt'] ?? '0'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '+${fitnessProvider.fitnessSummary['percentageIncrease'] ?? '0'}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Calories Burnt this week',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class MountainLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final gradient = LinearGradient(
      colors: [Colors.grey.withOpacity(0.4), Colors.redAccent],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    paint.shader = gradient.createShader(Rect.fromLTRB(0, 0, size.width, 0));

    Path path = Path();

    path.moveTo(-8, size.height - 10);

    for (double x = 0; x < size.width; x++) {
      double y = size.height - 31 + -51 * (x / size.width) * (sin(x / 35));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height - 10);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
