// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/band_push_ups_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/cable_push_ups_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/corba_push_ups_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/db_overhead_push_press_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/widgets/exercises_cards_widget.dart';
import 'package:nutri_guard_mobile/res/assets.dart';

class PushUpsExercises extends StatelessWidget {
  const PushUpsExercises({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExercisesCardsWidget(
          title: 'Band Push-Ups',
          subtitle: '3 Sets',
          imageUrl: Assets.bandPushUps,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BandPushUpsDetailsScreen(),
              ),
            );
          },
        ),
        ExercisesCardsWidget(
          title: 'Cable Push-Ups',
          subtitle: '3 Sets',
          imageUrl: Assets.cablePushUps,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CablePushUpsDetailsScreen()),
            );
          },
        ),
        ExercisesCardsWidget(
          title: 'Corba Push Ups',
          subtitle: '3 Sets',
          imageUrl: Assets.corbaPushUps,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CorbaPushUpsDetailsScreen()),
            );
          },
        ),
        ExercisesCardsWidget(
          title: 'DB Overhead Push Press',
          subtitle: '3 Sets',
          imageUrl: Assets.dbOverheadPushPress,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DbOverheadPushPressDetailsScreen()),
            );
          },
        ),
      ],
    );
  }
}

class BasicPushUpScreen extends StatelessWidget {
  const BasicPushUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Band Push-Ups'),
      ),
      body: Center(
        child: Text('Details about Band Push Up'),
      ),
    );
  }
}

class DiamondPushUpScreen extends StatelessWidget {
  const DiamondPushUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diamond Push Up'),
      ),
      body: Center(
        child: Text('Details about Diamond Push Up'),
      ),
    );
  }
}
