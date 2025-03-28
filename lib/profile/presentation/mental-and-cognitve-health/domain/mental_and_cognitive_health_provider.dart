import 'package:flutter/cupertino.dart';
import 'package:nutri_guard_mobile/models/mental_and_cognitive_health_response_model.dart';

import '../../../../network/api_service.dart';
import '../../../../network/api_url.dart';
import '../../../../network/models.dart';
import '../../../../res/loader.dart';
import '../../../../res/toasts.dart';

class MentalAndCognitiveHealthProvider extends ChangeNotifier{

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  BuildContext ?buildContext;
  final Loader _loader = Loader();

  MentalAndCognitiveHealthResponseModel mentalAndCognitiveHealthResponseModel = MentalAndCognitiveHealthResponseModel();



  Future<void> fetchMentalAndCognitiveHealthData({
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
      print("parameters of Mental and Cognitive Health  API-->$body");

      mentalAndCognitiveHealthResponseModel = await MyApi.callGetApi(
        url: mentalAndCognitiveHealthUrl,
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