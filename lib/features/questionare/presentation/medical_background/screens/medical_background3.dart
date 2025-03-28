// ignore_for_file: use_super_parameters, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/features/questionare/widgets/yes_no_buttons_widget.dart';
import 'package:nutri_guard_mobile/res/res_export.dart';
import 'package:nutri_guard_mobile/core/widgets/medication_dialog.dart';
import 'package:provider/provider.dart';
import 'package:nutri_guard_mobile/features/questionare/widgets/medication_list_widget.dart';

import '../../../domain/medical_background_provider.dart';

class MedicalBackground3 extends StatefulWidget {
  const MedicalBackground3({Key? key}) : super(key: key);

  @override
  _MedicalBackground3State createState() => _MedicalBackground3State();
}

class _MedicalBackground3State extends State<MedicalBackground3> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null) {
      setState(() {
        context.read<MedicalBackGroundProvider>().currentStep = args as int;
      });
    }
  }

  void showMedicationDialog(String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MedicationDialog(
          title: title,
          nameLabel: 'Supplements Name',
          dosageLabel: 'Dosage',
          frequencyLabel: 'Frequency',
          onSave: (medication) {
            setState(() {
              context
                  .read<MedicalBackGroundProvider>()
                  .vitaminsAndSupplements
                  .add(medication);
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final medicalBackgroundProvider =
        Provider.of<MedicalBackGroundProvider>(context);
    medicalBackgroundProvider.initContext(context: context);
    medicalBackgroundProvider.currentStep = 2;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Medical Background',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
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
                    'Do you take any vitamins or supplements?',
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
                        .selectedVitaminsAndSupplementsOptions,
                    onOptionSelected: (option) {
                      setState(() {
                        medicalBackgroundProvider
                            .selectedVitaminsAndSupplementsOptions = option;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  if (medicalBackgroundProvider
                      .vitaminsAndSupplements.isNotEmpty) ...[
                    MedicationListWidget(
                      medications:
                          medicalBackgroundProvider.vitaminsAndSupplements,
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          showMedicationDialog('Add Supplements');
                        },
                        child: Image.asset(
                          Assets.addIcon,
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                  ] else ...[
                    SizedBox(height: 100),
                    Image.asset(
                      Assets.medicalImage,
                      height: 80,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Tap the "+" icon to enter your supplements',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 100),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          showMedicationDialog('Add Supplements');
                        },
                        child: Image.asset(
                          Assets.addIcon,
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
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
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.medicalBackground2Screen);
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
                      if (medicalBackgroundProvider
                              .selectedVitaminsAndSupplementsOptions ==
                          'Yes') {
                        if (medicalBackgroundProvider
                            .vitaminsAndSupplements.isNotEmpty) {
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.medicalBackground4Screen);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "Kindly add your vitamins and supplements by tapping '+' button.")),
                          );
                        }
                      } else {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.medicalBackground4Screen);
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
          ),
        ],
      ),
    );
  }
}
