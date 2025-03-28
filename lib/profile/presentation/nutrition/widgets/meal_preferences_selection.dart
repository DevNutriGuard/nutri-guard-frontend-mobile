import 'package:flutter/material.dart';
import 'select_field_widget.dart';

class MealPreferencesSelection extends StatelessWidget {
  final List<SelectField> goalFields = [
    SelectField(
      fieldName: 'Number of Meals',
      options: ['Lose Weight', 'Maintain Weight', 'Gain Weight'],
      onOptionSelected: (selectedOption) {},
    ),
    SelectField(
      fieldName: 'Meal Timing',
      options: ['Increase Muscle', 'Decrease Fat', 'Maintain Composition'],
      onOptionSelected: (selectedOption) {},
    ),
    SelectField(
      fieldName: 'Favorite Ingredients',
      options: ['Lose Weight', 'Maintain Weight', 'Gain Weight'],
      onOptionSelected: (selectedOption) {},
    ),
    SelectField(
      fieldName: 'Disliked Foods',
      options: ['Increase Muscle', 'Decrease Fat', 'Maintain Composition'],
      onOptionSelected: (selectedOption) {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SelectFieldWidget(
      title: "Meal Preferences",
      fields: goalFields,
    );
  }
}
