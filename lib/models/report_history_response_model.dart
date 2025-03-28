import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Report history fetched successfully","reportData":[{"reportUuid":"03be8022-7e2d-4fe7-99a1-96977be56f6b","reportGeneratedAt":"2026-01-07T00:04:48.000Z","reportName":"Personal Health Assessment Report","reportLink":"https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/reports/report-1-1737261826165.pdf"},{"reportUuid":"c40cea4e-7bc4-44a4-85f7-0835b6e5c6c6","reportGeneratedAt":"2026-01-07T00:04:48.000Z","reportName":"Personal Health and Fitness Report","reportLink":"https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/reports/report-1-1737482173850.pdf"},{"reportUuid":"4faf4d2a-8496-4827-80bb-715ca957638d","reportGeneratedAt":"2026-01-07T00:04:48.000Z","reportName":"Personal Wellness and Fitness Analysis Report","reportLink":"https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/reports/report-1-1737491166431.pdf"}]}

ReportHistoryResponseModel reportHistoryResponseModelFromJson(String str) => ReportHistoryResponseModel.fromJson(json.decode(str));
String reportHistoryResponseModelToJson(ReportHistoryResponseModel data) => json.encode(data.toJson());
class ReportHistoryResponseModel {
  ReportHistoryResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  ReportHistoryResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
ReportHistoryResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => ReportHistoryResponseModel(  status: status ?? _status,
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
/// reportData : [{"reportUuid":"03be8022-7e2d-4fe7-99a1-96977be56f6b","reportGeneratedAt":"2026-01-07T00:04:48.000Z","reportName":"Personal Health Assessment Report","reportLink":"https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/reports/report-1-1737261826165.pdf"},{"reportUuid":"c40cea4e-7bc4-44a4-85f7-0835b6e5c6c6","reportGeneratedAt":"2026-01-07T00:04:48.000Z","reportName":"Personal Health and Fitness Report","reportLink":"https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/reports/report-1-1737482173850.pdf"},{"reportUuid":"4faf4d2a-8496-4827-80bb-715ca957638d","reportGeneratedAt":"2026-01-07T00:04:48.000Z","reportName":"Personal Wellness and Fitness Analysis Report","reportLink":"https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/reports/report-1-1737491166431.pdf"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      List<ReportData>? reportData,}){
    _message = message;
    _reportData = reportData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    if (json['reportData'] != null) {
      _reportData = [];
      json['reportData'].forEach((v) {
        _reportData?.add(ReportData.fromJson(v));
      });
    }
  }
  String? _message;
  List<ReportData>? _reportData;
Data copyWith({  String? message,
  List<ReportData>? reportData,
}) => Data(  message: message ?? _message,
  reportData: reportData ?? _reportData,
);
  String? get message => _message;
  List<ReportData>? get reportData => _reportData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_reportData != null) {
      map['reportData'] = _reportData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// reportUuid : "03be8022-7e2d-4fe7-99a1-96977be56f6b"
/// reportGeneratedAt : "2026-01-07T00:04:48.000Z"
/// reportName : "Personal Health Assessment Report"
/// reportLink : "https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/reports/report-1-1737261826165.pdf"

ReportData reportDataFromJson(String str) => ReportData.fromJson(json.decode(str));
String reportDataToJson(ReportData data) => json.encode(data.toJson());
class ReportData {
  ReportData({
      String? reportUuid, 
      String? reportGeneratedAt, 
      String? reportName, 
      String? reportLink,}){
    _reportUuid = reportUuid;
    _reportGeneratedAt = reportGeneratedAt;
    _reportName = reportName;
    _reportLink = reportLink;
}

  ReportData.fromJson(dynamic json) {
    _reportUuid = json['reportUuid'];
    _reportGeneratedAt = json['reportGeneratedAt'];
    _reportName = json['reportName'];
    _reportLink = json['reportLink'];
  }
  String? _reportUuid;
  String? _reportGeneratedAt;
  String? _reportName;
  String? _reportLink;
ReportData copyWith({  String? reportUuid,
  String? reportGeneratedAt,
  String? reportName,
  String? reportLink,
}) => ReportData(  reportUuid: reportUuid ?? _reportUuid,
  reportGeneratedAt: reportGeneratedAt ?? _reportGeneratedAt,
  reportName: reportName ?? _reportName,
  reportLink: reportLink ?? _reportLink,
);
  String? get reportUuid => _reportUuid;
  String? get reportGeneratedAt => _reportGeneratedAt;
  String? get reportName => _reportName;
  String? get reportLink => _reportLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reportUuid'] = _reportUuid;
    map['reportGeneratedAt'] = _reportGeneratedAt;
    map['reportName'] = _reportName;
    map['reportLink'] = _reportLink;
    return map;
  }

}