// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//
// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/widgets/biohacking_and_advanced_health_intro.dart';
// import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/widgets/cold_exposure_or_health_therapy_section.dart';
// import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/widgets/supplements_for_peak_performance_session.dart';
//
// class BiohackingAndAdvancedHealthScreen extends StatefulWidget {
//   const BiohackingAndAdvancedHealthScreen({super.key});
//
//   @override
//   State<BiohackingAndAdvancedHealthScreen> createState() =>
//       _BiohackingAndAdvancedHealthScreenState();
// }
//
// class _BiohackingAndAdvancedHealthScreenState
//     extends State<BiohackingAndAdvancedHealthScreen> {
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
//         title: const Text('Biohacking & Advanced Health'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(13.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const BiohackingAndAdvancedHealthIntro(),
//             const SizedBox(height: 24),
//             const ColdExposureOrHealthTherapySection(),
//             const SizedBox(height: 24),
//             const SupplementsForPeakPerformanceSession(),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/widgets/biohacking_and_advanced_health_intro.dart';
import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/widgets/cold_exposure_or_health_therapy_section.dart';
import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/widgets/supplements_for_peak_performance_session.dart';
import '../domain/biohacking_provider.dart';

class BiohackingAndAdvancedHealthScreen extends StatefulWidget {
  final String profileId;

  const BiohackingAndAdvancedHealthScreen({super.key, required this.profileId});

  @override
  State<BiohackingAndAdvancedHealthScreen> createState() =>
      _BiohackingAndAdvancedHealthScreenState();
}

class _BiohackingAndAdvancedHealthScreenState
    extends State<BiohackingAndAdvancedHealthScreen> {
  late String startDate;
  late String endDate;

  @override
  void initState() {
    super.initState();
    _setDates();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BiohackingProvider>(context, listen: false);
      provider.fetchBioHackingData(
        profileId: widget.profileId,
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
        title: const Text('Biohacking & Advanced Health'),
        centerTitle: true,
      ),
      body: Consumer<BiohackingProvider>(
        builder: (context, provider, child) {
          if (provider.errorMessage != null) {
            return Center(
              child: Text(provider.errorMessage!),
            );
          }

          final biohackingData = provider.biohackingResponseModel.data?.biohackingRecommendations;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BiohackingAndAdvancedHealthIntro(
                  fastingRecommendations: biohackingData?.fastingRecommendations ?? [],
                ),
                const SizedBox(height: 24),
                ColdExposureOrHealthTherapySection(
                  coldHeatTherapy: biohackingData?.coldHeatTherapy ?? [],
                ),
                const SizedBox(height: 24),
                SupplementsForPeakPerformanceSession(
                  supplements: biohackingData?.supplementsForPeakPerformance ?? [],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}