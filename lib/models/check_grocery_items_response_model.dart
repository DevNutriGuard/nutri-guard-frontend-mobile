import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Grocery Item Checked"}

CheckGroceryItemsResponseModel checkGroceryItemsResponseModelFromJson(String str) => CheckGroceryItemsResponseModel.fromJson(json.decode(str));
String checkGroceryItemsResponseModelToJson(CheckGroceryItemsResponseModel data) => json.encode(data.toJson());
class CheckGroceryItemsResponseModel {
  CheckGroceryItemsResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  CheckGroceryItemsResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
CheckGroceryItemsResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => CheckGroceryItemsResponseModel(  status: status ?? _status,
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

/// message : "Grocery Item Checked"

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