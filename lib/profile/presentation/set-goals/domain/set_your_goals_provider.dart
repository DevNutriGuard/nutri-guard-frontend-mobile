import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:nutri_guard_mobile/models/save_goals_response_model.dart';
import 'package:nutri_guard_mobile/network/api_url.dart';
import '../../../../network/api_service.dart';
import '../../../../network/models.dart';

class SetYourGoalsProvider extends ChangeNotifier {
  BuildContext? context;
  String? selectGoalName;
  String? selectGoalType;
  String? reminderEnabledOfGoal;
  String? reminderTimeOfGoal;
  bool isReminderEnabled = false;

  SaveGoalsResponseModel saveGoalsResponseModel = SaveGoalsResponseModel();

  initContext({context}) {
    this.context = context;
  }

  Future<void> saveGoalsData({
    required String profileId,
    required bool reminderEnabled,
    required String reminderTime,
  }) async {
    try {
      Map<String, dynamic> body = {
        "goalName": selectGoalName,
        "goalType": selectGoalType,
        "reminderEnabled": reminderEnabled,
        "reminderTime": reminderTime,
        "profileId": profileId,
      };
      log("body-->$body");

      saveGoalsResponseModel = await MyApi.callPostApi(
        url: postGoalsUrl,
        body: body,
        modelName: Models.saveGoalsResponseModel,
      );

      log("lifeStyleResponse-->${saveGoalsResponseModel.data?.message}");
    } catch (e) {
      log("Exception occurred: $e");
    }
  }
}
