import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
import 'package:nutri_guard_mobile/profile/presentation/set-goals/domain/set_your_goals_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/set-goals/widgets/set_goals_add_cards_widgets.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/app_routes.dart';

class SetGoalsScreen2 extends StatefulWidget {
  final String? profileId;
  const SetGoalsScreen2({super.key, this.profileId});

  @override
  SetGoalsScreen2State createState() => SetGoalsScreen2State();
}

class SetGoalsScreen2State extends State<SetGoalsScreen2> {
  TextEditingController medicationController = TextEditingController();
  TextEditingController supplementController = TextEditingController();
  TextEditingController reminderTimeController = TextEditingController();
  bool _isReminderOn = false;
  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    medicationController.dispose();
    supplementController.dispose();
    reminderTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final setYourGoalsProvider = Provider.of<SetYourGoalsProvider>(context);
    setYourGoalsProvider.initContext(context:context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          onBackPressed: (){
            Navigator.pop(context);
          },
        trailingIconAsset: Assets.calendar,
        title: "Set your Goals",
        onTrailingIconPressed: (){},
        backgroundColor: AppColors.whiteColor,
        backButtonColor: AppColors.greyColor,

      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SetGoalsAddCardsWidget(
                    addTitle: 'Add Medication',
                    title: 'Get Medication',
                    icon: Assets.medicationIntakeSummary,
                    subtitle: 'Today, 9:41 pm',
                    fields: [
                      FieldConfig(
                          name: medicationController.text,
                          label: 'Medication Name',
                          type: FieldType.input),
                      FieldConfig(
                          name: reminderTimeController.text,
                          label: 'Date & Time',
                          type: FieldType.date),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SetGoalsAddCardsWidget(
                    addTitle: 'Add Supplement',
                    title: 'Get Supplement',
                    icon: Assets.supplement,
                    subtitle: 'Today, 9:41 pm',
                    fields: [
                      FieldConfig(
                          name: medicationController.text,
                          label: 'Supplement Name',
                          type: FieldType.input),
                      FieldConfig(
                          name: reminderTimeController.text,
                          label: 'Date & Time',
                          type: FieldType.date),
                    ],
                  ),
                  SizedBox(height: 10),
                  SetGoalsAddCardsWidget(
                    addTitle: 'Add Sleep',
                    title: 'Get in bed',
                    icon: Assets.sleepGoal,
                    subtitle: 'Today, 9:41 pm',
                    fields: [
                      FieldConfig(
                          name: reminderTimeController.text,
                          label: 'Date & Time',
                          type: FieldType.date),
                    ],
                  ),
                  SizedBox(height: 10),
                  SetGoalsAddCardsWidget(
                    addTitle: 'Add Hydration',
                    title: 'Hydration Reminder',
                    icon: Assets.hydrationGoal,
                    subtitle: 'Today, 9:41 pm',
                    fields: [
                      FieldConfig(
                          name: reminderTimeController.text,
                          label: 'Date & Time',
                          type: FieldType.date),
                    ],
                  ),
                  SizedBox(height: 10),
                  SetGoalsAddCardsWidget(
                    addTitle: 'Add Nutrition',
                    title: 'Nutrition',
                    icon: Assets.nutrition,
                    subtitle: 'Today, 9:41 pm',
                    fields: [
                      FieldConfig(
                          name: medicationController.text,
                          label: 'Type',
                          type: FieldType.input),
                      FieldConfig(
                          name: medicationController.text,
                          label: 'Quantity',
                          type: FieldType.input),
                      FieldConfig(
                          name: medicationController.text,
                          label: 'Unit',
                          type: FieldType.input),
                      FieldConfig(
                          name: reminderTimeController.text,
                          label: 'Date & Time',
                          type: FieldType.date),
                    ],
                  ),
                  SizedBox(height: 10),
                  SetGoalsAddCardsWidget(
                    addTitle: 'Fitness Goal Type',
                    title: 'Fitness Goal',
                    icon: Assets.fitness,
                    subtitle: 'Today, 9:41 pm',
                    fields: [
                      FieldConfig(
                          name: medicationController.text,
                          label: 'Fitness Type',
                          type: FieldType.input),
                      FieldConfig(
                          name: medicationController.text,
                          label: 'Target Value',
                          type: FieldType.input),
                      FieldConfig(
                          name: reminderTimeController.text,
                          label: 'Date & Time',
                          type: FieldType.date),
                    ],
                  ),
                  SizedBox(height: 10),
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
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
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
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      String reminderTime = reminderTimeController.text;
                      setYourGoalsProvider.saveGoalsData(
                        profileId: widget.profileId!,
                        reminderEnabled: _isReminderOn,
                        reminderTime: reminderTime.isNotEmpty ? reminderTime : DateTime.now().toIso8601String(),
                      );

                      if (setYourGoalsProvider.saveGoalsResponseModel.status == 'success') {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.setGoalsScreen1,
                          arguments: setYourGoalsProvider.saveGoalsResponseModel,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving goals')));
                      }
                    },
                    child: Text(
                      'Save',
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
