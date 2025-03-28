// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/features/questionare/widgets/yes_no_buttons_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/medical_background_provider.dart';

class MedicalBackground5 extends StatefulWidget {
  const MedicalBackground5({Key? key}) : super(key: key);

  @override
  _MedicalBackground5State createState() => _MedicalBackground5State();
}

class _MedicalBackground5State extends State<MedicalBackground5> {
  void _addMedicalCondition(String text) {
    if (text.isNotEmpty) {
      final medicalBackgroundProvider =
      context.read<MedicalBackGroundProvider>();

      // Check if the condition is not already added
      if (!medicalBackgroundProvider.selectedConditionsForPastMedicalConditions.contains(text)) {
        setState(() {
          medicalBackgroundProvider.selectedConditionsForPastMedicalConditions.add(text);
          medicalBackgroundProvider.medicalConditionControllerForPastMedicalConditions
              .clear(); // Clear input after adding
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final medicalBackgroundProvider =
        Provider.of<MedicalBackGroundProvider>(context);
    medicalBackgroundProvider.initContext(context: context);
    medicalBackgroundProvider.currentStep = 4;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Medical Background',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ProgressIndicatorWidget(
                currentStep: medicalBackgroundProvider.currentStep,
                totalSteps: 6),
            SizedBox(height: 50),
            Text(
              'Do you have any past medical conditions that might affect your health plan?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            YesNoButtonsWidget(
              selectedOption: medicalBackgroundProvider
                  .selectedOptionForPastMedicalConditions,
              onOptionSelected: (option) {
                setState(() {
                  medicalBackgroundProvider
                      .selectedOptionForPastMedicalConditions = option;
                });
              },
            ),
            Wrap(
              spacing: 8.0,
              children:
              medicalBackgroundProvider.selectedConditionsForPastMedicalConditions.map((condition) {
                return Chip(
                  label: Text(condition),
                  onDeleted: () {
                    setState(() {
                      medicalBackgroundProvider.selectedConditionsForPastMedicalConditions
                          .remove(condition);
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                TextField(
                  controller:
                  medicalBackgroundProvider.medicalConditionControllerForPastMedicalConditions,
                  onSubmitted: (text) {
                    _addMedicalCondition(text);
                  },
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  minLines: 4,
                  decoration: InputDecoration(
                    hintText:
                    'Enter any past medical conditions.',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 95, 132, 146),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
                Positioned(
                  right: 12,
                  bottom: 8,
                  child: Text(
                    "${medicalBackgroundProvider.selectedConditionsForPastMedicalConditions.length} Selected",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 30),
            // Stack(
            //   children: [
            //     GestureDetector(
            //       onTap: () => _focusOnTextField(),
            //       child: TextField(
            //         controller: medicalBackgroundProvider
            //             .medicalConditionControllerForPastMedicalConditions,
            //         onChanged: _onTextChanged,
            //         maxLines: 4,
            //         decoration: InputDecoration(
            //           hintText: 'Enter any past medical conditions.',
            //           hintStyle: TextStyle(
            //             fontSize: 12,
            //             color: Color.fromARGB(255, 95, 132, 146),
            //           ),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //           contentPadding: EdgeInsets.all(10),
            //           focusedBorder: OutlineInputBorder(
            //             borderSide: BorderSide(
            //               color: medicalBackgroundProvider
            //                       .isHighlightedForPastMedicalConditions
            //                   ? Colors.blue
            //                   : Colors.grey,
            //             ),
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //       right: 12,
            //       bottom: 8,
            //       child: Text(
            //         "${medicalBackgroundProvider.selectedConditionsForPastMedicalConditions.length} Selected",
            //         style: TextStyle(
            //           fontSize: 12,
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 10),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColors.primaryColor),
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (medicalBackgroundProvider.currentStep > 0) {
                        setState(() {
                          medicalBackgroundProvider.currentStep--;
                        });
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.medicalBackground4Screen,
                      );
                    },
                    child: Text(
                      'Previous',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      debugPrint(
                          "selectedOptionForPastMedicalConditions-->${medicalBackgroundProvider.selectedOptionForPastMedicalConditions}");

                      if (medicalBackgroundProvider
                              .selectedOptionForPastMedicalConditions ==
                          'Yes') {
                        if (medicalBackgroundProvider.selectedConditionsForPastMedicalConditions.isNotEmpty) {
                          debugPrint(
                              "selectedConditionsForPastMedicalConditions-->${medicalBackgroundProvider.selectedConditionsForPastMedicalConditions}");
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.medicalBackground6Screen);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Kindly enter your allergies.")),
                          );
                        }
                        debugPrint(
                            "selectedOptionForPastMedicalConditions-->${medicalBackgroundProvider.selectedOptionForPastMedicalConditions}");
                      } else {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.medicalBackground6Screen);
                      }

                      setState(() {
                        medicalBackgroundProvider.currentStep++;
                      });
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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

  void _onTextChanged(String text) {
    setState(() {
      if (text.isNotEmpty &&
          !context
              .read<MedicalBackGroundProvider>()
              .selectedConditionsForPastMedicalConditions
              .contains(text)) {
        context
            .read<MedicalBackGroundProvider>()
            .selectedConditionsForPastMedicalConditions
            .add(text);
      }
      context
          .read<MedicalBackGroundProvider>()
          .isHighlightedForPastMedicalConditions = true;
    });
  }

  void _focusOnTextField() {
    setState(() {
      context
          .read<MedicalBackGroundProvider>()
          .isHighlightedForPastMedicalConditions = true;
    });

    FocusScope.of(context).unfocus();
  }
}
