import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Daily Intakes Data","dailyIntakesData":{"dailyIntakeTrackerUuid":"d1ccb6df-3a19-49f0-8240-94f7ea3a5221","alcohol":0,"caffeine":0,"nicotine":0,"water":0,"intakeDate":"2025-01-20T02:36:41.000Z"}}

GetDailyIntakesResponseModel getDailyIntakesResponseModelFromJson(String str) => GetDailyIntakesResponseModel.fromJson(json.decode(str));
String getDailyIntakesResponseModelToJson(GetDailyIntakesResponseModel data) => json.encode(data.toJson());
class GetDailyIntakesResponseModel {
  GetDailyIntakesResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GetDailyIntakesResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GetDailyIntakesResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GetDailyIntakesResponseModel(  status: status ?? _status,
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

/// message : "Daily Intakes Data"
/// dailyIntakesData : {"dailyIntakeTrackerUuid":"d1ccb6df-3a19-49f0-8240-94f7ea3a5221","alcohol":0,"caffeine":0,"nicotine":0,"water":0,"intakeDate":"2025-01-20T02:36:41.000Z"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      DailyIntakesData? dailyIntakesData,}){
    _message = message;
    _dailyIntakesData = dailyIntakesData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _dailyIntakesData = json['dailyIntakesData'] != null ? DailyIntakesData.fromJson(json['dailyIntakesData']) : null;
  }
  String? _message;
  DailyIntakesData? _dailyIntakesData;
Data copyWith({  String? message,
  DailyIntakesData? dailyIntakesData,
}) => Data(  message: message ?? _message,
  dailyIntakesData: dailyIntakesData ?? _dailyIntakesData,
);
  String? get message => _message;
  DailyIntakesData? get dailyIntakesData => _dailyIntakesData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_dailyIntakesData != null) {
      map['dailyIntakesData'] = _dailyIntakesData?.toJson();
    }
    return map;
  }

}

/// dailyIntakeTrackerUuid : "d1ccb6df-3a19-49f0-8240-94f7ea3a5221"
/// alcohol : 0
/// caffeine : 0
/// nicotine : 0
/// water : 0
/// intakeDate : "2025-01-20T02:36:41.000Z"

DailyIntakesData dailyIntakesDataFromJson(String str) => DailyIntakesData.fromJson(json.decode(str));
String dailyIntakesDataToJson(DailyIntakesData data) => json.encode(data.toJson());
class DailyIntakesData {
  DailyIntakesData({
      String? dailyIntakeTrackerUuid, 
      int? alcohol, 
      int? caffeine, 
      int? nicotine, 
      int? water, 
      String? intakeDate,}){
    _dailyIntakeTrackerUuid = dailyIntakeTrackerUuid;
    _alcohol = alcohol;
    _caffeine = caffeine;
    _nicotine = nicotine;
    _water = water;
    _intakeDate = intakeDate;
}

  DailyIntakesData.fromJson(dynamic json) {
    _dailyIntakeTrackerUuid = json['dailyIntakeTrackerUuid'];
    _alcohol = json['alcohol'];
    _caffeine = json['caffeine'];
    _nicotine = json['nicotine'];
    _water = json['water'];
    _intakeDate = json['intakeDate'];
  }
  String? _dailyIntakeTrackerUuid;
  int? _alcohol;
  int? _caffeine;
  int? _nicotine;
  int? _water;
  String? _intakeDate;
DailyIntakesData copyWith({  String? dailyIntakeTrackerUuid,
  int? alcohol,
  int? caffeine,
  int? nicotine,
  int? water,
  String? intakeDate,
}) => DailyIntakesData(  dailyIntakeTrackerUuid: dailyIntakeTrackerUuid ?? _dailyIntakeTrackerUuid,
  alcohol: alcohol ?? _alcohol,
  caffeine: caffeine ?? _caffeine,
  nicotine: nicotine ?? _nicotine,
  water: water ?? _water,
  intakeDate: intakeDate ?? _intakeDate,
);
  String? get dailyIntakeTrackerUuid => _dailyIntakeTrackerUuid;
  int? get alcohol => _alcohol;
  int? get caffeine => _caffeine;
  int? get nicotine => _nicotine;
  int? get water => _water;
  String? get intakeDate => _intakeDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dailyIntakeTrackerUuid'] = _dailyIntakeTrackerUuid;
    map['alcohol'] = _alcohol;
    map['caffeine'] = _caffeine;
    map['nicotine'] = _nicotine;
    map['water'] = _water;
    map['intakeDate'] = _intakeDate;
    return map;
  }

}