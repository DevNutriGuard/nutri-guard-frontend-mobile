import 'dart:convert';
/// status : "success"
/// statusCode : 201
/// data : {"user":{"email":"abdulah@example.com","name":"abdullah","userUuid":"9716727e-84e0-4832-81be-7cdafb47284e"},"message":"OTP has been sent to your email address. Please verify it to complete your registration."}

EmailOtpVerfiyResponse emailOtpVerfiyResponseFromJson(String str) => EmailOtpVerfiyResponse.fromJson(json.decode(str));
String emailOtpVerfiyResponseToJson(EmailOtpVerfiyResponse data) => json.encode(data.toJson());
class EmailOtpVerfiyResponse {
  EmailOtpVerfiyResponse({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  EmailOtpVerfiyResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
EmailOtpVerfiyResponse copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => EmailOtpVerfiyResponse(  status: status ?? _status,
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

/// user : {"email":"abdulah@example.com","name":"abdullah","userUuid":"9716727e-84e0-4832-81be-7cdafb47284e"}
/// message : "OTP has been sent to your email address. Please verify it to complete your registration."

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      User? user, 
      String? message,}){
    _user = user;
    _message = message;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _message = json['message'];
  }
  User? _user;
  String? _message;
Data copyWith({  User? user,
  String? message,
}) => Data(  user: user ?? _user,
  message: message ?? _message,
);
  User? get user => _user;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// email : "abdulah@example.com"
/// name : "abdullah"
/// userUuid : "9716727e-84e0-4832-81be-7cdafb47284e"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? email, 
      String? name, 
      String? userUuid,}){
    _email = email;
    _name = name;
    _userUuid = userUuid;
}

  User.fromJson(dynamic json) {
    _email = json['email'];
    _name = json['name'];
    _userUuid = json['userUuid'];
  }
  String? _email;
  String? _name;
  String? _userUuid;
User copyWith({  String? email,
  String? name,
  String? userUuid,
}) => User(  email: email ?? _email,
  name: name ?? _name,
  userUuid: userUuid ?? _userUuid,
);
  String? get email => _email;
  String? get name => _name;
  String? get userUuid => _userUuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['name'] = _name;
    map['userUuid'] = _userUuid;
    return map;
  }

}