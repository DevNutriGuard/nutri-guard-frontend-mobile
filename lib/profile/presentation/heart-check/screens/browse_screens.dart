// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import '../../../../../res/assets.dart';

class BrowseScreens extends StatefulWidget {
  const BrowseScreens({super.key});

  @override
  _BrowseScreensState createState() => _BrowseScreensState();
}

class _BrowseScreensState extends State<BrowseScreens> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  void _onSkip() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, AppRoutes.checkHeartRateScreen1);
    }
  }

  void _onBack() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, AppRoutes.heartCheckScreen);
    }
  }

  Widget _buildPage(String image, String title, String paragraph) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            paragraph,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildIndicator() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 12, 75, 126),
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 6,
            top: 6,
            right: 6,
            bottom: 6,
            child: CircularProgressIndicator(
              value: (_currentPage + 1) / 3,
              strokeWidth: 3,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: _onSkip,
            iconSize: 30,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        text,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildPage(
                  Assets.browseImage1,
                  'Measure heart rate using phone camera.',
                  'Track your heart rate after activities or in the morning for a resting baseline. Understand your body\'s response in different situations effortlessly.'),
              _buildPage(Assets.browseImage2, 'You just need to give us a hand',
                  'Place your finger on the rear-facing camera lens to measure your heart rate. Ensure accuracy by being in a well-lit area and keeping your hand steady.'),
              _buildPage(
                  Assets.browseImage3,
                  'Finger on lens for instant heart rate.',
                  'Hold your hand steady and apply light pressure with your finger'),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(_currentPage == 0 ? 'Cancel' : 'Back', _onBack),
                  const SizedBox(width: 20),
                  _buildIndicator(),
                  const SizedBox(width: 20),
                  _buildButton('Skip', _onSkip),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
