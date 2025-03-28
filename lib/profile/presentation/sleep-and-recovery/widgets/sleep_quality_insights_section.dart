// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SleepQualityInsights extends StatelessWidget {
  const SleepQualityInsights({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sleep Quality Insights',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Track your sleep and take simple steps for a healthier mind and body.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.watch_later,
                  color: const Color.fromARGB(255, 7, 70, 95), size: 16),
              SizedBox(width: 8),
              Text(
                '11pm - 6am',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 4,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Deep Sleep',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 4,
                    color: Colors.lightBlue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Light Sleep',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomPaint(
            size: const Size(double.infinity, 200),
            painter: ChartPainter(),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    path.moveTo(size.width * 0.1, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.2,
      size.width * 0.5,
      size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.6,
      size.width * 0.9,
      size.height * 0.3,
    );
    canvas.drawPath(path, linePaint);

    List<String> times = [
      '11:00',
      '01:00',
      '03:00',
      '05:00',
      '06:00',
    ];
    double timeSpacing = size.width / (times.length - 1);
    for (int i = 0; i < times.length; i++) {
      final TextSpan span = TextSpan(
        text: times[i],
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      );
      final TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(
        canvas,
        Offset(i * timeSpacing - tp.width / 2, size.height + 10),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
