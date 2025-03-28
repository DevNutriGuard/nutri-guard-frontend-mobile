import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/res/res_export.dart';

class SetGoalsAddCardsWidget extends StatefulWidget {
  final String addTitle;
  final String title;
  final String icon;
  final String subtitle;
  final List<FieldConfig> fields;

  const SetGoalsAddCardsWidget({
    super.key,
    required this.title,
    required this.addTitle,
    required this.icon,
    required this.subtitle,
    required this.fields,
  });

  @override
  _SetGoalsAddCardsWidgetState createState() => _SetGoalsAddCardsWidgetState();
}

class _SetGoalsAddCardsWidgetState extends State<SetGoalsAddCardsWidget> {
  bool _isExpanded = false;
  bool _areFieldsVisible = false;
  bool _isReminderOn = false;

  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (var field in widget.fields) {
      _controllers[field.name] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  _selectDateAndTime(BuildContext context, String fieldName) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        final DateTime selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        setState(() {
          _controllers[fieldName]?.text = selectedDateTime.toIso8601String();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Card(
        color: const Color.fromARGB(255, 248, 247, 247),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.addTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      Assets.add,
                      width: 35,
                      height: 35,
                    ),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  ),
                ],
              ),
              if (_isExpanded)
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    widget.icon,
                                    width: 35,
                                    height: 35,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        widget.subtitle,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  _areFieldsVisible
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  size: 24,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _areFieldsVisible = !_areFieldsVisible;
                                  });
                                },
                              ),
                            ],
                          ),
                          if (_areFieldsVisible)
                            Column(
                              children: [
                                SizedBox(height: 20),
                                ...widget.fields.map((field) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: field.type == FieldType.input
                                        ? TextField(
                                      controller:
                                      _controllers[field.name],
                                      decoration: InputDecoration(
                                        labelText: field.label,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 197, 197, 197),
                                          ),
                                        ),
                                      ),
                                    )
                                        : TextField(
                                      controller:
                                      _controllers[field.name],
                                      decoration: InputDecoration(
                                        labelText: field.label,
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons
                                              .calendar_today_outlined),
                                          onPressed: () =>
                                              _selectDateAndTime(
                                                  context, field.name),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      readOnly: true,
                                    ),
                                  );
                                }).toList(),
                                Card(
                                  color: Colors.grey[100],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              Assets.timeIcon,
                                              width: 35,
                                              height: 35,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Reminder',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Switch(
                                          value: _isReminderOn,
                                          onChanged: (value) {
                                            setState(() {
                                              _isReminderOn = value;
                                            });
                                          },
                                          activeColor: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

enum FieldType { input, date }

class FieldConfig {
  final String name;
  final String label;
  final FieldType type;

  FieldConfig({required this.name, required this.label, required this.type});
}
