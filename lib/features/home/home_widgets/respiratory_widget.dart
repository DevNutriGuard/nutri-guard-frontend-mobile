import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class RespiratoryWidget extends StatefulWidget {
  const RespiratoryWidget({super.key});

  @override
  State<RespiratoryWidget> createState() => _RespiratoryWidgetState();
}

class _RespiratoryWidgetState extends State<RespiratoryWidget> with TickerProviderStateMixin {
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
    return SizedBox(
      width: 155, // Set fixed width
      height: 50,  // Set fixed height
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CustomPaint(
              painter: RespiratoryPainter(
                controller: _controller,
                borderRadius: 12.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              return Text(
                '${index + 1}${_getSuffix(index + 1)}',
                style: TextStyle(
                  fontSize: 8,
                  color: index == 3
                      ? const Color(0xFF2B4C7E)
                      : Colors.grey[600],
                  fontWeight: index == 3 ? FontWeight.bold : FontWeight.normal,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  String _getSuffix(int number) {
    if (number == 1) return 'st';
    if (number == 2) return 'nd';
    if (number == 3) return 'rd';
    return 'th';
  }
}

class RespiratoryPainter extends CustomPainter {
  final AnimationController controller;
  final double borderRadius;

  RespiratoryPainter({
    required this.controller,
    required this.borderRadius,
  }) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    // Create the ECG wave path
    path.moveTo(0, centerY);

    for (double x = 0; x < width; x++) {
      double progress = (x / width + controller.value) % 1.0;
      double y = centerY;

      // Modified wave pattern to match the screenshot
      if (progress > 0.35 && progress < 0.65) {
        if (progress < 0.45) {
          // First dip
          y = centerY + 5;
        } else if (progress < 0.5) {
          // Sharp rise
          y = centerY - 15;
        } else if (progress < 0.55) {
          // Sharp fall
          y = centerY + 10;
        } else {
          // Final small wave
          y = centerY - 5;
        }
      }

      path.lineTo(x, y);
    }

    // Draw highlight section for 4th position
    final Paint highlightPaint = Paint()
      ..color = AppColors.primaryColor.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final RRect highlightRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        width * 3/7,
        0,
        width/7,
        height - 15,
      ),
      Radius.circular(borderRadius),
    );

    // Draw subtle gradient background
    final Paint gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primaryColor.withOpacity(0.1),
          Colors.white.withOpacity(0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    // Draw base line with gradient
    canvas.drawRect(
      Rect.fromLTWH(0, centerY - 10, width, 20),
      gradientPaint,
    );

    canvas.drawRRect(highlightRect, highlightPaint);

    // Draw the main ECG line
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}