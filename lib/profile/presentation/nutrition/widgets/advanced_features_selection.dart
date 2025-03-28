import 'package:flutter/material.dart';
import 'select_field_widget.dart';

class AdvancedFeaturesSelection extends StatelessWidget {
  final List<SelectField> goalFields = [
    SelectField(
      fieldName: 'Hydration Goals',
      isTextField: true,
      onOptionSelected: (selectedOption) {},
    ),
    SelectField(
      fieldName: 'Caffeine Limit',
      isTextField: true,
      onOptionSelected: (selectedOption) {},
    ),
    SelectField(
      fieldName: 'Alcohol Limits',
      isTextField: true,
      onOptionSelected: (selectedOption) {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SelectFieldWidget(
      title: "Advanced Features",
      fields: goalFields,
    );
  }
}
