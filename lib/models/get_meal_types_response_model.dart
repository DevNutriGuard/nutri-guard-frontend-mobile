import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Meal Types Data","mealTypesData":[{"mealPlans":[{"mealPlanUuid":"673f687f-eeae-44d9-9454-4a471c4b9eb4","meal":"Breakfast"},{"mealPlanUuid":"eabf7315-a453-4d8c-b5a0-9f1961ac579e","meal":"Snack"},{"mealPlanUuid":"8ca51df5-5516-4101-a510-8dc0c4e125fa","meal":"Lunch"},{"mealPlanUuid":"5ab7ba93-a619-40a9-99a0-f944566720b2","meal":"Snack"},{"mealPlanUuid":"0eac66e2-207b-49a8-8f39-979b55fb7090","meal":"Dinner"}]},{"mealPlans":[{"mealPlanUuid":"7136d83e-37b6-4d67-a301-0510fa60bd1f","meal":"Breakfast"},{"mealPlanUuid":"5dd17b45-3bc3-4d22-b981-0ed6ed37297b","meal":"Morning Snack"},{"mealPlanUuid":"26209550-09da-4ad1-8aa1-5d485357f633","meal":"Lunch"},{"mealPlanUuid":"dfbdf2f7-d64e-466a-b223-2832fe89e063","meal":"Afternoon Snack"},{"mealPlanUuid":"d97083bd-9891-451f-aea3-fae306e9c79f","meal":"Dinner"}]}]}

GetMealTypesResponseModel getMealTypesResponseModelFromJson(String str) => GetMealTypesResponseModel.fromJson(json.decode(str));
String getMealTypesResponseModelToJson(GetMealTypesResponseModel data) => json.encode(data.toJson());
class GetMealTypesResponseModel {
  GetMealTypesResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GetMealTypesResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GetMealTypesResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GetMealTypesResponseModel(  status: status ?? _status,
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

/// message : "Meal Types Data"
/// mealTypesData : [{"mealPlans":[{"mealPlanUuid":"673f687f-eeae-44d9-9454-4a471c4b9eb4","meal":"Breakfast"},{"mealPlanUuid":"eabf7315-a453-4d8c-b5a0-9f1961ac579e","meal":"Snack"},{"mealPlanUuid":"8ca51df5-5516-4101-a510-8dc0c4e125fa","meal":"Lunch"},{"mealPlanUuid":"5ab7ba93-a619-40a9-99a0-f944566720b2","meal":"Snack"},{"mealPlanUuid":"0eac66e2-207b-49a8-8f39-979b55fb7090","meal":"Dinner"}]},{"mealPlans":[{"mealPlanUuid":"7136d83e-37b6-4d67-a301-0510fa60bd1f","meal":"Breakfast"},{"mealPlanUuid":"5dd17b45-3bc3-4d22-b981-0ed6ed37297b","meal":"Morning Snack"},{"mealPlanUuid":"26209550-09da-4ad1-8aa1-5d485357f633","meal":"Lunch"},{"mealPlanUuid":"dfbdf2f7-d64e-466a-b223-2832fe89e063","meal":"Afternoon Snack"},{"mealPlanUuid":"d97083bd-9891-451f-aea3-fae306e9c79f","meal":"Dinner"}]}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      List<MealTypesData>? mealTypesData,}){
    _message = message;
    _mealTypesData = mealTypesData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    if (json['mealTypesData'] != null) {
      _mealTypesData = [];
      json['mealTypesData'].forEach((v) {
        _mealTypesData?.add(MealTypesData.fromJson(v));
      });
    }
  }
  String? _message;
  List<MealTypesData>? _mealTypesData;
Data copyWith({  String? message,
  List<MealTypesData>? mealTypesData,
}) => Data(  message: message ?? _message,
  mealTypesData: mealTypesData ?? _mealTypesData,
);
  String? get message => _message;
  List<MealTypesData>? get mealTypesData => _mealTypesData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_mealTypesData != null) {
      map['mealTypesData'] = _mealTypesData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// mealPlans : [{"mealPlanUuid":"673f687f-eeae-44d9-9454-4a471c4b9eb4","meal":"Breakfast"},{"mealPlanUuid":"eabf7315-a453-4d8c-b5a0-9f1961ac579e","meal":"Snack"},{"mealPlanUuid":"8ca51df5-5516-4101-a510-8dc0c4e125fa","meal":"Lunch"},{"mealPlanUuid":"5ab7ba93-a619-40a9-99a0-f944566720b2","meal":"Snack"},{"mealPlanUuid":"0eac66e2-207b-49a8-8f39-979b55fb7090","meal":"Dinner"}]

MealTypesData mealTypesDataFromJson(String str) => MealTypesData.fromJson(json.decode(str));
String mealTypesDataToJson(MealTypesData data) => json.encode(data.toJson());
class MealTypesData {
  MealTypesData({
      List<MealPlans>? mealPlans,}){
    _mealPlans = mealPlans;
}

  MealTypesData.fromJson(dynamic json) {
    if (json['mealPlans'] != null) {
      _mealPlans = [];
      json['mealPlans'].forEach((v) {
        _mealPlans?.add(MealPlans.fromJson(v));
      });
    }
  }
  List<MealPlans>? _mealPlans;
MealTypesData copyWith({  List<MealPlans>? mealPlans,
}) => MealTypesData(  mealPlans: mealPlans ?? _mealPlans,
);
  List<MealPlans>? get mealPlans => _mealPlans;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_mealPlans != null) {
      map['mealPlans'] = _mealPlans?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// mealPlanUuid : "673f687f-eeae-44d9-9454-4a471c4b9eb4"
/// meal : "Breakfast"

MealPlans mealPlansFromJson(String str) => MealPlans.fromJson(json.decode(str));
String mealPlansToJson(MealPlans data) => json.encode(data.toJson());
class MealPlans {
  MealPlans({
      String? mealPlanUuid, 
      String? meal,}){
    _mealPlanUuid = mealPlanUuid;
    _meal = meal;
}

  MealPlans.fromJson(dynamic json) {
    _mealPlanUuid = json['mealPlanUuid'];
    _meal = json['meal'];
  }
  String? _mealPlanUuid;
  String? _meal;
MealPlans copyWith({  String? mealPlanUuid,
  String? meal,
}) => MealPlans(  mealPlanUuid: mealPlanUuid ?? _mealPlanUuid,
  meal: meal ?? _meal,
);
  String? get mealPlanUuid => _mealPlanUuid;
  String? get meal => _meal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mealPlanUuid'] = _mealPlanUuid;
    map['meal'] = _meal;
    return map;
  }

}