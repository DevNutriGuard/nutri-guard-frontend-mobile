import 'package:flutter/cupertino.dart';

class GraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF4CAF50)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final points = [
      Offset(size.width * 0.07, size.height * 0.6),
      Offset(size.width * 0.22, size.height * 0.4),
      Offset(size.width * 0.36, size.height * 0.45),
      Offset(size.width * 0.5, size.height * 0.45),
      Offset(size.width * 0.65, size.height * 0.5),
      Offset(size.width * 0.79, size.height * 0.7),
      Offset(size.width * 0.93, size.height * 0.3),
    ];

    final path = Path()..moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, paint);

    // Draw dots at each point
    final dotPaint = Paint()
      ..color = Color(0xFF4CAF50)
      ..style = PaintingStyle.fill;

    for (var point in points) {
      canvas.drawCircle(point, 3, dotPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}