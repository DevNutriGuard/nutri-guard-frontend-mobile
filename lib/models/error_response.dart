import 'dart:convert';
/// statusCode : 401
/// message : "Invalid username or password. Please try again."
/// status : "UNAUTHORIZED"

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));
String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());
class ErrorResponse {
  ErrorResponse({
      int? statusCode, 
      String? message, 
      String? status,}){
    _statusCode = statusCode;
    _message = message;
    _status = status;
}

  ErrorResponse.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _status = json['status'];
  }
  int? _statusCode;
  String? _message;
  String? _status;
ErrorResponse copyWith({  int? statusCode,
  String? message,
  String? status,
}) => ErrorResponse(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  status: status ?? _status,
);
  int? get statusCode => _statusCode;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}