import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Subscription plans retrieved successfully.","plans":[{"planCode":"BASIC","planName":"Basic","planPrice":0,"subscriptionPlanUuid":"a363187e-6827-4865-bb6d-599df4ed69b3"},{"planCode":"PREMIUM_MONTHLY","planName":"Premium Monthly","planPrice":20,"subscriptionPlanUuid":"5c75fd88-bcc4-4c8d-807c-7c2415690f93"},{"planCode":"PREMIUM_YEARLY","planName":"Premium Yearly","planPrice":168,"subscriptionPlanUuid":"c06a190b-e5be-46e5-8c76-25092e8065a9"}]}

GetPlansSubscriptionResponseModel getPlansSubscriptionResponseModelFromJson(String str) => GetPlansSubscriptionResponseModel.fromJson(json.decode(str));
String getPlansSubscriptionResponseModelToJson(GetPlansSubscriptionResponseModel data) => json.encode(data.toJson());
class GetPlansSubscriptionResponseModel {
  GetPlansSubscriptionResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GetPlansSubscriptionResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GetPlansSubscriptionResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GetPlansSubscriptionResponseModel(  status: status ?? _status,
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

/// message : "Subscription plans retrieved successfully."
/// plans : [{"planCode":"BASIC","planName":"Basic","planPrice":0,"subscriptionPlanUuid":"a363187e-6827-4865-bb6d-599df4ed69b3"},{"planCode":"PREMIUM_MONTHLY","planName":"Premium Monthly","planPrice":20,"subscriptionPlanUuid":"5c75fd88-bcc4-4c8d-807c-7c2415690f93"},{"planCode":"PREMIUM_YEARLY","planName":"Premium Yearly","planPrice":168,"subscriptionPlanUuid":"c06a190b-e5be-46e5-8c76-25092e8065a9"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      List<Plans>? plans,}){
    _message = message;
    _plans = plans;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    if (json['plans'] != null) {
      _plans = [];
      json['plans'].forEach((v) {
        _plans?.add(Plans.fromJson(v));
      });
    }
  }
  String? _message;
  List<Plans>? _plans;
Data copyWith({  String? message,
  List<Plans>? plans,
}) => Data(  message: message ?? _message,
  plans: plans ?? _plans,
);
  String? get message => _message;
  List<Plans>? get plans => _plans;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_plans != null) {
      map['plans'] = _plans?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// planCode : "BASIC"
/// planName : "Basic"
/// planPrice : 0
/// subscriptionPlanUuid : "a363187e-6827-4865-bb6d-599df4ed69b3"

Plans plansFromJson(String str) => Plans.fromJson(json.decode(str));
String plansToJson(Plans data) => json.encode(data.toJson());
class Plans {
  Plans({
      String? planCode, 
      String? planName, 
      int? planPrice, 
      String? subscriptionPlanUuid,}){
    _planCode = planCode;
    _planName = planName;
    _planPrice = planPrice;
    _subscriptionPlanUuid = subscriptionPlanUuid;
}

  Plans.fromJson(dynamic json) {
    _planCode = json['planCode'];
    _planName = json['planName'];
    _planPrice = json['planPrice'];
    _subscriptionPlanUuid = json['subscriptionPlanUuid'];
  }
  String? _planCode;
  String? _planName;
  int? _planPrice;
  String? _subscriptionPlanUuid;
Plans copyWith({  String? planCode,
  String? planName,
  int? planPrice,
  String? subscriptionPlanUuid,
}) => Plans(  planCode: planCode ?? _planCode,
  planName: planName ?? _planName,
  planPrice: planPrice ?? _planPrice,
  subscriptionPlanUuid: subscriptionPlanUuid ?? _subscriptionPlanUuid,
);
  String? get planCode => _planCode;
  String? get planName => _planName;
  int? get planPrice => _planPrice;
  String? get subscriptionPlanUuid => _subscriptionPlanUuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['planCode'] = _planCode;
    map['planName'] = _planName;
    map['planPrice'] = _planPrice;
    map['subscriptionPlanUuid'] = _subscriptionPlanUuid;
    return map;
  }

}