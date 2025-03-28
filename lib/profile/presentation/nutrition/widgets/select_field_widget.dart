// import 'package:flutter/material.dart';
//
// class SelectField {
//   final String fieldName;
//   final List<String>? options;
//   String? selectedOption;
//   final ValueChanged<String?> onOptionSelected;
//   final bool isTextField;
//
//   SelectField({
//     required this.fieldName,
//     this.options,
//     this.selectedOption,
//     required this.onOptionSelected,
//     this.isTextField = false,
//   });
// }
//
// class SelectFieldWidget extends StatelessWidget {
//   final String title;
//   final List<SelectField> fields;
//
//   const SelectFieldWidget({
//     Key? key,
//     required this.title,
//     required this.fields,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.0),
//           boxShadow: const [
//             BoxShadow(
//                 color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(14.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ...fields.map((field) => _buildField(field)).toList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildField(SelectField field) {
//     if (field.isTextField) {
//       return _buildTextField(field);
//     } else {
//       return _buildSelectField(field);
//     }
//   }
//
//   Widget _buildSelectField(SelectField field) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               border: Border.all(
//                 color: Colors.grey.shade400,
//                 width: 1.0,
//               ),
//             ),
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//             child: DropdownButtonFormField<String>(
//               value: field.selectedOption,
//               onChanged: (String? newValue) {
//                 field.onOptionSelected(newValue);
//               },
//               items: field.options!
//                   .map<DropdownMenuItem<String>>(
//                     (String option) => DropdownMenuItem<String>(
//                       value: option,
//                       child: Text(option),
//                     ),
//                   )
//                   .toList(),
//               isExpanded: true,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//                 isDense: true,
//                 contentPadding: EdgeInsets.zero,
//               ),
//               dropdownColor: Colors.white,
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.black,
//               ),
//               hint: const Text(
//                 "Select",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: -8,
//             left: 12,
//             child: Container(
//               color: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 4.0),
//               child: Text(
//                 field.fieldName,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextField(SelectField field) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               border: Border.all(
//                 color: Colors.grey.shade400,
//                 width: 1.0,
//               ),
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: TextFormField(
//               initialValue: field.selectedOption,
//               onChanged: (newValue) {
//                 field.onOptionSelected(newValue);
//               },
//               decoration: const InputDecoration(
//                 hintText: 'Enter',
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.symmetric(vertical: 8.0),
//               ),
//             ),
//           ),
//           Positioned(
//             top: -8,
//             left: 12,
//             child: Container(
//               color: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 4.0),
//               child: Text(
//                 field.fieldName,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/assets.dart';

class SelectField {
  final String fieldName;
  final List<String>? options;
  String? selectedOption;
  final ValueChanged<String?> onOptionSelected;
  final bool isTextField;

  SelectField({
    required this.fieldName,
    this.options,
    this.selectedOption,
    required this.onOptionSelected,
    this.isTextField = false,
  });
}

class SelectFieldWidget extends StatelessWidget {
  final String title;
  final List<SelectField> fields;

  const SelectFieldWidget({
    Key? key,
    required this.title,
    required this.fields,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              ...fields.map((field) => _buildField(field)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(SelectField field) {
    if (field.isTextField) {
      return _buildTextField(field);
    } else {
      return _buildSelectField(field);
    }
  }

  Widget _buildSelectField(SelectField field) {
    // Check if the field is "Meal Timing" to show a calendar icon
    final bool isMealTiming = field.fieldName == 'Meal Timing';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1.0,
              ),
            ),
            padding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: DropdownButtonFormField<String>(
              value: field.selectedOption,
              onChanged: (String? newValue) {
                field.onOptionSelected(newValue);
              },
              items: field.options!
                  .map<DropdownMenuItem<String>>(
                    (String option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                ),
              )
                  .toList(),
              isExpanded: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              dropdownColor: Colors.white,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              hint: Text(
                "Select",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.blackTextColor,
                ),
              ),
              // Conditionally set the icon based on the field name
              icon: isMealTiming
                  ? SvgPicture.asset(Assets.calendar)
                  : null, // Default dropdown arrow if not "Meal Timing"
            ),
          ),
          Positioned(
            top: -8,
            left: 12,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                field.fieldName,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(SelectField field) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1.0,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              initialValue: field.selectedOption,
              onChanged: (newValue) {
                field.onOptionSelected(newValue);
              },
              decoration: const InputDecoration(
                hintText: 'Enter',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              ),
            ),
          ),
          Positioned(
            top: -8,
            left: 12,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                field.fieldName,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}