import 'dart:convert';
UploadImageModel uploadImageModelFromJson(String str) => UploadImageModel.fromJson(json.decode(str));
String uploadImageModelToJson(UploadImageModel data) => json.encode(data.toJson());
class UploadImageModel {
  UploadImageModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  UploadImageModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
UploadImageModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => UploadImageModel(  status: status ?? _status,
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