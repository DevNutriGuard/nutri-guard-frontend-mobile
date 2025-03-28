import 'package:flutter/material.dart';
import 'select_field_widget.dart';

class GoalSelection extends StatelessWidget {
  final List<SelectField> goalFields = [
    SelectField(
      fieldName: 'Weight Goal',
      options: ['Lose Weight', 'Maintain Weight', 'Gain Weight'],
      onOptionSelected: (selectedOption) {
        print('Weight Goal selected: $selectedOption');
      },
    ),
    SelectField(
      fieldName: 'Body Composition Goal',
      options: ['Increase Muscle', 'Decrease Fat', 'Maintain Composition'],
      onOptionSelected: (selectedOption) {
        print('Body Composition Goal selected: $selectedOption');
      },
    ),
    SelectField(
      fieldName: 'Health Specific Goals',
      options: [
        'Improve Heart Health',
        'Increase Flexibility',
        'Increase Strength'
      ],
      onOptionSelected: (selectedOption) {
        print('Health Specific Goals selected: $selectedOption');
      },
    ),
    SelectField(
      fieldName: 'Dietary Preferences',
      options: ['Vegan', 'Vegetarian', 'Non-Vegetarian'],
      onOptionSelected: (selectedOption) {
        print('Dietary Preferences selected: $selectedOption');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SelectFieldWidget(
      title: "Goal Selection",
      fields: goalFields,
    );
  }
}
