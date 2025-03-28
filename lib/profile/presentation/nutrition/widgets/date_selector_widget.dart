// lib/widgets/date_selector_widget.dart

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class DateSelectorWidget extends StatefulWidget {
  const DateSelectorWidget({super.key});

  @override
  DateSelectorWidgetState createState() => DateSelectorWidgetState();
}

class DateSelectorWidgetState extends State<DateSelectorWidget> {
  String selectedDay = 'Sunday';

  String getDayName(int weekdayIndex) {
    switch (weekdayIndex) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  List<Map<String, String>> getCurrentWeekDays() {
    List<Map<String, String>> days = [];
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < 7; i++) {
      DateTime day =
          currentDate.subtract(Duration(days: currentDate.weekday - 1 - i));
      days.add({
        'dayName': getDayName(day.weekday),
        'dayNumber': day.day.toString(),
      });
    }
    return days;
  }

  void _onDaySelected(String day) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> currentWeekDays = getCurrentWeekDays();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 6.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 233, 233),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: currentWeekDays.map((dayData) {
            return GestureDetector(
              onTap: () => _onDaySelected(dayData['dayName']!),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                height: 90.0,
                width: 45.0,
                decoration: BoxDecoration(
                  color: selectedDay == dayData['dayName']
                      ? AppColors.primaryColor
                      : Color.fromARGB(255, 234, 234, 234),
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 4.0),
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      dayData['dayName']!,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: selectedDay == dayData['dayName']
                            ? Colors.white
                            : const Color.fromARGB(255, 206, 204, 204),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      dayData['dayNumber']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: selectedDay == dayData['dayName']
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
