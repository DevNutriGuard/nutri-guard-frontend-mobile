import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class YesNoButtonsWidget extends StatelessWidget {
  final String selectedOption;
  final Function(String) onOptionSelected;

  const YesNoButtonsWidget({
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => onOptionSelected('No'),
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedOption == 'No'
                  ? AppColors.primaryColor
                  : Colors.grey[100],
              padding: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'No',
              style: TextStyle(
                color: selectedOption == 'No' ? Colors.white : Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () => onOptionSelected('Yes'),
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedOption == 'Yes'
                  ? AppColors.primaryColor
                  : Colors.white,
              side: BorderSide(color: AppColors.primaryColor),
              padding: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Yes',
              style: TextStyle(
                color: selectedOption == 'Yes' ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
