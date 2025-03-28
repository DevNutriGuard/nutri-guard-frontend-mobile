import 'package:flutter/cupertino.dart';
import 'package:nutri_guard_mobile/models/long_term_health_response_model.dart';
import 'package:nutri_guard_mobile/network/api_url.dart';
import '../../../../network/api_service.dart';
import '../../../../network/models.dart';
import '../../../../res/loader.dart';
import '../../../../res/toasts.dart';

class LongTermHealthProvider extends ChangeNotifier {
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  BuildContext? buildContext;
  final Loader _loader = Loader();
  initContext(BuildContext context){
    buildContext = context;
  }

  LongTermHealthResponseModel longTermHealthResponseModel = LongTermHealthResponseModel();

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

      longTermHealthResponseModel = await MyApi.callGetApi(
        url: getLongTermHealthUrl,
        body: body,
        modelName: Models.longTermHealthResponseModel,
      );

      notifyListeners();
    } catch (e) {
      _loader.hideLoader(buildContext!);
      Toasts.getErrorToast(text: "Error fetching long-term health data: $e");
    }
  }
}
