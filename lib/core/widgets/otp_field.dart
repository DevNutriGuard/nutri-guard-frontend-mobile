// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

class OtpField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  const OtpField(
      {required this.controller, this.focusNode, this.nextFocusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height:78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
            color: AppColors.greyColor,
          width: 1.5
        ),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else if (value.isEmpty && focusNode != null) {
            FocusScope.of(context).requestFocus(focusNode);
          }
        },
      ),
    );
  }
}
