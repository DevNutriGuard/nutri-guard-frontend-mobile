import 'package:flutter/cupertino.dart';
import 'package:nutri_guard_mobile/models/medicine_and_supplment_response_model.dart';
import '../../../../network/api_service.dart';
import '../../../../network/api_url.dart';
import '../../../../network/models.dart';
import '../../../../res/loader.dart';
import '../../../../res/toasts.dart';

class MedicineAndSupplementProvider extends ChangeNotifier {
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  BuildContext? buildContext;
  final Loader _loader = Loader();

  MedicineAndSupplmentResponseModel medicineAndSupplmentResponseModel = MedicineAndSupplmentResponseModel();

  Future<void> fetchMedicineAndSupplementData({
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
      print("parameters OF MEDICINE API-->$body");

      medicineAndSupplmentResponseModel = await MyApi.callGetApi(
        url: medicineAndSupplementUrl,
        body: body,
        modelName: Models.medicineAndSupplmentResponseModel,
      );

      notifyListeners();
    } catch (e) {
      _loader.hideLoader(buildContext!);
      _errorMessage = "Error fetching medicine and supplement data: $e";
      Toasts.getErrorToast(text: _errorMessage!);
    } finally {
      _loader.hideLoader(buildContext!);
    }
  }
}