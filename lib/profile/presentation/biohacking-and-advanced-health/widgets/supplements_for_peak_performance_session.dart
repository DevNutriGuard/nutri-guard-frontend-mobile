// import 'package:flutter/material.dart';
// import '../../../../../res/assets.dart';
// import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
//
// class SupplementsForPeakPerformanceSession extends StatelessWidget {
//   const SupplementsForPeakPerformanceSession({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Supplements for Peak Performance',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: InkWell(
//                   onTap: () => Navigator.pushNamed(
//                       context, AppRoutes.ashwagandhaDetailsScreen),
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 8),
//                         const Text(
//                           'Ashwagandha',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Container(
//                           height: 100,
//                           width: 140,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12.0),
//                             child: Image.asset(
//                               Assets.onboardingImage3,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: IconButton(
//                             icon: const Icon(Icons.arrow_forward),
//                             onPressed: () => Navigator.pushNamed(
//                                 context, AppRoutes.ashwagandhaDetailsScreen),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: InkWell(
//                   onTap: () => Navigator.pushNamed(
//                       context, AppRoutes.creatineDetailsScreen),
//                   child: Card(
//                     elevation: 5,
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 8),
//                         const Text(
//                           'Creatine',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Container(
//                           height: 100,
//                           width: 140,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12.0),
//                             child: Image.asset(
//                               Assets.onboardingImage3,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: IconButton(
//                             icon: const Icon(Icons.arrow_forward),
//                             onPressed: () => Navigator.pushNamed(
//                                 context, AppRoutes.creatineDetailsScreen),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/models/biohacking_response_model.dart';
import '../../../../../res/assets.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';

class SupplementsForPeakPerformanceSession extends StatelessWidget {
  final List<SupplementsForPeakPerformance> supplements;

  const SupplementsForPeakPerformanceSession({
    super.key,
    required this.supplements,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Supplements for Peak Performance',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: supplements.map((supplement) {
              return Expanded(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.ashwagandhaDetailsScreen),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          supplement.title ?? 'No Title',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 100,
                          width: 140,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              Assets.onboardingImage3,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () => Navigator.pushNamed(
                                context, AppRoutes.ashwagandhaDetailsScreen),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}