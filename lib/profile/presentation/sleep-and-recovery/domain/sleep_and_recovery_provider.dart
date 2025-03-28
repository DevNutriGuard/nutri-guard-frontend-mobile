import 'package:flutter/cupertino.dart';
import 'package:nutri_guard_mobile/models/sleep_and_recovery_response_model.dart';

import '../../../../network/api_service.dart';
import '../../../../network/api_url.dart';
import '../../../../network/models.dart';
import '../../../../res/loader.dart';
import '../../../../res/toasts.dart';

class SleepAndRecoveryProvider extends ChangeNotifier{
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  BuildContext ?buildContext;
  final Loader _loader = Loader();

  SleepAndRecoveryResponseModel sleepAndRecoveryResponseModel = SleepAndRecoveryResponseModel();



  Future<void> fetchSleepRecoveryData({
    required String profileId,
    required String startDate,
    required String endDate,
  }) async {
    _loader.showLoader(context: buildContext);


    try {
      Map<String, dynamic> body = {
        "startDate": startDate,
        "endDate": endDate,
        "profileId": profileId,
      };
      print("parameters OF CALORIES API-->$body");

      sleepAndRecoveryResponseModel = await MyApi.callGetApi(
        url: sleepRecoveryUrl, // Ensure this URL is defined in api_url.dart
        body: body,
        modelName: Models.sleepAndRecoveryResponseModel,
      );


      notifyListeners();

    } catch (e) {
      _loader.hideLoader(buildContext!);

      Toasts.getErrorToast(text: "Error fetching calories data: $e");
    }
  }
}