// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/widgets/horizonalScrollableCards.dart';
//
// class MedicationAndSupplementTimingSuggestionsCards extends StatelessWidget {
//   const MedicationAndSupplementTimingSuggestionsCards({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final items = [
//       CardItem(
//         icon: Icons.watch_rounded,
//         title: 'Morning at  8:00 am',
//         subtitle: 'Take Medication A with breakfast.',
//         onTap: () {},
//       ),
//       CardItem(
//         icon: Icons.watch_rounded,
//         title: 'Afternoon at  2:00 pm',
//         subtitle: 'Take Omega-3 (avoid with Medication B)',
//         onTap: () {},
//       ),
//       CardItem(
//         icon: Icons.watch,
//         title: 'Evening at  8:00 pm',
//         subtitle: 'Take Vitamin D with dinner',
//         onTap: () {},
//       ),
//     ];
//
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: Container(
//           margin: const EdgeInsets.all(2.0),
//           padding: const EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8.0),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.3),
//                 blurRadius: 8,
//                 offset: Offset(0, 4),
//               ),
//             ],
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Medication & Supplement Timing Suggestions',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const SizedBox(height: 16),
//                 HorizontalScrollableCards(items: items),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/models/medicine_and_supplment_response_model.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/widgets/horizonalScrollableCards.dart';

class MedicationAndSupplementTimingSuggestionsCards extends StatelessWidget {
  final List<SupplementRoutineSuggestions> supplementSuggestions;

  const MedicationAndSupplementTimingSuggestionsCards({
    super.key,
    required this.supplementSuggestions,
  });

  @override
  Widget build(BuildContext context) {
    final items = supplementSuggestions.map((supplement) {
      return CardItem(
        icon: Icons.watch_rounded,
        title: supplement.title ?? 'No Title',
        subtitle: supplement.description ?? 'No Description',
        onTap: () {},
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Medication & Supplement Timing Suggestions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 16),
                HorizontalScrollableCards(items: items),
              ],
            ),
          ),
        ),
      ),
    );
  }
}