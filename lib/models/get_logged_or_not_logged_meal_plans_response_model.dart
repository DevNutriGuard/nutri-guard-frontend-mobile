import 'dart:convert';
import 'dart:ffi';

import 'package:nutri_guard_mobile/models/get_all_meal_plans_response_model.dart';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Nutrition Plan Data","mealPlanData":[]}

GetLoggedOrNotLoggedMealPlansResponseModel getLoggedOrNotLoggedMealPlansResponseModelFromJson(String str) => GetLoggedOrNotLoggedMealPlansResponseModel.fromJson(json.decode(str));
String getLoggedOrNotLoggedMealPlansResponseModelToJson(GetLoggedOrNotLoggedMealPlansResponseModel data) => json.encode(data.toJson());
class GetLoggedOrNotLoggedMealPlansResponseModel {
  GetLoggedOrNotLoggedMealPlansResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GetLoggedOrNotLoggedMealPlansResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GetLoggedOrNotLoggedMealPlansResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GetLoggedOrNotLoggedMealPlansResponseModel(  status: status ?? _status,
  statusCode: statusCode ?? _statusCode,
  data: data ?? _data,
);
  String? get status => _status;
  int? get statusCode => _statusCode;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['statusCode'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// message : "Nutrition Plan Data"
/// mealPlanData : []

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      List<dynamic>? mealPlanData,}){
    _message = message;
    _mealPlanData = mealPlanData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    if (json['mealPlanData'] != null) {
      _mealPlanData = [];
      json['mealPlanData'].forEach((v) {
        _mealPlanData?.add(MealPlanData.fromJson(v));
      });
    }
  }
  String? _message;
  List<dynamic>? _mealPlanData;
Data copyWith({  String? message,
  List<dynamic>? mealPlanData,
}) => Data(  message: message ?? _message,
  mealPlanData: mealPlanData ?? _mealPlanData,
);
  String? get message => _message;
  List<dynamic>? get mealPlanData => _mealPlanData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_mealPlanData != null) {
      map['mealPlanData'] = _mealPlanData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}