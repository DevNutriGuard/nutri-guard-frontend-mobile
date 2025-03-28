// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/features/questionare/widgets/yes_no_buttons_widget.dart';
import 'package:nutri_guard_mobile/res/utils.dart';
import 'package:provider/provider.dart';

import '../../../domain/medical_background_provider.dart';

class MedicalBackground6 extends StatefulWidget {
  const MedicalBackground6({Key? key}) : super(key: key);

  @override
  _MedicalBackground6State createState() => _MedicalBackground6State();
}

class _MedicalBackground6State extends State<MedicalBackground6> {
  void _addMedicalCondition(String text) {
    if (text.isNotEmpty) {
      final medicalBackgroundProvider =
      context.read<MedicalBackGroundProvider>();

      // Check if the condition is not already added
      if (!medicalBackgroundProvider.selectedConditionsForHealthConcern.contains(text)) {
        setState(() {
          medicalBackgroundProvider.selectedConditionsForHealthConcern.add(text);
          medicalBackgroundProvider.medicalConditionControllerForHealthConcern
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
    medicalBackgroundProvider.currentStep = 5;
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
                fontSize: 24,
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
              'Do you have any specific health concerns or symptoms you would like to address?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            YesNoButtonsWidget(
              selectedOption:
                  medicalBackgroundProvider.selectedOptionForHealthConcern,
              onOptionSelected: (option) {
                setState(() {
                  medicalBackgroundProvider.selectedOptionForHealthConcern =
                      option;
                });
              },
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              children:
              medicalBackgroundProvider.selectedConditionsForHealthConcern.map((condition) {
                return Chip(
                  label: Text(condition),
                  onDeleted: () {
                    setState(() {
                      medicalBackgroundProvider.selectedConditionsForHealthConcern
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
                  medicalBackgroundProvider.medicalConditionControllerForHealthConcern,
                  onSubmitted: (text) {
                    _addMedicalCondition(text);
                  },
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  minLines: 4,
                  decoration: InputDecoration(
                    hintText:
                    'Enter any specific health concerns or symptoms.',
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
                    "${medicalBackgroundProvider.selectedConditionsForHealthConcern.length} Selected",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 10),
            // SizedBox(
            //   height: 20,
            // ),
            // Stack(
            //   children: [
            //     GestureDetector(
            //       onTap: () => _focusOnTextField(),
            //       child: TextField(
            //         controller: medicalBackgroundProvider
            //             .medicalConditionControllerForHealthConcern,
            //         onChanged: _onTextChanged,
            //         maxLines: 4,
            //         decoration: InputDecoration(
            //           hintText:
            //               'Enter any specific health concerns or symptoms.',
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
            //                       .isHighlightedForHealthConcern
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
            //         "${medicalBackgroundProvider.selectedConditionsForHealthConcern.length} Selected",
            //         style: TextStyle(
            //           fontSize: 12,
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 10),
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
                        AppRoutes.medicalBackground5Screen,
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
                    onPressed: () async {
                      // Navigator.pushReplacementNamed(context, AppRoutes.lifestyleScreen1);

                      String profileId =
                          await PreferenceUtils.getProfileId() ?? "";
                      debugPrint(
                          "selectedOptionForHealthConcern-->${medicalBackgroundProvider.selectedOptionForHealthConcern}");

                      if (medicalBackgroundProvider
                              .selectedOptionForHealthConcern ==
                          'Yes') {
                        if (medicalBackgroundProvider.selectedConditionsForHealthConcern.isNotEmpty) {
                          debugPrint(
                              "selectedConditionsForHealthConcern-->${medicalBackgroundProvider.selectedConditionsForHealthConcern}");
                          debugPrint(
                              "medicalConditionControllerForHealthConcern-->${medicalBackgroundProvider.medicalConditionControllerForHealthConcern.text}");
                          medicalBackgroundProvider
                              .saveMedicalBackground(profileId: profileId)
                              .then((value) {
                            if (value) {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.lifestyleScreen1);
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text("Kindly enter your health concerns.")),
                          );
                        }

                        debugPrint(
                            "selectedOptionForHealthConcern-->${medicalBackgroundProvider.selectedOptionForHealthConcern}");
                      } else {
                        medicalBackgroundProvider
                            .saveMedicalBackground(profileId: profileId)
                            .then((value) {
                          if (value) {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.lifestyleScreen1);
                          }
                        });
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
              .selectedConditionsForHealthConcern
              .contains(text)) {
        context
            .read<MedicalBackGroundProvider>()
            .selectedConditionsForHealthConcern
            .add(text);
      }
      context.read<MedicalBackGroundProvider>().isHighlightedForHealthConcern =
          true;
    });
  }

  void _focusOnTextField() {
    setState(() {
      context.read<MedicalBackGroundProvider>().isHighlightedForHealthConcern =
          true;
    });

    FocusScope.of(context).unfocus();
  }
}
