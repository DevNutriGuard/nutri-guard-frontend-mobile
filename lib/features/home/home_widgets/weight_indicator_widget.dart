import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class WeightIndicatorWidget extends StatefulWidget {
  final double currentWeight;
  final Function(double) onWeightChanged;

  const WeightIndicatorWidget({
    super.key,
    required this.currentWeight,
    required this.onWeightChanged,
  });

  @override
  State<WeightIndicatorWidget> createState() => _WeightIndicatorWidgetState();
}

class _WeightIndicatorWidgetState extends State<WeightIndicatorWidget> {
  late double selectedWeight;

  @override
  void initState() {
    super.initState();
    selectedWeight = widget.currentWeight;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      selectedWeight += details.delta.dx * 0.1;
      selectedWeight = selectedWeight.clamp(50.0, 150.0);
      widget.onWeightChanged(selectedWeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      child: Container(
        width: 147,
        height: 43,
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(8),


        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              child: SizedBox(
                width: 147,
                height: 1,
                child: CustomPaint(
                  painter: DottedLinePainter(),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildWeightLabel(selectedWeight - 1),
                  _buildCurrentWeight(selectedWeight),
                  _buildWeightLabel(selectedWeight + 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightLabel(double weight) {
    return Text(
      weight.toStringAsFixed(0),
      style: const TextStyle(
        fontSize: 12,
        color: Color(0xFF6E7891),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildCurrentWeight(double weight) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF2B4C7E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        weight.toStringAsFixed(1),
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 4;
    const double dashSpace = 4;
    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 0),
        Offset(currentX + dashWidth, 0),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
