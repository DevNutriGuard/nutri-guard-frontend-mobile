import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/fitness_and_physical_activity/screens/fitness_and_physical_actitvity_screen1.dart';
import 'package:nutri_guard_mobile/models/diet_and_nutrition_response.dart';
import 'package:nutri_guard_mobile/models/fitness_and_physical_activity_response.dart';
import 'package:nutri_guard_mobile/models/medical_history_response.dart';
import 'package:nutri_guard_mobile/network/api_service.dart';
import 'package:nutri_guard_mobile/res/toasts.dart';

import '../../../network/api_url.dart';
import '../../../network/models.dart';

class FitnessAndPhysicalActivityProvider extends ChangeNotifier {
  FitnessAndPhysicalActivityResponse fitnessAndPhysicalActivityResponse  = FitnessAndPhysicalActivityResponse();
  BuildContext ?context;
  int currentStep = 0;
  String? selectedValueForCurrentActivity;
  String? selectedValueForExercisePerWeek;
  String? selectedValueWorkoutsPreference;
  String? selectedValueFitnessGoals;
  String? selectedValueEquipmentExercise;
  String? selectedValueForBodyType;


  initContext({context})
  {
    this.context=context;
  }

  Future<bool> saveDietPreference({
    required String profileId,
  }) async {

    final body = {
      "activityLevelCode": selectedValueForCurrentActivity,
      "exerciseFrequencyCode": selectedValueForExercisePerWeek,
      "workoutPreferenceCode": [selectedValueWorkoutsPreference],
      "isAnyPhysicalLimitation": true,
      "physicalLimitation": ["Knee pain while running", "Lower back discomfort"],
      "fitnessGoalCode": selectedValueFitnessGoals,
      "equipmentPreferenceCode": selectedValueEquipmentExercise,
      "profileId": profileId
    }

    ;
    print("body: $body");

    try {
      fitnessAndPhysicalActivityResponse = await MyApi.callPostApi(
          url: workoutUrl,
          body: body,
          modelName: Models.fitnessAndPhysicalActivityResponse);

      if (fitnessAndPhysicalActivityResponse.statusCode == 201) {
        print("fitnessAndPhysicalActivityResponse: ${fitnessAndPhysicalActivityResponse.statusCode}");
        Toasts.getSuccessToast(text: fitnessAndPhysicalActivityResponse.data?.message);
        return true;
      } else {
        print("fitnessAndPhysicalActivityResponse: ${fitnessAndPhysicalActivityResponse.statusCode}");
        return false;

      }
    } catch (e) {
      print("Exception occurred in fitnessAndPhysicalActivityResponse is: $e");
      return false;
    }
  }
}