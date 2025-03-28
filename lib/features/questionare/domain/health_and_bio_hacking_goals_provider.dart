import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/models/health_and_bio_hacking_response.dart';
import 'package:nutri_guard_mobile/network/api_service.dart';
import 'package:nutri_guard_mobile/res/toasts.dart';
import '../../../network/api_url.dart';
import '../../../network/models.dart';

class HealthAndBioHackingGoalsProvider extends ChangeNotifier {
  HealthAndBioHackingResponse healthAndBioHackingResponse  = HealthAndBioHackingResponse();
  BuildContext ?context;
  int currentStep = 0;
  String? selectedValueForSpecificAreasOfHealth;
  String? selectedValueForAnyBioHackingPractices;
  String? selectedValueForTrackingHealthPractices;
  String ?selectedValuesForImprovingYourHealth;



  initContext({context})
  {
    this.context=context;
  }

  Future<bool> saveBioHackingGoals({
    required String profileId,
  }) async {

    final body = {
      "healthOptimizationCode": [selectedValueForSpecificAreasOfHealth],
      // Allowed Codes:
      // "PE" - Physical Endurance: Improving physical endurance
      // "MC" - Mental Clarity: Enhancing mental clarity
      // "SQ" - Sleep Quality: Improving quality of sleep
      // "IS" - Immune Support: Boosting immune system health
      // "EL" - Energy Levels: Improving overall energy levels

      "biohackingPracticeCode": [selectedValueForAnyBioHackingPractices],
      // Allowed Codes:
      // "IF" - Intermittent Fasting: Fasting for certain periods
      // "CT" - Cold Therapy: Using cold exposure for health benefits
      // "MED" - Meditation: Practice of mindfulness and meditation
      // "NS" - Nutritional Supplements: Using supplements for health optimization
      // "NP" - No Preference: No specific biohacking preference

      "isHealthMetricTracking": selectedValueForTrackingHealthPractices=='yes'?true:false,
      "healthMotivationCode": [selectedValuesForImprovingYourHealth],
      // Allowed Codes:
      // "APG" - Achieving Personal Goals: Focus on personal achievements
      // "IDP" - Improving Daily Performance: Enhancing everyday performance
      // "LTW" - Long-Term Wellness: Focus on long-term health
      // "FPR" - Family or Personal Relationships: Maintaining healthy relationships

      "profileId": profileId
    }


    ;
    debugPrint("body: $body");

    try {
      healthAndBioHackingResponse = await MyApi.callPostApi(
          url: healthGoalUrl,
          body: body,
          modelName: Models.healthAndBioHackingResponse);

      if (healthAndBioHackingResponse.statusCode == 201) {
        print("healthAndBioHackingResponse: ${healthAndBioHackingResponse.statusCode}");
        Toasts.getSuccessToast(text: healthAndBioHackingResponse.data?.message);
        return true;
      } else {
        print("healthAndBioHackingResponse: ${healthAndBioHackingResponse.statusCode}");
        return false;

      }
    } catch (e) {
      print("Exception occurred in healthAndBioHackingResponse is: $e");
      return false;
    }
  }
}