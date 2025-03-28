import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/models/generate_report_response_model.dart';
import 'package:nutri_guard_mobile/network/api_url.dart';
import '../../../../models/get_reports_history_response_model.dart';
import '../../../../network/api_service.dart';
import '../../../../network/models.dart';
import '../../../../res/loader.dart';

class ReportProvider extends ChangeNotifier {
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  BuildContext? buildContext;
  final Loader _loader = Loader();
  GenerateReportResponseModel generateReportResponseModel = GenerateReportResponseModel();
  GetReportsHistoryResponseModel getReportsHistoryResponseModel = GetReportsHistoryResponseModel();

  initContext(BuildContext context) {
    buildContext = context;
  }

  Future<void> generateReport({
    required String profileId,
    required List<String> reportSections,
  }) async {
    if (buildContext == null) {
      print("Build context is null.");
      return; // Handle null context
    }

    if (profileId.isEmpty) {
      print("Profile ID is empty.");
      return; // Handle empty profile ID
    }

    try {
      _loader.showLoader(context: buildContext!);

      Map<String, dynamic> body = {
        "profileId": profileId,
        "reportSections": reportSections,
        "currentTimestamp": DateTime.now().toIso8601String(),
      };
      print("parameters OF Generate Report API-->$body");

      generateReportResponseModel = await MyApi.callPostApi(
        url: postGenerateReportUrl,
        body: body,
        modelName: Models.generateReportResponseModel,
      );

      print("Generate Report Response: ${generateReportResponseModel.toJson()}");

      _loader.hideLoader(buildContext!);
      notifyListeners();
    } catch (e) {
      _loader.hideLoader(buildContext!);
      _errorMessage = "Error generating report: $e";
      print("Error: $e");
      notifyListeners();
    }
  }
  Future<void> getReportHistory({
    required String profileId,
  }) async {
    try {
      _loader.showLoader(context: buildContext);

      Map<String, dynamic> body = {
        "profileId": profileId,
      };
      print("parameters OF Get Report History API-->$body");

      getReportsHistoryResponseModel = await MyApi.callGetApi(
        url: getReportsHistoryUrl, // Replace with your actual API endpoint
        body: body,
        modelName: Models.getReportHistoryResponseModel,
      );

      print("Get Report History Response: ${getReportsHistoryResponseModel.toJson()}"); // Log API response

      _loader.hideLoader(buildContext!);
      notifyListeners();
    } catch (e) {
      _loader.hideLoader(buildContext!);
      _errorMessage = "Error fetching report history: $e";
      print("Error: $e"); // Log error
      notifyListeners();
    }
  }
}