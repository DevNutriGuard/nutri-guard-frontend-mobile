import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

import '../../../res/res.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  final double percentage;

  const CircularProgressIndicatorWidget({Key? key, required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: sizes!.height*0.24,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(150, 150),
            painter: CircularProgressPainter(percentage),
          ),
          Container(
            width: 57.85,
            height: 57.85,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              shape: BoxShape.circle,

            ),
            alignment: Alignment.center,
            child: Text(
              '${percentage.toInt()}%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double percentage;

  CircularProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = AppColors.skyBlueColor
      ..strokeWidth = 30
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = AppColors.primaryColor
      ..strokeWidth = 30
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;


    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double startAngle = pi;
    final double sweepAngle = pi;

    // Draw background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    // Draw progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle * (percentage / 100),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
