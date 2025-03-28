import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Grocery List Data","groceryListData":[{"essentialItemUuid":"75124d47-5b1c-41c2-8972-9cf6a9e68f4a","name":"Mixed Berries","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"6392ba57-6ab2-4e7e-aea0-e5fa56305f62","name":"Almond Butter","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"675ae66b-f31a-49a0-bd0d-9dfc6cb139e2","name":"Oats","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"93087abe-3ee8-4be6-8504-9b4f0943d610","name":"Hummus","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"14b8f16f-93a1-44e5-8c17-3b8ae56b10be","name":"Carrots","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"22b31592-3d9b-476a-9599-cb533d20fe19","name":"Cucumber","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"a3bf255a-2e97-4684-a01d-897ddad7be4b","name":"Chicken Breast","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"f3c01f51-e34e-4fad-a240-bce1f256b8f7","name":"Salmon","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"3930b813-e8ac-4098-b0e2-aa85bb598e89","name":"Asparagus","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"9b75fe13-fcfd-4066-ba2b-385e8d1b363d","name":"Chickpeas","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"517a4b65-99c9-4f3e-a0f6-f4005e9bb95f","name":"Quinoa","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"19db7d15-caa3-4e32-9a2d-59d4e445f4c8","name":"Greek Yogurt","image":null,"checked":true,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T03:05:01.314Z"}]}

GetGroceryListItemsResponseModel getGroceryListItemsResponseModelFromJson(String str) => GetGroceryListItemsResponseModel.fromJson(json.decode(str));
String getGroceryListItemsResponseModelToJson(GetGroceryListItemsResponseModel data) => json.encode(data.toJson());
class GetGroceryListItemsResponseModel {
  GetGroceryListItemsResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GetGroceryListItemsResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GetGroceryListItemsResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GetGroceryListItemsResponseModel(  status: status ?? _status,
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

/// message : "Grocery List Data"
/// groceryListData : [{"essentialItemUuid":"75124d47-5b1c-41c2-8972-9cf6a9e68f4a","name":"Mixed Berries","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"6392ba57-6ab2-4e7e-aea0-e5fa56305f62","name":"Almond Butter","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"675ae66b-f31a-49a0-bd0d-9dfc6cb139e2","name":"Oats","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"93087abe-3ee8-4be6-8504-9b4f0943d610","name":"Hummus","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"14b8f16f-93a1-44e5-8c17-3b8ae56b10be","name":"Carrots","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"22b31592-3d9b-476a-9599-cb533d20fe19","name":"Cucumber","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"a3bf255a-2e97-4684-a01d-897ddad7be4b","name":"Chicken Breast","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"f3c01f51-e34e-4fad-a240-bce1f256b8f7","name":"Salmon","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"3930b813-e8ac-4098-b0e2-aa85bb598e89","name":"Asparagus","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"9b75fe13-fcfd-4066-ba2b-385e8d1b363d","name":"Chickpeas","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"517a4b65-99c9-4f3e-a0f6-f4005e9bb95f","name":"Quinoa","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"19db7d15-caa3-4e32-9a2d-59d4e445f4c8","name":"Greek Yogurt","image":null,"checked":true,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T03:05:01.314Z"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      List<GroceryListData>? groceryListData,}){
    _message = message;
    _groceryListData = groceryListData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    if (json['groceryListData'] != null) {
      _groceryListData = [];
      json['groceryListData'].forEach((v) {
        _groceryListData?.add(GroceryListData.fromJson(v));
      });
    }
  }
  String? _message;
  List<GroceryListData>? _groceryListData;
Data copyWith({  String? message,
  List<GroceryListData>? groceryListData,
}) => Data(  message: message ?? _message,
  groceryListData: groceryListData ?? _groceryListData,
);
  String? get message => _message;
  List<GroceryListData>? get groceryListData => _groceryListData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_groceryListData != null) {
      map['groceryListData'] = _groceryListData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// essentialItemUuid : "75124d47-5b1c-41c2-8972-9cf6a9e68f4a"
/// name : "Mixed Berries"
/// image : null
/// checked : false
/// createdAt : "2025-01-20T02:37:59.418Z"
/// updatedAt : "2025-01-20T02:37:59.418Z"

GroceryListData groceryListDataFromJson(String str) => GroceryListData.fromJson(json.decode(str));
String groceryListDataToJson(GroceryListData data) => json.encode(data.toJson());
class GroceryListData {
  GroceryListData({
      String? essentialItemUuid, 
      String? name, 
      dynamic image, 
      bool? checked, 
      String? createdAt, 
      String? updatedAt,}){
    _essentialItemUuid = essentialItemUuid;
    _name = name;
    _image = image;
    _checked = checked;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  GroceryListData.fromJson(dynamic json) {
    _essentialItemUuid = json['essentialItemUuid'];
    _name = json['name'];
    _image = json['image'];
    _checked = json['checked'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _essentialItemUuid;
  String? _name;
  dynamic _image;
  bool? _checked;
  String? _createdAt;
  String? _updatedAt;
GroceryListData copyWith({  String? essentialItemUuid,
  String? name,
  dynamic image,
  bool? checked,
  String? createdAt,
  String? updatedAt,
}) => GroceryListData(  essentialItemUuid: essentialItemUuid ?? _essentialItemUuid,
  name: name ?? _name,
  image: image ?? _image,
  checked: checked ?? _checked,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get essentialItemUuid => _essentialItemUuid;
  String? get name => _name;
  dynamic get image => _image;
  bool? get checked => _checked;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['essentialItemUuid'] = _essentialItemUuid;
    map['name'] = _name;
    map['image'] = _image;
    map['checked'] = _checked;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}