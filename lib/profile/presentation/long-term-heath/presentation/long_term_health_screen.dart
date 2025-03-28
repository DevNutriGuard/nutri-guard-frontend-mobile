import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:nutri_guard_mobile/profile/presentation/long-term-heath/widgets/health_checkup_reminder_section.dart';
import 'package:nutri_guard_mobile/profile/presentation/long-term-heath/widgets/long_term_health_intro.dart';
import 'package:nutri_guard_mobile/profile/presentation/long-term-heath/widgets/personalized_long_term_health_supplements_section.dart';
import 'package:nutri_guard_mobile/profile/presentation/long-term-heath/widgets/routine_adjustments.dart';
import '../domain/long_term_health_provider.dart';

class LongTermHealthScreen extends StatefulWidget {
  final String? profileId;

  const LongTermHealthScreen({super.key, this.profileId});

  @override
  State<LongTermHealthScreen> createState() => _LongTermHealthScreenState();
}

class _LongTermHealthScreenState extends State<LongTermHealthScreen> {
  late String startDate;
  late String endDate;

  @override
  void initState() {
    super.initState();
    _setDates();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<LongTermHealthProvider>(context, listen: false);
      provider.initContext(context);
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Long Term Health'),
          centerTitle: true,
        ),
        body: Consumer<LongTermHealthProvider>(
          builder: (context, provider, child) {
            if (provider.longTermHealthResponseModel.data == null) {
              return const Center(child: CircularProgressIndicator());
            }

            final longTermHealthData =
                provider.longTermHealthResponseModel.data?.longTermHealth?.longTermHealthData;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LongTermHealthIntro(),
                  const SizedBox(
                    height: 300,
                    child: RoutineAdjustments(),
                  ),
                  const HealthCheckupReminderSection(),
                  const SizedBox(height: 24),
                  PersonalizedLongTermHealthSupplementsSection(
                    supplements: longTermHealthData?.personalizedLongTermHealthSupplements,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
