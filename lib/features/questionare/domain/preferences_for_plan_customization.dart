import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/network/api_service.dart';
import 'package:nutri_guard_mobile/res/toasts.dart';
import '../../../models/preferences_for_plan_customization_model.dart';
import '../../../network/api_url.dart';
import '../../../network/models.dart';

class PreferencesForPlanCustomization extends ChangeNotifier {
  PreferencesForPlanCustomizationModel preferencesForPlanCustomizationModel  = PreferencesForPlanCustomizationModel();
  BuildContext ?context;
  String? selectedValueForTypeOfDiet;
  bool isHighlightedForTypeOfDiet = false;
  int currentStep = 0;
  List<String> selectedConditionsForFoodIntolerance = [];
  bool isHighlightedForFoodIntolerance = false;
  String? selectedOptionForFoodIntolerance;
  List<String> selectedConditionsForFoodIDislike = [];
  bool isHighlightedForFoodIDislike = false;
  String? selectedOptionForFoodIDislike = '';
  String? selectedValueForScreen2;
  String? selectedValueForScreen3;
  String? selectedValueForScreen4;
  String? selectedValueForScreen5;


  initContext({context})
  {
    this.context=context;
  }

  Future<bool> savePreferencesForPlanCustomization({
    required String profileId,
  }) async {

    final body = {
      "mealPreparationTimeCode": selectedValueForScreen2,
      // Allowed Codes:
      // "LT15" - Less Than 15 Minutes: Can dedicate less than 15 minutes
      // "15_30" - 15-30 Minutes: Can dedicate 15 to 30 minutes
      // "30_45" - 30-45 Minutes: Can dedicate 30 to 45 minutes
      // "MT45" - More Than 45 Minutes: Can dedicate more than 45 minutes

      "exerciseTimePreferenceCode": selectedValueForScreen3,
      // Allowed Codes:
      // "LT15" - Less Than 15 Minutes: Can dedicate less than 15 minutes to exercise
      // "15_30" - 15-30 Minutes: Can dedicate 15 to 30 minutes to exercise
      // "30_45" - 30-45 Minutes: Can dedicate 30 to 45 minutes to exercise
      // "MT45" - More Than 45 Minutes: Can dedicate more than 45 minutes to exercise

      "updateFrequencyPreferenceCode": selectedValueForScreen4,
      // Allowed Codes:
      // "DAILY" - Daily: Receive progress updates daily
      // "WEEKLY" - Weekly: Receive progress updates weekly
      // "BIWEEKLY" - Biweekly: Receive progress updates every two weeks
      // "MONTHLY" - Monthly: Receive progress updates monthly

      "reminderSettingCode": selectedValueForScreen5,
      // Allowed Codes:
      // "YES" - Yes: Set all reminders
      // "NO" - No: Do not set any reminders

      "profileId": profileId
      // Unique identifier for the user profile
    }

    ;
    print("body: $body");

    try {
      preferencesForPlanCustomizationModel = await MyApi.callPostApi(
          url: savePreferencesForPlanCustomizationUrl,
          body: body,
          modelName: Models.preferencesForPlanCustomizationModel);

      if (preferencesForPlanCustomizationModel.statusCode == 201) {
        print("dietAndNutritionResponse: ${preferencesForPlanCustomizationModel.statusCode}");
        Toasts.getSuccessToast(text: preferencesForPlanCustomizationModel.data?.message);
        return true;
      } else {
        print("dietAndNutritionResponse: ${preferencesForPlanCustomizationModel.statusCode}");
        return false;

      }
    } catch (e) {
      print("Exception occurred in dietAndNutritionResponse is: $e");
      return false;
    }
  }
}