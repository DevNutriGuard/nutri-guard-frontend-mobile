import 'dart:convert';
/// status : "success"
/// statusCode : 201
/// data : {"message":"File Successfully Uploaded!","url":"https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/profile-pictures/1739118272725-WhatsApp Image 2025-01-29 at 14.27.09.jpeg"}

ImageUploadResponse imageUploadResponseFromJson(String str) => ImageUploadResponse.fromJson(json.decode(str));
String imageUploadResponseToJson(ImageUploadResponse data) => json.encode(data.toJson());
class ImageUploadResponse {
  ImageUploadResponse({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  ImageUploadResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
ImageUploadResponse copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => ImageUploadResponse(  status: status ?? _status,
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

/// message : "File Successfully Uploaded!"
/// url : "https://nutri-guard-dev-files.s3.us-east-2.amazonaws.com/profile-pictures/1739118272725-WhatsApp Image 2025-01-29 at 14.27.09.jpeg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      String? url,}){
    _message = message;
    _url = url;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _url = json['url'];
  }
  String? _message;
  String? _url;
Data copyWith({  String? message,
  String? url,
}) => Data(  message: message ?? _message,
  url: url ?? _url,
);
  String? get message => _message;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['url'] = _url;
    return map;
  }

}