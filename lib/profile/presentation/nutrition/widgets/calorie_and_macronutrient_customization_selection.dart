import 'package:flutter/material.dart';
import 'select_field_widget.dart';

class CalorieAndMacronutrientCustomizationSelection extends StatelessWidget {
  final List<SelectField> goalFields = [
    SelectField(
      fieldName: 'Daily Calorie Target',
      isTextField: true,
      onOptionSelected: (selectedOption) {},
    ),
    SelectField(
      fieldName: 'Macronutrient Ratios',
      options: ['Increase Muscle', 'Decrease Fat', 'Maintain Composition'],
      onOptionSelected: (selectedOption) {},
    ),
    SelectField(
      fieldName: 'Micronutrient Targets',
      options: [
        'Improve Heart Health',
        'Increase Flexibility',
        'Increase Strength'
      ],
      onOptionSelected: (selectedOption) {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SelectFieldWidget(
      title: "Calorie and Macronutrient Customization",
      fields: goalFields,
    );
  }
}
