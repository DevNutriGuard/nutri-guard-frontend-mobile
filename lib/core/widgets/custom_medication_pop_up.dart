import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/res/res.dart';

import '../../features/medical_background/widgets/medical_background_button_widget.dart';
import '../../res/common_widgets.dart';

class CustomMedicationPopUp extends StatelessWidget {
  CustomMedicationPopUp({super.key});
  TextEditingController dosageController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.whiteColor
        ),
        width: 343,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Add Medications',
                  fontSize: sizes?.fontSize18,
                  fontWeight: FontWeight.w500,
                ),
                SvgPicture.asset(Assets.scanIcon),
              ],
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                Positioned(
                  left: 12,
                  top: -10,
                  child: Container(
                    color: AppColors.whiteColor,
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4.8),
                    child: const Text(
                      'Medications Name',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: getHeight() * 0.02),

            // Row for dosage and frequency input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Dosage Field
                Stack(
                  children: [
                    Container(
                      width: getWidth() * 0.3,
                      height: 52,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9E9E9)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        controller: dosageController,
                        decoration: const InputDecoration(
                          hintText: 'Enter', // Hint text inside the field
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: -10,
                      child: Container(
                        color: AppColors.whiteColor,
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4.8),
                        child: const Text(
                          'Dosage',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: getWidth() * 0.02), // Gap between fields
                // Frequency Field
                Stack(
                  children: [
                    Container(
                      width: getWidth() * 0.3,
                      height: 52,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9E9E9)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        controller: frequencyController,
                        decoration: InputDecoration(
                          hintText: 'Enter', // Hint text inside the field
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: -10,
                      child: Container(
                        color: AppColors.whiteColor,
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4.8),
                        child: const Text(
                          'Frequency',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: getHeight() * 0.02,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getWidth() * 0.32,
                  child: MedicalBackgroundButtonWidget(
                    text: "Cancel",
                    textColor: AppColors.blackTextColor,
                    backgroundColor: AppColors.whiteColor,
                    borderColor: AppColors.borderColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: getWidth() * 0.32,
                  child: MedicalBackgroundButtonWidget(
                    text: "Save",
                    textColor: AppColors.whiteColor,
                    backgroundColor: AppColors.primaryColor,
                    borderColor: AppColors.borderColor,
                    onPressed: () {
                      // Navigator.pushNamed(context, AppRoutes.medicalBackGround3, arguments: widget.completedSections + 1);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
