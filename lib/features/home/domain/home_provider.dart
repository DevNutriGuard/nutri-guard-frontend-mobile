import 'package:flutter/cupertino.dart';
import 'package:nutri_guard_mobile/res/loader.dart';
import '../../../models/get_calories_response_model.dart';
import '../../../models/get_readiness_data.dart';
import '../../../models/home_model_response.dart';
import '../../../models/home_response.dart';
import '../../../network/api_service.dart';
import '../../../network/api_url.dart';
import '../../../network/models.dart';

class HomeProvider extends ChangeNotifier {
  HomeModelResponse? homeDataResponse = HomeModelResponse();
  GetReadinessData? readinessData = GetReadinessData();
  GetCaloriesResponseModel? _caloriesResponse;

  String? _errorMessage;
  GetCaloriesResponseModel? get caloriesResponse => _caloriesResponse;
  String? get errorMessage => _errorMessage;
  BuildContext ?buildContext;
  final Loader _loader = Loader();

  initContext(BuildContext context){
    buildContext = context;
  }

  Future<void> fetchHomeData({
    required String profileId,
    required String startDate,
    required String endDate,
  }) async {
    // isLoading = true;
    // notifyListeners();

    try {
      _loader.showLoader(context: buildContext);

      Map<String, dynamic> body = {
        "startDate": startDate,
        "endDate": endDate,
        "profileId": profileId,
      };
      print("parameters OF HOME API-->$body");

      homeDataResponse = await MyApi.callGetApi(
        url: homeApiUrl,
        body: body,
        modelName: Models.homeModelResponse,
      );
      debugPrint("homeDataResponse OF HOME API-->${homeDataResponse?.statusCode}");

      _loader.hideLoader(buildContext!);

      notifyListeners();
    } catch (e) {
      debugPrint("exception OF HOME API-->$e");

      _loader.hideLoader(buildContext!);
      // Toasts.getErrorToast(text: "Error fetching home data: $e");
    }
  }

  Future<void> fetchReadinessData({
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
      print("parameters OF READINESS API-->$body");

      readinessData = await MyApi.callGetApi(
        url: getReadinessUrl, // Ensure this URL is defined in api_url.dart
        body: body,
        modelName: Models.getReadinessData,
      );
      _loader.hideLoader(buildContext!);

        notifyListeners();

    } catch (e) {
      _loader.hideLoader(buildContext!);

      // Toasts.getErrorToast(text: "Error fetching readiness data: $e");
    }
  }

  // Fetch calories data
  Future<void> fetchCaloriesData({
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

      _caloriesResponse = await MyApi.callGetApi(
        url: getCaloriesUrl, // Ensure this URL is defined in api_url.dart
        body: body,
        modelName: Models.getCaloriesResponseModel,
      );


        notifyListeners();

    } catch (e) {
      _loader.hideLoader(buildContext!);

      // Toasts.getErrorToast(text: "Error fetching calories data: $e");
    }
  }
}
