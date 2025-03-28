// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import 'dart:async';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/circle_painter.dart';

class BreathingExerciseScreen extends StatefulWidget {
  const BreathingExerciseScreen({super.key});

  @override
  _BreathingExerciseScreenState createState() =>
      _BreathingExerciseScreenState();
}

class _BreathingExerciseScreenState extends State<BreathingExerciseScreen>
    with TickerProviderStateMixin {
  String timerText = "00:00:00";
  bool isAnimationStarted = false;
  late int selectedTime;

  late AnimationController _controller;
  late Animation<double> _animation;

  late Timer _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    selectedTime = 30;
    _controller = AnimationController(
      duration: Duration(seconds: selectedTime),
      vsync: this,
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  void _startAnimation() {
    if (_controller.isAnimating || _controller.isCompleted) {
      return;
    }
    setState(() {
      isAnimationStarted = true;
    });
    _controller.repeat();
    _startTimer();
  }

  void _stopAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
      _stopTimer();
    }
    setState(() {
      isAnimationStarted = false;
    });
  }

  void _startTimer() {
    _elapsedSeconds = 0;
    _updateTimerText();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
      _updateTimerText();
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _updateTimerText() {
    int minutes = _elapsedSeconds ~/ 60;
    int seconds = _elapsedSeconds % 60;
    int hours = minutes ~/ 60;
    setState(() {
      timerText =
          "${_padTime(hours)}:${_padTime(minutes % 60)}:${_padTime(seconds)}";
    });
  }

  String _padTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(
              context, AppRoutes.mentalAndCognitveHealthScreen1),
        ),
        title: const Text(
          'Start Breathing Exercise',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Hold & Exhale Breath',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enhance your mental health, please hold and exhale breath for a better experience.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [],
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 68, 124),
                      borderRadius: BorderRadius.circular(125),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Hold',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 211, 130, 8),
                        ),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return CustomPaint(
                        size: Size(250, 250),
                        painter: CirclePainter(_animation.value),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(width: 20),
              Text(
                'timer',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                timerText,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              isAnimationStarted
                  ? StopNowButton(onPressed: _stopAnimation)
                  : StartNowButton(onPressed: _startAnimation),
            ],
          ),
        ),
      ),
    );
  }
}

class StartNowButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartNowButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        label: "Start Now",
        onPressed: onPressed,
      ),
    );
  }
}

class StopNowButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StopNowButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        label: "Stop Now",
        onPressed: onPressed,
        backgroundColor: Colors.red,
      ),
    );
  }
}
