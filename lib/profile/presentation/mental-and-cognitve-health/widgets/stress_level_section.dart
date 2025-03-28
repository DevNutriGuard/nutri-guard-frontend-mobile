// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

class StressLevelSection extends StatelessWidget {
  const StressLevelSection({super.key});

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
            'Stress Level',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Track your stress and take simple steps for a better mind and body.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '75',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Appropriate',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomPaint(
            size: const Size(double.infinity, 200),
            painter: ChartPainter(),
          ),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 2;

    final Paint dashedLinePaint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..strokeWidth = 1;

    final TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    canvas.drawLine(
      Offset(size.width * 0.1, 0),
      Offset(size.width * 0.1, size.height),
      linePaint,
    );

    List<int> numbers = [99, 79, 59, 29];
    double spacing = size.height / 4;

    for (int i = 0; i < numbers.length; i++) {
      TextSpan span = TextSpan(
        text: numbers[i].toString(),
        style: textStyle,
      );
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(
        canvas,
        Offset(size.width * 0.05 - tp.width, i * spacing + 10),
      );

      _drawDashedLine(canvas, size, i * spacing, size.width * 0.1);
    }

    // Draw bottom time labels (00:00, 04:00, 08:00, ...)
    List<String> times = [
      '00:00',
      '04:00',
      '08:00',
      '12:00',
      '16:00',
      '20:00',
      '24:00'
    ];
    double timeSpacing = (size.width - size.width * 0.1) / (times.length - 1);

    for (int i = 0; i < times.length; i++) {
      TextSpan span = TextSpan(
        text: times[i],
        style: textStyle,
      );
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(
        canvas,
        Offset(size.width * 0.1 + i * timeSpacing - tp.width / 2,
            size.height - 30),
      );
    }
  }

  void _drawDashedLine(
      Canvas canvas, Size size, double yPosition, double startX) {
    double dashWidth = 5.0;
    double dashSpace = 5.0;
    final Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..strokeWidth = 1;

    double startXPos = startX;
    while (startXPos < size.width) {
      canvas.drawLine(
        Offset(startXPos, yPosition),
        Offset(startXPos + dashWidth, yPosition),
        paint,
      );
      startXPos += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
