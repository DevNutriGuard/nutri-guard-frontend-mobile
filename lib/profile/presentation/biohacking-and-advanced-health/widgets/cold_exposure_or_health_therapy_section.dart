// import 'package:flutter/material.dart';
// import '../../../../../res/assets.dart';
// import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
//
// class ColdExposureOrHealthTherapySection extends StatelessWidget {
//   const ColdExposureOrHealthTherapySection({super.key});
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
//             'Cold Exposure or Heat Therapy',
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
//                       context, AppRoutes.iceBathDetailsScreen),
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
//                           'Ice Bath',
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
//                                 context, AppRoutes.iceBathDetailsScreen),
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
//                       context, AppRoutes.saunaSessionDetailsScreen),
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
//                           'Sauna sessions',
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
//                                 context, AppRoutes.saunaSessionDetailsScreen),
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

class ColdExposureOrHealthTherapySection extends StatelessWidget {
  final List<ColdHeatTherapy> coldHeatTherapy;

  const ColdExposureOrHealthTherapySection({
    super.key,
    required this.coldHeatTherapy,
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
            'Cold Exposure or Heat Therapy',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: coldHeatTherapy.map((therapy) {
              return Expanded(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.saunaSessionDetailsScreen),
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
                          therapy.title ?? 'No Title',
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
                                context, AppRoutes.saunaSessionDetailsScreen),
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