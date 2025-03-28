import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/scanner/food_scan_response.dart';
import '../../../../models/scanner/meal_scan_response.dart';
import '../../../../models/scanner/medicine_scan_response.dart';
import '../../../../models/scanner/supplement_scan_response.dart';

import '../../../../network/api_service.dart';
import '../../../../network/api_url.dart';
import '../../../../network/models.dart';
import '../../../../res/loader.dart';
import '../../../../res/strings.dart';
import '../../../../res/toasts.dart';
import '../../../../res/utils.dart';
import '../../nutrition/widgets/scan_options_modal.dart';

class ScannerProvider extends ChangeNotifier {
  final Loader _loader = Loader();

  FoodScanResponse foodScanResponse = FoodScanResponse();
  MealScanResponse mealScanResponse = MealScanResponse();
  SupplementScanResponse supplementScanResponse = SupplementScanResponse();
  MedicineScanResponse medicineScanResponse = MedicineScanResponse();

  BuildContext? context;

  final String profileId = PreferenceUtils.getString(Strings.profileId) ?? "";

  Future<void> init({required BuildContext context}) async {
    this.context = context;
  }

  Future<void> scanGenericApi({
    required String imagePath,
    required ScanType scanType,
    required BuildContext context,
  }) async {
    try {
      _loader.showLoader(context: context);

      final nowUtc = DateTime.now().toUtc();
      final String currentScanDate =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(nowUtc);

      final formData = FormData.fromMap({
        'profileId': profileId,
        'scanDate': currentScanDate,
        'file': await MultipartFile.fromFile(
          imagePath,
        ),
      });

      late String url;
      late dynamic modelName;

      switch (scanType) {
        case ScanType.meal:
          url = saveMealScanUrl;
          modelName = Models.mealScanModel;
          break;
        case ScanType.foodProduct:
          url = saveFoodScanUrl;
          modelName = Models.foodScanModel;
          break;
        case ScanType.medicine:
          url = saveMedicalScanUrl;
          modelName = Models.medicineScanModel;
          break;
        case ScanType.supplement:
          url = saveSupplementScanUrl;
          modelName = Models.supplementScanModel;
          break;
      }

      final baseResponse = await MyApi.callPostApi(
        url: url,
        body: formData,
        modelName: modelName,
      );

      switch (scanType) {
        case ScanType.meal:
          mealScanResponse = baseResponse as MealScanResponse;
          break;
        case ScanType.foodProduct:
          foodScanResponse = baseResponse as FoodScanResponse;
          break;
        case ScanType.medicine:
          medicineScanResponse = baseResponse as MedicineScanResponse;

          break;
        case ScanType.supplement:
          supplementScanResponse = baseResponse as SupplementScanResponse;
          break;
      }

      _loader.hideLoader(context);

      if (baseResponse.statusCode == 201 && baseResponse.data != null) {
        Toasts.getSuccessToast(text: baseResponse.status);
      } else {
        Toasts.getErrorToast(text: baseResponse.status);
      }
    } catch (err) {
      debugPrint("error during scan api is : $err");
      _loader.hideLoader(context);
    }
  }
}
