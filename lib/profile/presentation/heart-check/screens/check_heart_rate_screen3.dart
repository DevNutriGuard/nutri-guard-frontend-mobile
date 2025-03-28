// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CheckHeartRateScreen3 extends StatefulWidget {
  const CheckHeartRateScreen3({super.key});

  @override
  _CheckHeartRateScreen3State createState() => _CheckHeartRateScreen3State();
}

class _CheckHeartRateScreen3State extends State<CheckHeartRateScreen3> {
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
          'Check heart rate',
          style: TextStyle(fontSize: responsiveFontSize),
        ),
      ),
      body: SingleChildScrollView(),
    );
  }
}
