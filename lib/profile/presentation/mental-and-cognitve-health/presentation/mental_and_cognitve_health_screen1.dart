// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//
// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
// import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/cognitive_enhancement_foods.dart';
// import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/congnitive_enhancement_supplements.dart';
// import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/mental_health_introduction.dart';
// import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/mindfulness_suggestions_section.dart';
// import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/stress_level_section.dart';
// import '../../../../../../core/routes/app_routes.dart';
//
// class MentalAndCognitveHealthScreen1 extends StatefulWidget {
//   const MentalAndCognitveHealthScreen1({super.key});
//
//   @override
//   State<MentalAndCognitveHealthScreen1> createState() =>
//       _MentalAndCognitveHealthScreen1State();
// }
//
// class _MentalAndCognitveHealthScreen1State
//     extends State<MentalAndCognitveHealthScreen1> {
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
//         title: const Text('Mental & Cognitive Health'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(13.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const MentalHealthIntroSection(),
//             const SizedBox(height: 24),
//             const StressLevelSection(),
//             const SizedBox(height: 24),
//             const StartBreathingExerciseButton(),
//             const SizedBox(height: 24),
//             const MindfulnessSuggestionsSection(),
//             const SizedBox(height: 24),
//             const CognitiveEnhancementFoods(),
//             const SizedBox(height: 24),
//             const CognitiveEnhancementSupplements(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class StartBreathingExerciseButton extends StatelessWidget {
//   const StartBreathingExerciseButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: CustomButton(
//         label: "Start Breathing Exercise",
//         onPressed: () {
//           Navigator.pushReplacementNamed(
//             context,
//             AppRoutes.breathingExerciseScreen,
//           );
//         },
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/cognitive_enhancement_foods.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/congnitive_enhancement_supplements.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/mental_health_introduction.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/mindfulness_suggestions_section.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/widgets/stress_level_section.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../domain/mental_and_cognitive_health_provider.dart';

class MentalAndCognitveHealthScreen1 extends StatefulWidget {
  const MentalAndCognitveHealthScreen1({super.key, this.profileId});

  final String? profileId;

  @override
  State<MentalAndCognitveHealthScreen1> createState() =>
      _MentalAndCognitveHealthScreen1State();
}

class _MentalAndCognitveHealthScreen1State
    extends State<MentalAndCognitveHealthScreen1> {
  late String startDate;
  late String endDate;

  @override
  void initState() {
    super.initState();
    _setDates();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MentalAndCognitiveHealthProvider>(context,
          listen: false);
      provider.fetchMentalAndCognitiveHealthData(
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
            Navigator.pop(context);
          },
        ),
        title: const Text('Mental & Cognitive Health'),
        centerTitle: true,
      ),
      body: Consumer<MentalAndCognitiveHealthProvider>(
        builder: (context, provider, child) {
          if (provider.errorMessage != null) {
            return Center(
              child: Text(provider.errorMessage!),
            );
          }

          final responseModel = provider.mentalAndCognitiveHealthResponseModel;

          if (responseModel.data == null ||
              responseModel.data?.mentalCognitiveData == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final mentalCognitiveData = responseModel.data?.mentalCognitiveData;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MentalHealthIntroSection(),
                const SizedBox(height: 24),
                const StressLevelSection(),
                const SizedBox(height: 24),
                const StartBreathingExerciseButton(),
                const SizedBox(height: 24),
                MindfulnessSuggestionsSection(
                  mindfulnessReminders:
                  mentalCognitiveData?.mindfulnessReminders ?? [],
                ),
                const SizedBox(height: 24),
                CognitiveEnhancementFoods(
                  cognitiveEnhancementFoods:
                  provider.mentalAndCognitiveHealthResponseModel.data?.stressData ?? [],
                ),
                const SizedBox(height: 24),
                CognitiveEnhancementSupplements(
                  cognitiveEnhancementSupplements:
                  provider.mentalAndCognitiveHealthResponseModel.data?.stressData ?? [],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class StartBreathingExerciseButton extends StatelessWidget {
  const StartBreathingExerciseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        label: "Start Breathing Exercise",
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.breathingExerciseScreen,
          );
        },
      ),
    );
  }
}
