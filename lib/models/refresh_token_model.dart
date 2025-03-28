import 'dart:convert';
/// status : "success"
/// statusCode : 201
/// data : {"message":"Token Refreshed Successfully!","accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6IjY3Y2I2M2FhLWRkNmUtNGRhZC1hYTllLTFkNzllN2RlN2U3MSIsImlhdCI6MTczNDYxMzA1MywiZXhwIjoxNzM0NjEzOTUzfQ.REAVdp-T6uBK6WVNk-Pe1GHGlSd3T59lnLBS7ujDAxw","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6IjY3Y2I2M2FhLWRkNmUtNGRhZC1hYTllLTFkNzllN2RlN2U3MSIsImlhdCI6MTczNDYxMzA1MywiZXhwIjoxNzM3MjA1MDUzfQ.G7rDEIfW92XV46VpocVTw91Jm7cdOCkg91OcHPBVKQM"}

RefreshTokenModel refreshTokenModelFromJson(String str) => RefreshTokenModel.fromJson(json.decode(str));
String refreshTokenModelToJson(RefreshTokenModel data) => json.encode(data.toJson());
class RefreshTokenModel {
  RefreshTokenModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  RefreshTokenModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
RefreshTokenModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => RefreshTokenModel(  status: status ?? _status,
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

/// message : "Token Refreshed Successfully!"
/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6IjY3Y2I2M2FhLWRkNmUtNGRhZC1hYTllLTFkNzllN2RlN2U3MSIsImlhdCI6MTczNDYxMzA1MywiZXhwIjoxNzM0NjEzOTUzfQ.REAVdp-T6uBK6WVNk-Pe1GHGlSd3T59lnLBS7ujDAxw"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6IjY3Y2I2M2FhLWRkNmUtNGRhZC1hYTllLTFkNzllN2RlN2U3MSIsImlhdCI6MTczNDYxMzA1MywiZXhwIjoxNzM3MjA1MDUzfQ.G7rDEIfW92XV46VpocVTw91Jm7cdOCkg91OcHPBVKQM"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      String? accessToken, 
      String? refreshToken,}){
    _message = message;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }
  String? _message;
  String? _accessToken;
  String? _refreshToken;
Data copyWith({  String? message,
  String? accessToken,
  String? refreshToken,
}) => Data(  message: message ?? _message,
  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  String? get message => _message;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }

}