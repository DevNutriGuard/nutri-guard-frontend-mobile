import 'dart:convert';
/// status : "success"
/// statusCode : 201
/// data : {"message":"Email sent successfully","user":{"userUuid":"bab02207-796f-4e99-b627-fd06be580395"}}

ForgotPasswordResponse forgotPasswordResponseFromJson(String str) => ForgotPasswordResponse.fromJson(json.decode(str));
String forgotPasswordResponseToJson(ForgotPasswordResponse data) => json.encode(data.toJson());
class ForgotPasswordResponse {
  ForgotPasswordResponse({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  ForgotPasswordResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
ForgotPasswordResponse copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => ForgotPasswordResponse(  status: status ?? _status,
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

/// message : "Email sent successfully"
/// user : {"userUuid":"bab02207-796f-4e99-b627-fd06be580395"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      User? user,}){
    _message = message;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _message;
  User? _user;
Data copyWith({  String? message,
  User? user,
}) => Data(  message: message ?? _message,
  user: user ?? _user,
);
  String? get message => _message;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// userUuid : "bab02207-796f-4e99-b627-fd06be580395"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? userUuid,}){
    _userUuid = userUuid;
}

  User.fromJson(dynamic json) {
    _userUuid = json['userUuid'];
  }
  String? _userUuid;
User copyWith({  String? userUuid,
}) => User(  userUuid: userUuid ?? _userUuid,
);
  String? get userUuid => _userUuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userUuid'] = _userUuid;
    return map;
  }

}