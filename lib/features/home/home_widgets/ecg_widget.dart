import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class ECGWidget extends StatefulWidget {
  const ECGWidget({super.key});

  @override
  State<ECGWidget> createState() => _ECGWidgetState();
}

class _ECGWidgetState extends State<ECGWidget> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 90,
          child: CustomPaint(
            painter: ECGPainter(
              _controller,
            ),
            child: Container(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(7, (index) {
            return Text(
              '${index + 1}${_getSuffix(index + 1)}',
              style: TextStyle(
                fontSize: 11,
                color: index == 3 ? Colors.red : Colors.grey,
                fontWeight: index == 3 ? FontWeight.bold : FontWeight.normal,
              ),
            );
          }),
        ),
      ],
    );
  }

  String _getSuffix(int number) {
    if (number == 1) return 'st';
    if (number == 2) return 'nd';
    if (number == 3) return 'rd';
    return 'th';
  }
}

class ECGPainter extends CustomPainter {
  final AnimationController controller;

  ECGPainter(this.controller) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    path.moveTo(0, centerY);

    for (double x = 0; x < width; x++) {
      double progress = (x / width + controller.value) % 1.0;
      double y = centerY;

      if (progress > 0.4 && progress < 0.6) {
        double wave = math.sin((progress - 0.4) * 10 * math.pi) * 20;
        y = centerY + wave;
      }

      path.lineTo(x, y);
    }

    // Draw highlight section for 4th position
    final Paint highlightPaint = Paint()
      ..color = AppColors.redColor
      ..style = PaintingStyle.fill;

    final highlightRect = Rect.fromLTWH(
      width * 3/7,
      0,
      width/7,
      height,
    );
    canvas.drawRect(highlightRect, highlightPaint);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}