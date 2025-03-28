import 'package:flutter/material.dart';
import 'select_field_widget.dart';

class DietaryRestrictionsSelection extends StatelessWidget {
  final List<SelectField> goalFields = [
    SelectField(
      fieldName: 'Food Allergies',
      options: ['Lose Weight', 'Maintain Weight', 'Gain Weight'],
      onOptionSelected: (selectedOption) {
        print('Weight Goal selected: $selectedOption');
      },
    ),
    SelectField(
      fieldName: 'Intolerances',
      options: ['Increase Muscle', 'Decrease Fat', 'Maintain Composition'],
      onOptionSelected: (selectedOption) {
        print('Body Composition Goal selected: $selectedOption');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SelectFieldWidget(
      title: "Dietary Restrictions",
      fields: goalFields,
    );
  }
}
