import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/models/get_daily_intakes_response_model.dart';
import 'package:nutri_guard_mobile/models/get_meal_types_response_model.dart';
import 'package:nutri_guard_mobile/models/get_nutrition_plan_response_model.dart';
import 'package:nutri_guard_mobile/network/api_url.dart';
import '../../../../network/api_service.dart';
import '../../../../network/models.dart';
import '../../../../res/loader.dart';

class NutritionProvider extends ChangeNotifier {
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  BuildContext? buildContext;
  final Loader _loader = Loader();
  GetNutritionPlanResponseModel getNutritionPlanResponseModel = GetNutritionPlanResponseModel();
  GetDailyIntakesResponseModel getDailyIntakeResponseModel = GetDailyIntakesResponseModel();
  GetMealTypesResponseModel getMealTypesResponseModel = GetMealTypesResponseModel();

  initContext(BuildContext context) {
    buildContext = context;
  }

  Future<void> getNutritionPlan({
    required String profileId,
    required String date,
  }) async {
    try {
      _loader.showLoader(context: buildContext);

      Map<String, dynamic> body = {
        "date": date,
        "profileId": profileId,
      };
      print("parameters OF Nutrition API-->$body");

      getNutritionPlanResponseModel = await MyApi.callGetApi(
        url: getNutritionPlanUrl,
        body: body,
        modelName: Models.getNutritionPlansResponseModel,
      );

      print("Nutrition Plan Response: ${getNutritionPlanResponseModel.toJson()}");

      _loader.hideLoader(buildContext!);
      notifyListeners();
    } catch (e) {
      _loader.hideLoader(buildContext!);
      _errorMessage = "Error fetching nutrition plan: $e";
      print("Error: $e"); // Log error
      notifyListeners();
    }
  }

  Future<void> getDailyIntake({
    required String profileId,
    required String date,
  }) async {
    try {
      _loader.showLoader(context: buildContext);

      Map<String, dynamic> body = {
        "date": date,
        "profileId": profileId,
      };
      print("parameters OF Daily Intake API-->$body");

      getDailyIntakeResponseModel = await MyApi.callGetApi(
        url: getDailyIntakesUrl,
        body: body,
        modelName: Models.getDailyIntakesResponseModel,
      );

      print("Daily Intake Response: ${getDailyIntakeResponseModel.toJson()}");

      _loader.hideLoader(buildContext!);
      notifyListeners();
    } catch (e) {
      _loader.hideLoader(buildContext!);
      _errorMessage = "Error fetching daily intake: $e";
      print("Error: $e"); // Log error
      notifyListeners();
    }
  }
  Future<void> getMealTypeData({
    required String profileId,
  }) async {
    try {
      _loader.showLoader(context: buildContext);

      Map<String, dynamic> body = {
        "profileId": profileId,
      };
      print("parameters OF Meal Data API-->$body");

      getDailyIntakeResponseModel = await MyApi.callGetApi(
        url: getMealTypesUrl,
        body: body,
        modelName: Models.getMealTypesResponseModel,
      );

      print("Meal Data Response: ${getDailyIntakeResponseModel.toJson()}");

      _loader.hideLoader(buildContext!);
      notifyListeners();
    } catch (e) {
      _loader.hideLoader(buildContext!);
      _errorMessage = "Error fetching Meal Data: $e";
      print("Error: $e"); // Log error
      notifyListeners();
    }
  }
}