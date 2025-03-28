import 'package:flutter/material.dart';

class CustomFloatingButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFloatingButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 618,
      left: 283,
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          children: [
            // Outer Layer with Gradient Shadow
            Container(
              width: 76,
              height: 76,
              padding: const EdgeInsets.only(top: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                gradient: const RadialGradient(
                  center: Alignment(-0.3149, -0.8419),
                  radius: 2.0,
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.6),
                    Color.fromRGBO(83, 144, 217, 0.18),
                    Color.fromRGBO(255, 255, 255, 0.6),
                  ],
                  stops: [0.268, 0.4897, 0.6909],
                ),
              ),
            ),
            // Inner Layer with Solid Button Color
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.only(top: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: const Color.fromRGBO(83, 144, 217, 1), // Solid Button Color
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
