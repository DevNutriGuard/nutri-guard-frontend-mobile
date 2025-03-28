// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/features/questionare/widgets/yes_no_buttons_widget.dart';
import 'package:provider/provider.dart';

import '../../../domain/medical_background_provider.dart';

class MedicalBackground4 extends StatefulWidget {
  const MedicalBackground4({Key? key}) : super(key: key);

  @override
  _MedicalBackground4State createState() => _MedicalBackground4State();
}

class _MedicalBackground4State extends State<MedicalBackground4> {
  @override
  Widget build(BuildContext context) {
    final medicalBackgroundProvider =
        Provider.of<MedicalBackGroundProvider>(context);
    medicalBackgroundProvider.initContext(context: context);
    medicalBackgroundProvider.currentStep = 3;
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
              'Do you have any known allergies?',
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
                  medicalBackgroundProvider.selectedOptionForAllergies,
              onOptionSelected: (option) {
                setState(() {
                  medicalBackgroundProvider.selectedOptionForAllergies = option;
                });
              },
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              children:
              medicalBackgroundProvider.selectedConditionsForAllergies.map((condition) {
                return Chip(
                  label: Text(condition),
                  onDeleted: () {
                    setState(() {
                      medicalBackgroundProvider.selectedConditionsForAllergies
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
                  medicalBackgroundProvider.medicalConditionControllerForAllergies,
                  onSubmitted: (text) {
                    _addMedicalCondition(text);
                  },
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  minLines: 4,
                  decoration: InputDecoration(
                    hintText:
                    'Enter any known allergies (if any)',
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
                    "${medicalBackgroundProvider.selectedConditionsForAllergies.length} Selected",
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
            //     TextField(
            //       controller: medicalBackgroundProvider
            //           .medicalConditionControllerForAllergies,
            //       onChanged: _onTextChanged,
            //       maxLines: 4,
            //       decoration: InputDecoration(
            //         hintText: 'Enter any known allergies (if any).',
            //         hintStyle: TextStyle(
            //           fontSize: 12,
            //           color: Color.fromARGB(255, 95, 132, 146),
            //         ),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //         contentPadding: EdgeInsets.all(10),
            //         focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(
            //             color:
            //                 medicalBackgroundProvider.isHighlightedForAllergies
            //                     ? Colors.blue
            //                     : Colors.grey,
            //           ),
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //       right: 12,
            //       bottom: 8,
            //       child: Text(
            //         "${medicalBackgroundProvider.selectedConditionsForAllergies.length} Selected",
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
                        AppRoutes.medicalBackground3Screen,
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
                      print(
                          "selectedConditionsForAllergies-->${medicalBackgroundProvider.selectedOptionForAllergies}");

                      if (medicalBackgroundProvider
                              .selectedOptionForAllergies ==
                          'Yes') {
                        if (medicalBackgroundProvider
                            .selectedConditionsForAllergies.isNotEmpty) {
                          debugPrint(
                              "selectedConditionsForAllergies-->${medicalBackgroundProvider.selectedConditionsForAllergies}");
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.medicalBackground5Screen);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Kindly enter your allergies.")),
                          );
                        }
                        print(
                            "selectedOption-->${medicalBackgroundProvider.selectedOption}");
                      } else {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.medicalBackground5Screen);
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
  void _addMedicalCondition(String text) {
    if (text.isNotEmpty) {
      final medicalBackgroundProvider =
      context.read<MedicalBackGroundProvider>();

      // Check if the condition is not already added
      if (!medicalBackgroundProvider.selectedConditionsForAllergies.contains(text)) {
        setState(() {
          medicalBackgroundProvider.selectedConditionsForAllergies.add(text);
          medicalBackgroundProvider.medicalConditionControllerForAllergies
              .clear(); // Clear input after adding
        });
      }
    }
  }

  void _onTextChanged(String text) {
    setState(() {
      if (text.isNotEmpty &&
          !context
              .read<MedicalBackGroundProvider>()
              .selectedConditionsForAllergies
              .contains(text)) {
        context
            .read<MedicalBackGroundProvider>()
            .selectedConditionsForAllergies
            .add(text);
      }
      context.read<MedicalBackGroundProvider>().isHighlightedForAllergies =
          true;
    });
  }

  void _focusOnTextField() {
    setState(() {
      context.read<MedicalBackGroundProvider>().isHighlightedForAllergies =
          true;
    });

    FocusScope.of(context).unfocus();
  }
}
