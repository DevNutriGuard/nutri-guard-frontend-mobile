import 'dart:convert';
/// status : "success"
/// statusCode : 201
/// data : {"message":"Report generated successfully","reportData":{"s3Link":"https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/reports/report-1-1738877186353.pdf"}}

GenerateReportResponseModel generateReportResponseModelFromJson(String str) => GenerateReportResponseModel.fromJson(json.decode(str));
String generateReportResponseModelToJson(GenerateReportResponseModel data) => json.encode(data.toJson());
class GenerateReportResponseModel {
  GenerateReportResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GenerateReportResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GenerateReportResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GenerateReportResponseModel(  status: status ?? _status,
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

/// message : "Report generated successfully"
/// reportData : {"s3Link":"https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/reports/report-1-1738877186353.pdf"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      ReportData? reportData,}){
    _message = message;
    _reportData = reportData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _reportData = json['reportData'] != null ? ReportData.fromJson(json['reportData']) : null;
  }
  String? _message;
  ReportData? _reportData;
Data copyWith({  String? message,
  ReportData? reportData,
}) => Data(  message: message ?? _message,
  reportData: reportData ?? _reportData,
);
  String? get message => _message;
  ReportData? get reportData => _reportData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_reportData != null) {
      map['reportData'] = _reportData?.toJson();
    }
    return map;
  }

}

/// s3Link : "https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/reports/report-1-1738877186353.pdf"

ReportData reportDataFromJson(String str) => ReportData.fromJson(json.decode(str));
String reportDataToJson(ReportData data) => json.encode(data.toJson());
class ReportData {
  ReportData({
      String? s3Link,}){
    _s3Link = s3Link;
}

  ReportData.fromJson(dynamic json) {
    _s3Link = json['s3Link'];
  }
  String? _s3Link;
ReportData copyWith({  String? s3Link,
}) => ReportData(  s3Link: s3Link ?? _s3Link,
);
  String? get s3Link => _s3Link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['s3Link'] = _s3Link;
    return map;
  }

}