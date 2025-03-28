import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/widgets/sleep_and_recovery_introduction.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/widgets/sleep_quality_insights_section.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/widgets/sleep_environment_tips.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/widgets/personalized_wellness_tips_section.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/widgets/sleep_and_recovery_supplements_section.dart';
import '../domain/sleep_and_recovery_provider.dart';

class SleepAndRecoveryScreen extends StatefulWidget {
  final String? profileId;

  const SleepAndRecoveryScreen({super.key, this.profileId});

  @override
  State<SleepAndRecoveryScreen> createState() => _SleepAndRecoveryScreenState();
}

class _SleepAndRecoveryScreenState extends State<SleepAndRecoveryScreen> {
  late String startDate;
  late String endDate;

  @override
  void initState() {
    super.initState();
    _setDates();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SleepAndRecoveryProvider>(context, listen: false);
      provider.fetchSleepRecoveryData(
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
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Sleep and Recovery'),
        centerTitle: true,
      ),
      body: Consumer<SleepAndRecoveryProvider>(
        builder: (context, provider, child) {
          if (provider.errorMessage != null) {
            return Center(
              child: Text(provider.errorMessage!),
            );
          }

          final responseModel = provider.sleepAndRecoveryResponseModel;

          if (responseModel.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SleepAndRecoveryIntroduction(),
                const SizedBox(height: 24),
                const SleepQualityInsights(),
                const SizedBox(height: 24),
                SizedBox(
                  height: 300,
                  child: SleepEnvironmentTips(
                    tips: provider.sleepAndRecoveryResponseModel.data?.spikeSleepData,
                  ),
                ),
                const SizedBox(height: 24),
                PersonalizedWellnessTipsSection(
                  tips: provider.sleepAndRecoveryResponseModel.data?.spikeSleepData,
                ),
                const SizedBox(height: 24),
                SleepAndRecoverySupplements(
                  supplements: provider.sleepAndRecoveryResponseModel.data?.spikeSleepData
                ),
              ],
            ),
          );

        },
      ),
    );
  }
}
