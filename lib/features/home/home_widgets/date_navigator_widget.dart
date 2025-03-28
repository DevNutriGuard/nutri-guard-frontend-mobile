import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_colors.dart';
import '../../../res/assets.dart'; // For date formatting

class DateNavigator extends StatefulWidget {
  const DateNavigator({super.key});

  @override
  _DateNavigatorState createState() => _DateNavigatorState();
}

class _DateNavigatorState extends State<DateNavigator> {
  DateTime _currentDate = DateTime.now(); // Start with today's date
  bool _isToday = true; // Flag to show "Today" initially

  // Format the date as "dd MMM yyyy" (e.g., "27 Mar 2025")
  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  // Check if the date is today
  bool _checkIfToday(DateTime date) {
    final today = DateTime.now();
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }

  // Go to the previous day
  void _previousDay() {
    setState(() {
      _currentDate = _currentDate.subtract(const Duration(days: 1));
      _isToday = _checkIfToday(_currentDate);
    });
  }

  // Go to the next day
  void _nextDay() {
    setState(() {
      _currentDate = _currentDate.add(const Duration(days: 1));
      _isToday = _checkIfToday(_currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the row content
      children: [
        GestureDetector(
          onTap: _previousDay,
          child: SvgPicture.asset(Assets.backwardIcon, color: AppColors.primaryColor, width: 20, height: 20,),
        ),

        const SizedBox(width: 10), // Space between arrow and text
        Text(
          _isToday ? "Today" : _formatDate(_currentDate), // Show "Today" or the date
          style: const TextStyle(
            fontSize: 14, // Adjust font size as needed
            fontWeight: FontWeight.w500, // Regular weight
            color: Colors.black, // Black text
            fontFamily: "Inter Tight"
          ),
        ),
        const SizedBox(width: 10), // Space between text and arrow
        GestureDetector(
          onTap: _nextDay,
          child: SvgPicture.asset(Assets.forwardIcon, color: AppColors.primaryColor,),
        ),
      ],
    );
  }
}