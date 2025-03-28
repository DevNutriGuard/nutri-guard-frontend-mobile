import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nutri_guard_mobile/network/api_service.dart';
import 'package:nutri_guard_mobile/res/toasts.dart';
import '../../../../../models/life_style_response.dart';
import '../../../../../network/api_url.dart';
import '../../../../../network/models.dart';

class LifestyleAndHabitProvider with ChangeNotifier {
  BuildContext? context;
  int currentStep = 0;
  String? selectedEnergyLevel;
  String? selectedWaterIntake;
  String? selectedSleepQuality;
  String? selectedDrugsValues;
  String? selectedStressValues;
  bool isHighlightedForHealthConcern = false;
  String? selectedHealthConcernOption;
  String healthConcerns = '';

  LifeStyleResponse lifeStyleResponse = LifeStyleResponse();

  initContext({context}) {
    this.context = context;
  }

  Future<bool> saveLifestyleData({
    required String profileId,
  }) async {
    try {
      Map<String, dynamic> body = {
        "energyLevelCode": selectedEnergyLevel,
        "waterIntakeCode": selectedWaterIntake,
        "sleepQualityCode": selectedSleepQuality,
        "substanceConsumptionCode": [selectedDrugsValues],
        "stressLevelCode": selectedStressValues,
        "profileId": profileId,
      };
      print("body-->$body");
      lifeStyleResponse = await MyApi.callPostApi(
        url: postLifestyleUrl,
        body: body,
        modelName: Models.lifeStyleResponse,
      );
      Toasts.getSuccessToast(text: lifeStyleResponse.data?.message);
      print("lifeStyleResponse-->${lifeStyleResponse.data?.message}");
      return true;
    } catch (e) {
      print("Exception occurred: $e");
      return false;
    }
  }
}
