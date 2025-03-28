import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import '../../../../../res/assets.dart';

class IntakeTrackersDialog extends StatefulWidget {
  const IntakeTrackersDialog({super.key});

  @override
  _IntakeTrackersDialogState createState() => _IntakeTrackersDialogState();
}

class _IntakeTrackersDialogState extends State<IntakeTrackersDialog> {
  String? selectedContainerType;
  String? selectedContainerValue;
  DateTime? selectedReminder;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Add Intake Trackers Reminder",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: "Inter Tight"
              ),
            ),
            const SizedBox(height: 8.0),
            _buildDropdown(
              title: "Container Type",
              value: selectedContainerType,
              items: ["Breakfast", "Lunch", "Dinner"],
              onChanged: (value) =>
                  setState(() => selectedContainerType = value),
            ),
            _buildDropdown(
              title: "Container Value",
              value: selectedContainerValue,
              items: ["Fruits", "Vegetables", "Meat"],
              onChanged: (value) =>
                  setState(() => selectedContainerValue = value),
            ),
            _buildDatePicker(context),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String title,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          labelText: title,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            value: value,
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Text(item),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
            decoration: const InputDecoration(
              hintText: "Select",
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            ),
            // icon: Image.asset(
            //   Assets.chevronDown,
            //   width: 20,
            //   height: 20,
            // ),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          labelText: "Reminder",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        ),
        child: GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedReminder ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null && pickedDate != selectedReminder) {
              setState(() => selectedReminder = pickedDate);
            }
          },
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedReminder == null
                      ? "Select Date"
                      : "${selectedReminder!.day}/${selectedReminder!.month}/${selectedReminder!.year}",
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                // Image.asset(
                //   Assets.calendarIcon,
                //   width: 24,
                //   height: 24,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
