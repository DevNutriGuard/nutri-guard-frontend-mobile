// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/heart-check/widgets/no_recently_data_cards.dart';
import 'package:nutri_guard_mobile/profile/presentation/heart-check/widgets/recently_data_box.dart';

class HeartCheckScreen extends StatefulWidget {
  const HeartCheckScreen({super.key});

  @override
  _HeartCheckScreenState createState() => _HeartCheckScreenState();
}

class _HeartCheckScreenState extends State<HeartCheckScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double responsiveFontSize = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Vitals',
          style: TextStyle(fontSize: responsiveFontSize),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [RecentlyDataBox(), NoRecentlyDataCards()],
        ),
      ),
    );
  }
}
