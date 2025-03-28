import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":" Subscription status retrieved","subscriptionStatusData":{"userSubscriptionUuid":"78dce2dd-6224-43f1-b3f0-89402bb73ee2","subscriptionPlanUuid":"a363187e-6827-4865-bb6d-599df4ed69b3","subscriptionStart":"2025-01-21T12:54:54.548Z","subscriptionEnd":null,"planName":"Basic","planPrice":0,"planCode":"BASIC","isFree":true,"billingCycle":"monthly"}}

GetSubscriptionsStatus getSubscriptionsStatusFromJson(String str) => GetSubscriptionsStatus.fromJson(json.decode(str));
String getSubscriptionsStatusToJson(GetSubscriptionsStatus data) => json.encode(data.toJson());
class GetSubscriptionsStatus {
  GetSubscriptionsStatus({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GetSubscriptionsStatus.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GetSubscriptionsStatus copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GetSubscriptionsStatus(  status: status ?? _status,
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

/// message : " Subscription status retrieved"
/// subscriptionStatusData : {"userSubscriptionUuid":"78dce2dd-6224-43f1-b3f0-89402bb73ee2","subscriptionPlanUuid":"a363187e-6827-4865-bb6d-599df4ed69b3","subscriptionStart":"2025-01-21T12:54:54.548Z","subscriptionEnd":null,"planName":"Basic","planPrice":0,"planCode":"BASIC","isFree":true,"billingCycle":"monthly"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      SubscriptionStatusData? subscriptionStatusData,}){
    _message = message;
    _subscriptionStatusData = subscriptionStatusData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _subscriptionStatusData = json['subscriptionStatusData'] != null ? SubscriptionStatusData.fromJson(json['subscriptionStatusData']) : null;
  }
  String? _message;
  SubscriptionStatusData? _subscriptionStatusData;
Data copyWith({  String? message,
  SubscriptionStatusData? subscriptionStatusData,
}) => Data(  message: message ?? _message,
  subscriptionStatusData: subscriptionStatusData ?? _subscriptionStatusData,
);
  String? get message => _message;
  SubscriptionStatusData? get subscriptionStatusData => _subscriptionStatusData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_subscriptionStatusData != null) {
      map['subscriptionStatusData'] = _subscriptionStatusData?.toJson();
    }
    return map;
  }

}

/// userSubscriptionUuid : "78dce2dd-6224-43f1-b3f0-89402bb73ee2"
/// subscriptionPlanUuid : "a363187e-6827-4865-bb6d-599df4ed69b3"
/// subscriptionStart : "2025-01-21T12:54:54.548Z"
/// subscriptionEnd : null
/// planName : "Basic"
/// planPrice : 0
/// planCode : "BASIC"
/// isFree : true
/// billingCycle : "monthly"

SubscriptionStatusData subscriptionStatusDataFromJson(String str) => SubscriptionStatusData.fromJson(json.decode(str));
String subscriptionStatusDataToJson(SubscriptionStatusData data) => json.encode(data.toJson());
class SubscriptionStatusData {
  SubscriptionStatusData({
      String? userSubscriptionUuid, 
      String? subscriptionPlanUuid, 
      String? subscriptionStart, 
      dynamic subscriptionEnd, 
      String? planName, 
      int? planPrice, 
      String? planCode, 
      bool? isFree, 
      String? billingCycle,}){
    _userSubscriptionUuid = userSubscriptionUuid;
    _subscriptionPlanUuid = subscriptionPlanUuid;
    _subscriptionStart = subscriptionStart;
    _subscriptionEnd = subscriptionEnd;
    _planName = planName;
    _planPrice = planPrice;
    _planCode = planCode;
    _isFree = isFree;
    _billingCycle = billingCycle;
}

  SubscriptionStatusData.fromJson(dynamic json) {
    _userSubscriptionUuid = json['userSubscriptionUuid'];
    _subscriptionPlanUuid = json['subscriptionPlanUuid'];
    _subscriptionStart = json['subscriptionStart'];
    _subscriptionEnd = json['subscriptionEnd'];
    _planName = json['planName'];
    _planPrice = json['planPrice'];
    _planCode = json['planCode'];
    _isFree = json['isFree'];
    _billingCycle = json['billingCycle'];
  }
  String? _userSubscriptionUuid;
  String? _subscriptionPlanUuid;
  String? _subscriptionStart;
  dynamic _subscriptionEnd;
  String? _planName;
  int? _planPrice;
  String? _planCode;
  bool? _isFree;
  String? _billingCycle;
SubscriptionStatusData copyWith({  String? userSubscriptionUuid,
  String? subscriptionPlanUuid,
  String? subscriptionStart,
  dynamic subscriptionEnd,
  String? planName,
  int? planPrice,
  String? planCode,
  bool? isFree,
  String? billingCycle,
}) => SubscriptionStatusData(  userSubscriptionUuid: userSubscriptionUuid ?? _userSubscriptionUuid,
  subscriptionPlanUuid: subscriptionPlanUuid ?? _subscriptionPlanUuid,
  subscriptionStart: subscriptionStart ?? _subscriptionStart,
  subscriptionEnd: subscriptionEnd ?? _subscriptionEnd,
  planName: planName ?? _planName,
  planPrice: planPrice ?? _planPrice,
  planCode: planCode ?? _planCode,
  isFree: isFree ?? _isFree,
  billingCycle: billingCycle ?? _billingCycle,
);
  String? get userSubscriptionUuid => _userSubscriptionUuid;
  String? get subscriptionPlanUuid => _subscriptionPlanUuid;
  String? get subscriptionStart => _subscriptionStart;
  dynamic get subscriptionEnd => _subscriptionEnd;
  String? get planName => _planName;
  int? get planPrice => _planPrice;
  String? get planCode => _planCode;
  bool? get isFree => _isFree;
  String? get billingCycle => _billingCycle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userSubscriptionUuid'] = _userSubscriptionUuid;
    map['subscriptionPlanUuid'] = _subscriptionPlanUuid;
    map['subscriptionStart'] = _subscriptionStart;
    map['subscriptionEnd'] = _subscriptionEnd;
    map['planName'] = _planName;
    map['planPrice'] = _planPrice;
    map['planCode'] = _planCode;
    map['isFree'] = _isFree;
    map['billingCycle'] = _billingCycle;
    return map;
  }

}