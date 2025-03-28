import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/network/refresh_token.dart';
import '../models/error_response.dart';
import '../res/strings.dart';
import '../res/toasts.dart';
import '../res/utils.dart';
import 'models.dart';

class MyApi {
  static Future<Map<String, dynamic>> confirmPayment({
    required String paymentMethodId,
    required String planCode,
    required int planPrice,
  }) async {
    try {
      var dio = Dio();
      const url = 'https://staging-api.nutri-guard.ai/v1/subscriptions/plans';
      final headers = {
        'Authorization': '${PreferenceUtils.getString(Strings.accessToken)}',
        'Content-Type': 'application/json',
      };
      final body = {
        'paymentMethodId': paymentMethodId,
        'planCode': planCode,
        'planPrice': planPrice,
      };

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        data: body,
      );

      if (response.statusCode == 200) {
        return response.data; // Return the server response
      } else {
        Toasts.getErrorToast(text: 'Failed to confirm payment: ${response.statusCode}');
        return {'success': false, 'error': 'Failed to confirm payment'};
      }
    } on DioException catch (e) {
      Toasts.getErrorToast(text: 'Payment failed: ${e.message}');
      return {'success': false, 'error': e.message};
    } catch (e) {
      Toasts.getErrorToast(text: 'Payment failed: $e');
      return {'success': false, 'error': e.toString()};
    }
  }

  static Future<dynamic> callPostApi(
      {String? url,
      dynamic body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      bool sendToken = true,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)==false) {
        Map<String, dynamic> header = {
          'Authorization': '${PreferenceUtils.getString(Strings.accessToken)}',
          "Content-Type": "application/json"
        };

        debugPrint("headers are : $header");
        Response response = await dio.post(url!,
            options: Options(headers: header),
            data: body,
            queryParameters: parameters);
        switch (response.statusCode) {
          case 200:
            dynamic modelObj =
                await Models.getModelObject(modelName, response.data);
            return modelObj;
          case 201:
            dynamic modelObj =
                await Models.getModelObject(modelName, response.data);
            return modelObj;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioException catch (ex) {
      if (ex.response != null) {
        debugPrint("error is post api---> : ${ex.response?.toString()}");
        debugPrint("error is post api : ${ex.response!.statusCode.toString()}");
        ErrorResponse errorResponse =
            await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            print("errorResponse-->${errorResponse.message}");
            if (errorResponse.message != null) {
              Toasts.getErrorToast(text: errorResponse.message);
            } else {
              Toasts.getErrorToast(text: errorResponse.message);
            }
          case 401:
            if (errorResponse.message != null) {
              Toasts.getErrorToast(text: errorResponse.message);
            } else {
              Toasts.getErrorToast(text: errorResponse.message);
            }
          // case 403:
          //   dynamic modelObj;
          //   await RefreshToken().onRefreshTokenApi().then((value) async {
          //     if (value) {
          //       Map<String, dynamic> header = {
          //         "Content-Type": "application/json",
          //         'Authorization': PreferenceUtils.getString(Strings.token)
          //       };
          //       modelObj = await callGetApi(
          //           parameters: parameters,
          //           modelName: modelName,
          //           url: url,
          //           myHeaders: header);
          //       return modelObj;
          //     }
          //   });
          //   return modelObj;

          case 404:
            if (errorResponse.message != null) {
              Toasts.getErrorToast(text: errorResponse.message);
            } else {
              Toasts.getErrorToast(text: errorResponse.message);
            }
            return null;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }

  static Future<dynamic> callPatchApi(
      {String? url,
        dynamic body,
        Map<String, dynamic>? parameters,
        Map<String, dynamic>? myHeaders,
        bool sendToken = true,
        dynamic modelName}) async {
    try {
      var dio = Dio();
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)==false) {
        Map<String, dynamic> header = {
          'Authorization': '${PreferenceUtils.getString(Strings.accessToken)}',
          "Content-Type": "application/json"
        };

        debugPrint("headers are : $header");
        Response response = await dio.patch(url!,
            options: Options(headers: header),
            data: body,
            queryParameters: parameters);
        switch (response.statusCode) {
          case 200:
            dynamic modelObj =
            await Models.getModelObject(modelName, response.data);
            return modelObj;
          case 201:
            dynamic modelObj =
            await Models.getModelObject(modelName, response.data);
            return modelObj;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioException catch (ex) {
      if (ex.response != null) {
        debugPrint("error is post api---> : ${ex.response?.toString()}");
        debugPrint("error is post api : ${ex.response!.statusCode.toString()}");
        ErrorResponse errorResponse =
        await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            print("errorResponse-->${errorResponse.message}");
            if (errorResponse.message != null) {
              Toasts.getErrorToast(text: errorResponse.message);
            } else {
              Toasts.getErrorToast(text: errorResponse.message);
            }
          case 401:
            if (errorResponse.message != null) {
              Toasts.getErrorToast(text: errorResponse.message);
            } else {
              Toasts.getErrorToast(text: errorResponse.message);
            }
        // case 403:
        //   dynamic modelObj;
        //   await RefreshToken().onRefreshTokenApi().then((value) async {
        //     if (value) {
        //       Map<String, dynamic> header = {
        //         "Content-Type": "application/json",
        //         'Authorization': PreferenceUtils.getString(Strings.token)
        //       };
        //       modelObj = await callGetApi(
        //           parameters: parameters,
        //           modelName: modelName,
        //           url: url,
        //           myHeaders: header);
        //       return modelObj;
        //     }
        //   });
        //   return modelObj;

          case 404:
            if (errorResponse.message != null) {
              Toasts.getErrorToast(text: errorResponse.message);
            } else {
              Toasts.getErrorToast(text: errorResponse.message);
            }
            return null;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }

  static Future<dynamic> callGetApi({
    String? url,
    dynamic body,

    Map<String, dynamic>? parameters,
    Map<String, dynamic>? myHeaders,
    dynamic modelName,
    final provider,
    bool? hideBadRequestToast,
  }) async {
    try {
      var dio = Dio();
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)==false) {
        Map<String, dynamic> header = {
          "Content-Type": "application/json",
          'Authorization': '${PreferenceUtils.getString(Strings.accessToken)}'
        };
        debugPrint("$header   ${PreferenceUtils.getString(Strings.accessToken)}");
        Response response = await dio.get(url!, options: Options(headers: header),
            data: body,
            queryParameters: parameters);
        switch (response.statusCode) {
          case 200:
            // debugPrint('Case 200 Come===> ${response.data}');
            dynamic getModelObj =
                await Models.getModelObject(modelName, response.data);
            return getModelObj;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: "No internet");
        return null;
      }
    } on DioException catch (ex) {
      if (ex.response != null) {
        debugPrint("ex.response-->${ex.response}");
        debugPrint("ex.response-->${ex.response?.statusMessage}");
        debugPrint("ex.response-->${ex.response?.data}");
        debugPrint("ex.response-->${ex.response!.statusCode}");
        switch (ex.response!.statusCode) {
          case 400:
            return;
          case 401:
            debugPrint(
                "case 401--> PreferenceUtils.getString(Strings.refreshToken)");
            debugPrint(
                "PreferenceUtils.getString(Strings.refreshToken) ${PreferenceUtils.getString(Strings.refreshToken)}");
            dynamic modelObj;
            await RefreshToken().onRefreshTokenApi().then((value) async {
              if (value) {
                Map<String, dynamic> header = {
                  "Content-Type": "application/json",
                  'Authorization': PreferenceUtils.getString(Strings.accessToken)
                };
                modelObj = await callGetApi(
                    parameters: parameters,
                    modelName: modelName,
                    url: url,
                    myHeaders: header);
                return modelObj;
              }
            });
            return modelObj;
          case 403:
            dynamic modelObj;
            await RefreshToken().onRefreshTokenApi().then((value) async {
              if (value) {
                Map<String, dynamic> header = {
                  "Content-Type": "application/json",
                  'Authorization': PreferenceUtils.getString(Strings.accessToken)
                };
                modelObj = await callGetApi(
                    parameters: parameters,
                    modelName: modelName,
                    url: url,
                    myHeaders: header);
                return modelObj;
              }
            });
            return modelObj;
          case 404:
            return ;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return;
    }
  }

  static Future<dynamic> callPutApiImage(
      {String? url,
      dynamic body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)==false) {
        Response response = await dio.put(url!,
            options: Options(headers: myHeaders),
            data: body,
            queryParameters: parameters);
        switch (response.statusCode) {
          case 200:
            dynamic modelObj = await Models.getModelObject(modelName, response.data);
            return modelObj;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioException catch (ex) {
      if (ex.response != null) {
        debugPrint("error in put api-----------> ${ex.message}");
        ErrorResponse errorResponse =
            await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.message);
            return null;
          case 401:
            dynamic modelObj;
            await RefreshToken().onRefreshTokenApi().then((value) async {
              if (value) {
                Map<String, dynamic> header = {
                  "Content-Type": "application/json",
                  'Authorization': PreferenceUtils.getString(Strings.accessToken)
                };
                modelObj = await callGetApi(
                    parameters: parameters,
                    modelName: modelName,
                    url: url,
                    myHeaders: header);
                return modelObj;
              }
            });
            return modelObj;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }

  static Future<dynamic> callPutApi(
      {String? url,
      dynamic body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)==false) {
        Map<String, dynamic> header = {
          "Content-Type": "application/json",
          'Authorization': '${PreferenceUtils.getString(Strings.accessToken)}'
        };
        Response response = await dio.put(url!,
            options: Options(headers: header),
            data: body,
            queryParameters: parameters);
        switch (response.statusCode) {
          case 200:
            dynamic modelObj = await Models.getModelObject(modelName, response.data);
            return modelObj;
          case 201:
            dynamic modelObj =
                await Models.getModelObject(modelName, response.data);
            return modelObj;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioException catch (ex) {
      if (ex.response?.data != null) {
        debugPrint("error in put api-----------> ${ex.response?.statusCode}");
        ErrorResponse errorResponse =
            await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            if (errorResponse.message != null) {
              Toasts.getErrorToast(text: errorResponse.message);
            } else {
              Toasts.getErrorToast(text: ex.response?.data["message"]);
            }
            return null;
          case 401:
            dynamic modelObj;
            await RefreshToken().onRefreshTokenApi().then((value) async {
              if (value) {
                Map<String, dynamic> header = {
                  "Content-Type": "application/json",
                  'Authorization': PreferenceUtils.getString(Strings.accessToken)
                };
                modelObj = await callGetApi(
                    parameters: parameters,
                    modelName: modelName,
                    url: url,
                    myHeaders: header);
                return modelObj;
              }
            });
            return modelObj;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }

  static Future<dynamic> callDeleteApi(
      {String? url,
      dynamic body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)==false) {
        Map<String, dynamic> header = {
          "Content-Type": "application/json",
          'Authorization': '${PreferenceUtils.getString(Strings.accessToken)}'
        };
        Response response = await dio.delete(url!,
            options: Options(headers: header),
            queryParameters: parameters);
        switch (response.statusCode) {
          case 200:
            dynamic modelObj =
                await Models.getModelObject(modelName, response.data);
            return modelObj;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioException catch (ex) {
      if (ex.response != null) {
        debugPrint("status Code==>${ex.response?.statusCode}");
        ErrorResponse errorResponse =
            await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.message);
            return null;
          case 401:
            dynamic modelObj;
            await RefreshToken().onRefreshTokenApi().then((value) async {
              if (value) {
                Map<String, dynamic> header = {
                  "Content-Type": "application/json",
                  'Authorization': PreferenceUtils.getString(Strings.accessToken)
                };
                modelObj = await callGetApi(
                    parameters: parameters,
                    modelName: modelName,
                    url: url,
                    myHeaders: header);
                return modelObj;
              }
            });
            return modelObj;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }

}
