import 'package:flutter/cupertino.dart';
import 'package:nutri_guard_mobile/models/biohacking_response_model.dart';
import 'package:nutri_guard_mobile/models/sleep_and_recovery_response_model.dart';

import '../../../../network/api_service.dart';
import '../../../../network/api_url.dart';
import '../../../../network/models.dart';
import '../../../../res/loader.dart';
import '../../../../res/toasts.dart';

class BiohackingProvider extends ChangeNotifier {
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  BuildContext? buildContext;
  final Loader _loader = Loader();

  BiohackingResponseModel biohackingResponseModel = BiohackingResponseModel();

  Future<void> fetchBioHackingData({
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
      print("parameters OF BIOHACKING API-->$body");

      biohackingResponseModel = await MyApi.callGetApi(
        url: biohackingUrl,
        body: body,
        modelName: Models.biohackingResponseModel,
      );

      notifyListeners();
    } catch (e) {
      _loader.hideLoader(buildContext!);
      _errorMessage = "Error fetching biohacking data: $e";
      Toasts.getErrorToast(text: _errorMessage!);
    } finally {
      _loader.hideLoader(buildContext!);
    }
  }
}