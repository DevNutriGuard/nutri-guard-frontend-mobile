// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//
// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/widgets/interaction_alerts_section.dart';
// import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/widgets/medication_and_supplement_introduction.dart';
// import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/widgets/medication_and_supplement_timing_suggestions_cards.dart';
// import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/widgets/personalized_supplement_recommendations.dart';
//
// class MedicationAndSupplementScreen extends StatefulWidget {
//   const MedicationAndSupplementScreen({super.key});
//
//   @override
//   State<MedicationAndSupplementScreen> createState() =>
//       _MedicationAndSupplementScreenState();
// }
//
// class _MedicationAndSupplementScreenState
//     extends State<MedicationAndSupplementScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text('Medication & Supplement'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(13.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const MedicationAndSupplementIntroduction(),
//             SizedBox(
//               height: 300,
//               child: const MedicationAndSupplementTimingSuggestionsCards(),
//             ),
//             const InteractionAlertsSection(),
//             const SizedBox(height: 24),
//             const PersonalizedSupplementRecommendations(),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/widgets/interaction_alerts_section.dart';
import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/widgets/medication_and_supplement_introduction.dart';
import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/widgets/medication_and_supplement_timing_suggestions_cards.dart';
import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/widgets/personalized_supplement_recommendations.dart';
import 'package:intl/intl.dart';
import '../domain/medicine_and_supplement_provider.dart';

class MedicationAndSupplementScreen extends StatefulWidget {
  final String? profileId;

  const MedicationAndSupplementScreen({super.key, this.profileId});

  @override
  State<MedicationAndSupplementScreen> createState() =>
      _MedicationAndSupplementScreenState();
}

class _MedicationAndSupplementScreenState
    extends State<MedicationAndSupplementScreen> {
  late String startDate;
  late String endDate;

  @override
  void initState() {
    super.initState();
    _setDates();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MedicineAndSupplementProvider>(context, listen: false);
      provider.fetchMedicineAndSupplementData(
        profileId: widget.profileId!,
        startDate: startDate,
        endDate: endDate,
      );
    });
  }

  void _setDates() {
    final today = DateTime.now();
    final start = today.subtract(const Duration(days: 7));
    final formatter = DateFormat('yyyy-MM-dd');
    startDate = formatter.format(start);
    endDate = formatter.format(today);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Medication & Supplement'),
        centerTitle: true,
      ),
      body: Consumer<MedicineAndSupplementProvider>(
        builder: (context, provider, child) {
          if (provider.errorMessage != null) {
            return Center(
              child: Text(provider.errorMessage!),
            );
          }

          final supplementSuggestions = provider.medicineAndSupplmentResponseModel.data?.mentalCognitiveData?.supplementRoutineSuggestions ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MedicationAndSupplementIntroduction(),
                SizedBox(
                  height: 300,
                  child: MedicationAndSupplementTimingSuggestionsCards(
                    supplementSuggestions: supplementSuggestions,
                  ),
                ),
                const InteractionAlertsSection(),
                const SizedBox(height: 24),
                PersonalizedSupplementRecommendations(
                  supplementSuggestions: supplementSuggestions,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}