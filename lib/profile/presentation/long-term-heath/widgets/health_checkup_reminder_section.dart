// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HealthCheckupReminderSection extends StatefulWidget {
  const HealthCheckupReminderSection({super.key});

  @override
  _HealthCheckupReminderSectionState createState() =>
      _HealthCheckupReminderSectionState();
}

class _HealthCheckupReminderSectionState
    extends State<HealthCheckupReminderSection> {
  DateTime? selectedDay;
  List<Map<String, String>> reminders = [];
  List<bool> selectedReminders = [];

  TextEditingController checkupNameController = TextEditingController();
  TextEditingController checkupDateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  String selectedAMPM = 'AM';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Health Checkup Reminders',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.blue),
                  onPressed: () => _showReminderModal(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 7, 70, 95),
                    Color.fromARGB(255, 0, 128, 255),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.now(),
                focusedDay: DateTime.now(),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    this.selectedDay = selectedDay;
                  });
                },
                calendarFormat: CalendarFormat.month,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  leftChevronIcon:
                      Icon(Icons.chevron_left, color: Colors.white),
                  rightChevronIcon:
                      Icon(Icons.chevron_right, color: Colors.white),
                  titleTextStyle: TextStyle(color: Colors.white),
                ),
                calendarStyle: CalendarStyle(
                  defaultDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 7, 70, 95),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  defaultTextStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: reminders.map((reminder) {
                int index = reminders.indexOf(reminder);
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ' ${reminder['name']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Date: ${reminder['date']}',
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Time: ${reminder['time']}',
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Checkbox(
                          value: selectedReminders[index],
                          onChanged: (bool? value) {
                            setState(() {
                              selectedReminders[index] = value!;
                            });
                          },
                          activeColor: const Color.fromARGB(255, 17, 74, 121),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showReminderModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Health Checkup Reminder'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: checkupNameController,
                  decoration: InputDecoration(
                    labelText: 'Checkup Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: checkupDateController,
                  decoration: InputDecoration(
                    labelText: 'Checkup Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      value: selectedAMPM,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedAMPM = newValue!;
                        });
                      },
                      items: ['AM', 'PM']
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                    ),
                    DropdownButton<String>(
                      value: hourController.text.isEmpty
                          ? '08'
                          : hourController.text,
                      onChanged: (String? newValue) {
                        setState(() {
                          hourController.text = newValue!;
                        });
                      },
                      items: List.generate(12, (index) {
                        final hour = (index + 1).toString().padLeft(2, '0');
                        return DropdownMenuItem(
                          value: hour,
                          child: Text(hour),
                        );
                      }),
                    ),
                    DropdownButton<String>(
                      value: minuteController.text.isEmpty
                          ? '00'
                          : minuteController.text,
                      onChanged: (String? newValue) {
                        setState(() {
                          minuteController.text = newValue!;
                        });
                      },
                      items: List.generate(60, (index) {
                        final minute = (index).toString().padLeft(2, '0');
                        return DropdownMenuItem(
                          value: minute,
                          child: Text(minute),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Color.fromARGB(255, 12, 69, 116)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        reminders.add({
                          'name': checkupNameController.text,
                          'date': checkupDateController.text,
                          'time':
                              '${hourController.text}:${minuteController.text} $selectedAMPM',
                        });
                        selectedReminders.add(false);
                      });
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 17, 74, 121),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
