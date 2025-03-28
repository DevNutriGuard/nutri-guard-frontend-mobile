// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/band_push_ups_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/cable_push_ups_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/corba_push_ups_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/db_overhead_push_press_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/widgets/exercises_cards_widget.dart';
import 'package:nutri_guard_mobile/res/assets.dart';

class AllFemaleFitnessExercisesCards extends StatelessWidget {
  final Map<String, GlobalKey> letterKeys;

  const AllFemaleFitnessExercisesCards({required this.letterKeys, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {
        'title': 'Band Push-Ups',
        'subtitle': '3 Sets',
        'image': Assets.bandPushUps,
        'screen': BandPushUpsDetailsScreen()
      },
      {
        'title': 'Cable Push-Ups',
        'subtitle': '3 Sets',
        'image': Assets.cablePushUps,
        'screen': CablePushUpsDetailsScreen()
      },
      {
        'title': 'Corba Push Ups',
        'subtitle': '3 Sets',
        'image': Assets.corbaPushUps,
        'screen': CorbaPushUpsDetailsScreen()
      },
      {
        'title': 'DB Overhead Push Press',
        'subtitle': '3 Sets',
        'image': Assets.dbOverheadPushPress,
        'screen': DbOverheadPushPressDetailsScreen()
      },
      {
        'title': 'New',
        'subtitle': '3 Sets',
        'image': Assets.dbOverheadPushPress,
        'screen': DbOverheadPushPressDetailsScreen()
      },
      {
        'title': 'Test',
        'subtitle': '3 Sets',
        'image': Assets.dbOverheadPushPress,
        'screen': DbOverheadPushPressDetailsScreen()
      },
    ];

    final Map<String, GlobalKey> exerciseKeys = {
      for (var exercise in exercises) exercise['title'] as String: GlobalKey()
    };

    return Column(
      children: exercises.map((exercise) {
        return Container(
          key: exerciseKeys[exercise['title'] as String],
          child: ExercisesCardsWidget(
            title: exercise['title'] as String,
            subtitle: exercise['subtitle'] as String,
            imageUrl: exercise['image'] as String,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => exercise['screen'] as Widget),
              );
            },
          ),
        );
      }).toList(),
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
