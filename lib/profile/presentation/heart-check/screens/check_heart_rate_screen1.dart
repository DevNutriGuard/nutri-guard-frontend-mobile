// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, prefer_const_declarations

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:nutri_guard_mobile/profile/presentation/heart-check/widgets/flash_light_switch.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';

class CheckHeartRateScreen1 extends StatefulWidget {
  const CheckHeartRateScreen1({super.key});

  @override
  _CheckHeartRateScreen1State createState() => _CheckHeartRateScreen1State();
}

class _CheckHeartRateScreen1State extends State<CheckHeartRateScreen1>
    with SingleTickerProviderStateMixin {
  bool isSwitchOn = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.addListener(() {
      setState(() {});
      if (_controller.value == 1.0) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushNamed(context, AppRoutes.checkHeartRateScreen2);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_controller.isAnimating) {
      _controller.reset();
      _controller.forward();
    }
  }

  void _stopAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double responsiveFontSize = screenWidth * 0.05;

    final double progressPercentage = (_controller.value * 100).clamp(0, 100);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Check heart rate',
          style: TextStyle(fontSize: responsiveFontSize),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlashLightSwitch(
              icon: Icons.favorite_border,
              text: 'Turn on flash light',
              isSwitchOn: isSwitchOn,
              onToggle: (value) {
                setState(() {
                  isSwitchOn = value;
                });
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onLongPress: _startAnimation,
                onLongPressUp: _stopAnimation,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CustomPaint(
                          size: const Size(200, 200),
                          painter: CircularProgressPainter(_controller.value),
                        );
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(40),
                        backgroundColor:
                            const Color.fromARGB(255, 241, 166, 201),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Press and\nhold',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 100,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size(screenWidth, 100),
                    painter: HeartbeatLinePainter(_controller.value),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 243),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Shift your finger to move the dot into the circle.',
                      style: TextStyle(
                        fontSize: responsiveFontSize,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Complete',
                              style: TextStyle(
                                fontSize: responsiveFontSize,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${progressPercentage.toStringAsFixed(0)}%',
                              style: TextStyle(
                                fontSize: responsiveFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: _controller.value,
                            backgroundColor: Colors.grey[300],
                            color: Colors.red,
                            minHeight: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;

  CircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawArc(rect, -pi / 2, 2 * pi * progress, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeartbeatLinePainter extends CustomPainter {
  final double progress;

  HeartbeatLinePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    final double waveLength = size.width / 4;
    final double amplitude = 20;

    for (double i = 0; i < size.width; i += 1) {
      double dx = i;
      double dy =
          sin((i / waveLength * 2 * pi) + progress * 2 * pi) * amplitude +
              size.height / 2;
      if (i == 0) {
        path.moveTo(dx, dy);
      } else {
        path.lineTo(dx, dy);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
