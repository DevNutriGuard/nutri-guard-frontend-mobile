import 'dart:convert';
/// status : "success"
/// statusCode : 201
/// data : {"message":"Health testing Document saved successfully.","url":"https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/medical-documents/1737323691580-Sign Up with Phone.png","text":"null"}

UploadDocCommonResponse uploadDocCommonResponseFromJson(String str) => UploadDocCommonResponse.fromJson(json.decode(str));
String uploadDocCommonResponseToJson(UploadDocCommonResponse data) => json.encode(data.toJson());
class UploadDocCommonResponse {
  UploadDocCommonResponse({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  UploadDocCommonResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
UploadDocCommonResponse copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => UploadDocCommonResponse(  status: status ?? _status,
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

/// message : "Health testing Document saved successfully."
/// url : "https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/medical-documents/1737323691580-Sign Up with Phone.png"
/// text : "null"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      String? url, 
      String? text,}){
    _message = message;
    _url = url;
    _text = text;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _url = json['url'];
    _text = json['text'];
  }
  String? _message;
  String? _url;
  String? _text;
Data copyWith({  String? message,
  String? url,
  String? text,
}) => Data(  message: message ?? _message,
  url: url ?? _url,
  text: text ?? _text,
);
  String? get message => _message;
  String? get url => _url;
  String? get text => _text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['url'] = _url;
    map['text'] = _text;
    return map;
  }

}