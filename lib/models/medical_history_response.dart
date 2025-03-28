import 'dart:convert';
/// status : "success"
/// statusCode : 201
/// data : {"message":"Medical History Saved Successfully!"}

MedicalHistoryResponse medicalHistoryResponseFromJson(String str) => MedicalHistoryResponse.fromJson(json.decode(str));
String medicalHistoryResponseToJson(MedicalHistoryResponse data) => json.encode(data.toJson());
class MedicalHistoryResponse {
  MedicalHistoryResponse({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  MedicalHistoryResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
MedicalHistoryResponse copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => MedicalHistoryResponse(  status: status ?? _status,
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

/// message : "Medical History Saved Successfully!"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message,}){
    _message = message;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
Data copyWith({  String? message,
}) => Data(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}