// // ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
//
// import 'package:flutter/material.dart';
// import 'dart:math';
//
// class BiohackingAndAdvancedHealthIntro extends StatelessWidget {
//   const BiohackingAndAdvancedHealthIntro({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(2.0),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: const Color.fromARGB(255, 16, 59, 94),
//               ),
//               child: const Icon(
//                 Icons.nights_stay,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'Biohacking & Advanced Health Optimization',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'Optimize body & mind with advanced recommendations.',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         Container(
//           color: Colors.white,
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Fasting Timer',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Center(
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     SizedBox(
//                       width: 200,
//                       height: 200,
//                       child: CustomPaint(
//                         painter: ArcPainter(progress: 0.7),
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "04:57:42",
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           "Your fast starts in",
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: const Text(
//                             "Start",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 const Color.fromARGB(255, 18, 64, 102),
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 32.0,
//                               vertical: 12.0,
//                             ),
//                             shape: const RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8.0)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildTimeCard("Start From", "04:00 AM"),
//                   _buildTimeCard("End From", "12:00 PM"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTimeCard(String title, String time) {
//     return Container(
//       width: 150,
//       padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 218, 217, 217),
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(
//             Icons.watch,
//             size: 20,
//             color: const Color.fromARGB(255, 18, 60, 150),
//           ),
//           const SizedBox(width: 8),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 time,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ArcPainter extends CustomPainter {
//   final double progress;
//
//   ArcPainter({required this.progress});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint backgroundPaint = Paint()
//       ..color = Colors.grey[300]!
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 10.0;
//
//     final Paint progressPaint = Paint()
//       ..shader = SweepGradient(
//         startAngle: -pi / 1.5,
//         endAngle: pi * 2.5,
//         colors: [
//           Colors.red,
//           Colors.orange,
//           Colors.yellow,
//           Colors.green,
//           Colors.blue,
//           Colors.indigo,
//           Colors.purple,
//         ],
//         stops: const [0.0, 0.15, 0.3, 0.45, 0.6, 0.75, 1.0],
//       ).createShader(Rect.fromCircle(
//         center: Offset(size.width / 2, size.height / 2),
//         radius: size.width / 2,
//       ))
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 15.0
//       ..strokeCap = StrokeCap.round;
//
//     final double radius = size.width / 2;
//     final Offset center = Offset(size.width / 2, size.height / 2);
//     const double startAngle = -pi / 1;
//
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       startAngle,
//       pi,
//       false,
//       backgroundPaint,
//     );
//
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       startAngle,
//       pi * progress,
//       false,
//       progressPaint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/models/biohacking_response_model.dart';
import 'dart:math';

import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/domain/biohacking_provider.dart';
import 'package:nutri_guard_mobile/res/assets.dart';

class BiohackingAndAdvancedHealthIntro extends StatelessWidget {
  final List<FastingRecommendations> fastingRecommendations;

  const BiohackingAndAdvancedHealthIntro({
    super.key,
    required this.fastingRecommendations,
  });

  @override
  Widget build(BuildContext context) {
    final fasting = fastingRecommendations.isNotEmpty ? fastingRecommendations.first : null;
    final provider = BiohackingProvider;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 16, 59, 94),
              ),
              child: const Icon(
                Icons.nights_stay,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Biohacking & Advanced Health Optimization',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Optimize body & mind with advanced recommendations.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fasting Timer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CustomPaint(
                        painter: ArcPainter(progress: 0.7),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "04:57:42",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Your fast starts in",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Start",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color.fromARGB(255, 18, 64, 102),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                              vertical: 12.0,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTimeCard("Start From", fasting?.startTime ?? "N/A"),
                  _buildTimeCard("End From", fasting?.endTime ?? "N/A"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeCard(String title, String time) {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 217, 217),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.clockIcon,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor, // The color you want to apply
              BlendMode.srcIn, // Ensures the color fills the SVG
            ),
          ),
          // Icon(
          //   Icons.watch,
          //   size: 20,
          //   color: const Color.fromARGB(255, 18, 60, 150),
          // ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double progress;

  ArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    final Paint progressPaint = Paint()
      ..shader = SweepGradient(
        startAngle: -pi / 1.5,
        endAngle: pi * 2.5,
        colors: [
          Colors.red,
          Colors.orange,
          Colors.yellow,
          Colors.green,
          Colors.blue,
          Colors.indigo,
          Colors.purple,
        ],
        stops: const [0.0, 0.15, 0.3, 0.45, 0.6, 0.75, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    const double startAngle = -pi / 1;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      pi,
      false,
      backgroundPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}