import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Report history fetched successfully","reportData":[]}

GetReportsHistoryResponseModel getReportsHistoryResponseModelFromJson(String str) => GetReportsHistoryResponseModel.fromJson(json.decode(str));
String getReportsHistoryResponseModelToJson(GetReportsHistoryResponseModel data) => json.encode(data.toJson());
class GetReportsHistoryResponseModel {
  GetReportsHistoryResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GetReportsHistoryResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GetReportsHistoryResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GetReportsHistoryResponseModel(  status: status ?? _status,
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

/// message : "Report history fetched successfully"
/// reportData : []

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      List<dynamic>? reportData,}){
    _message = message;
    _reportData = reportData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    if (json['reportData'] != null) {
      _reportData = [];
      json['reportData'].forEach((v) {
        // _reportData?.add(Dynamic.fromJson(v));
      });
    }
  }
  String? _message;
  List<dynamic>? _reportData;
Data copyWith({  String? message,
  List<dynamic>? reportData,
}) => Data(  message: message ?? _message,
  reportData: reportData ?? _reportData,
);
  String? get message => _message;
  List<dynamic>? get reportData => _reportData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_reportData != null) {
      map['reportData'] = _reportData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}