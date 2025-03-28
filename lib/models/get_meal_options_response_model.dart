import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Meal Options Data","mealOptionsData":[{"mealOptionUuid":"b0066e10-7519-46a0-87c1-9ba703a54cfa","name":"Greek Yogurt with Mixed Berries","description":"This meal is rich in protein to support muscle recovery and provides sustained energy. Probiotic yogurt supports gut health for users with digestive issues.","image":null,"totalCalories":400,"carbs":40,"fats":10,"proteins":25,"fiber":5,"vitamins":["Vitamin C","Vitamin D"],"minerals":["Calcium","Potassium"],"allergens":[{"title":"Dairy","description":"Found in yogurt.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]}

GetMealOptionsResponseModel getMealOptionsResponseModelFromJson(String str) => GetMealOptionsResponseModel.fromJson(json.decode(str));
String getMealOptionsResponseModelToJson(GetMealOptionsResponseModel data) => json.encode(data.toJson());
class GetMealOptionsResponseModel {
  GetMealOptionsResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GetMealOptionsResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GetMealOptionsResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GetMealOptionsResponseModel(  status: status ?? _status,
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

/// message : "Meal Options Data"
/// mealOptionsData : [{"mealOptionUuid":"b0066e10-7519-46a0-87c1-9ba703a54cfa","name":"Greek Yogurt with Mixed Berries","description":"This meal is rich in protein to support muscle recovery and provides sustained energy. Probiotic yogurt supports gut health for users with digestive issues.","image":null,"totalCalories":400,"carbs":40,"fats":10,"proteins":25,"fiber":5,"vitamins":["Vitamin C","Vitamin D"],"minerals":["Calcium","Potassium"],"allergens":[{"title":"Dairy","description":"Found in yogurt.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      List<MealOptionsData>? mealOptionsData,}){
    _message = message;
    _mealOptionsData = mealOptionsData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    if (json['mealOptionsData'] != null) {
      _mealOptionsData = [];
      json['mealOptionsData'].forEach((v) {
        _mealOptionsData?.add(MealOptionsData.fromJson(v));
      });
    }
  }
  String? _message;
  List<MealOptionsData>? _mealOptionsData;
Data copyWith({  String? message,
  List<MealOptionsData>? mealOptionsData,
}) => Data(  message: message ?? _message,
  mealOptionsData: mealOptionsData ?? _mealOptionsData,
);
  String? get message => _message;
  List<MealOptionsData>? get mealOptionsData => _mealOptionsData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_mealOptionsData != null) {
      map['mealOptionsData'] = _mealOptionsData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// mealOptionUuid : "b0066e10-7519-46a0-87c1-9ba703a54cfa"
/// name : "Greek Yogurt with Mixed Berries"
/// description : "This meal is rich in protein to support muscle recovery and provides sustained energy. Probiotic yogurt supports gut health for users with digestive issues."
/// image : null
/// totalCalories : 400
/// carbs : 40
/// fats : 10
/// proteins : 25
/// fiber : 5
/// vitamins : ["Vitamin C","Vitamin D"]
/// minerals : ["Calcium","Potassium"]
/// allergens : [{"title":"Dairy","description":"Found in yogurt.","complianceCheck":false}]
/// dietaryCompliance : [{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}]
/// religiousCompliance : [{"title":"Halal","complianceCheck":true}]
/// supplementMedicineCheck : [{"title":"Metformin","type":"Medication","interactionCheck":false}]

MealOptionsData mealOptionsDataFromJson(String str) => MealOptionsData.fromJson(json.decode(str));
String mealOptionsDataToJson(MealOptionsData data) => json.encode(data.toJson());
class MealOptionsData {
  MealOptionsData({
      String? mealOptionUuid, 
      String? name, 
      String? description, 
      dynamic image, 
      int? totalCalories, 
      int? carbs, 
      int? fats, 
      int? proteins, 
      int? fiber, 
      List<String>? vitamins, 
      List<String>? minerals, 
      List<Allergens>? allergens, 
      List<DietaryCompliance>? dietaryCompliance, 
      List<ReligiousCompliance>? religiousCompliance, 
      List<SupplementMedicineCheck>? supplementMedicineCheck,}){
    _mealOptionUuid = mealOptionUuid;
    _name = name;
    _description = description;
    _image = image;
    _totalCalories = totalCalories;
    _carbs = carbs;
    _fats = fats;
    _proteins = proteins;
    _fiber = fiber;
    _vitamins = vitamins;
    _minerals = minerals;
    _allergens = allergens;
    _dietaryCompliance = dietaryCompliance;
    _religiousCompliance = religiousCompliance;
    _supplementMedicineCheck = supplementMedicineCheck;
}

  MealOptionsData.fromJson(dynamic json) {
    _mealOptionUuid = json['mealOptionUuid'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _totalCalories = json['totalCalories'];
    _carbs = json['carbs'];
    _fats = json['fats'];
    _proteins = json['proteins'];
    _fiber = json['fiber'];
    _vitamins = json['vitamins'] != null ? json['vitamins'].cast<String>() : [];
    _minerals = json['minerals'] != null ? json['minerals'].cast<String>() : [];
    if (json['allergens'] != null) {
      _allergens = [];
      json['allergens'].forEach((v) {
        _allergens?.add(Allergens.fromJson(v));
      });
    }
    if (json['dietaryCompliance'] != null) {
      _dietaryCompliance = [];
      json['dietaryCompliance'].forEach((v) {
        _dietaryCompliance?.add(DietaryCompliance.fromJson(v));
      });
    }
    if (json['religiousCompliance'] != null) {
      _religiousCompliance = [];
      json['religiousCompliance'].forEach((v) {
        _religiousCompliance?.add(ReligiousCompliance.fromJson(v));
      });
    }
    if (json['supplementMedicineCheck'] != null) {
      _supplementMedicineCheck = [];
      json['supplementMedicineCheck'].forEach((v) {
        _supplementMedicineCheck?.add(SupplementMedicineCheck.fromJson(v));
      });
    }
  }
  String? _mealOptionUuid;
  String? _name;
  String? _description;
  dynamic _image;
  int? _totalCalories;
  int? _carbs;
  int? _fats;
  int? _proteins;
  int? _fiber;
  List<String>? _vitamins;
  List<String>? _minerals;
  List<Allergens>? _allergens;
  List<DietaryCompliance>? _dietaryCompliance;
  List<ReligiousCompliance>? _religiousCompliance;
  List<SupplementMedicineCheck>? _supplementMedicineCheck;
MealOptionsData copyWith({  String? mealOptionUuid,
  String? name,
  String? description,
  dynamic image,
  int? totalCalories,
  int? carbs,
  int? fats,
  int? proteins,
  int? fiber,
  List<String>? vitamins,
  List<String>? minerals,
  List<Allergens>? allergens,
  List<DietaryCompliance>? dietaryCompliance,
  List<ReligiousCompliance>? religiousCompliance,
  List<SupplementMedicineCheck>? supplementMedicineCheck,
}) => MealOptionsData(  mealOptionUuid: mealOptionUuid ?? _mealOptionUuid,
  name: name ?? _name,
  description: description ?? _description,
  image: image ?? _image,
  totalCalories: totalCalories ?? _totalCalories,
  carbs: carbs ?? _carbs,
  fats: fats ?? _fats,
  proteins: proteins ?? _proteins,
  fiber: fiber ?? _fiber,
  vitamins: vitamins ?? _vitamins,
  minerals: minerals ?? _minerals,
  allergens: allergens ?? _allergens,
  dietaryCompliance: dietaryCompliance ?? _dietaryCompliance,
  religiousCompliance: religiousCompliance ?? _religiousCompliance,
  supplementMedicineCheck: supplementMedicineCheck ?? _supplementMedicineCheck,
);
  String? get mealOptionUuid => _mealOptionUuid;
  String? get name => _name;
  String? get description => _description;
  dynamic get image => _image;
  int? get totalCalories => _totalCalories;
  int? get carbs => _carbs;
  int? get fats => _fats;
  int? get proteins => _proteins;
  int? get fiber => _fiber;
  List<String>? get vitamins => _vitamins;
  List<String>? get minerals => _minerals;
  List<Allergens>? get allergens => _allergens;
  List<DietaryCompliance>? get dietaryCompliance => _dietaryCompliance;
  List<ReligiousCompliance>? get religiousCompliance => _religiousCompliance;
  List<SupplementMedicineCheck>? get supplementMedicineCheck => _supplementMedicineCheck;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mealOptionUuid'] = _mealOptionUuid;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['totalCalories'] = _totalCalories;
    map['carbs'] = _carbs;
    map['fats'] = _fats;
    map['proteins'] = _proteins;
    map['fiber'] = _fiber;
    map['vitamins'] = _vitamins;
    map['minerals'] = _minerals;
    if (_allergens != null) {
      map['allergens'] = _allergens?.map((v) => v.toJson()).toList();
    }
    if (_dietaryCompliance != null) {
      map['dietaryCompliance'] = _dietaryCompliance?.map((v) => v.toJson()).toList();
    }
    if (_religiousCompliance != null) {
      map['religiousCompliance'] = _religiousCompliance?.map((v) => v.toJson()).toList();
    }
    if (_supplementMedicineCheck != null) {
      map['supplementMedicineCheck'] = _supplementMedicineCheck?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "Metformin"
/// type : "Medication"
/// interactionCheck : false

SupplementMedicineCheck supplementMedicineCheckFromJson(String str) => SupplementMedicineCheck.fromJson(json.decode(str));
String supplementMedicineCheckToJson(SupplementMedicineCheck data) => json.encode(data.toJson());
class SupplementMedicineCheck {
  SupplementMedicineCheck({
      String? title, 
      String? type, 
      bool? interactionCheck,}){
    _title = title;
    _type = type;
    _interactionCheck = interactionCheck;
}

  SupplementMedicineCheck.fromJson(dynamic json) {
    _title = json['title'];
    _type = json['type'];
    _interactionCheck = json['interactionCheck'];
  }
  String? _title;
  String? _type;
  bool? _interactionCheck;
SupplementMedicineCheck copyWith({  String? title,
  String? type,
  bool? interactionCheck,
}) => SupplementMedicineCheck(  title: title ?? _title,
  type: type ?? _type,
  interactionCheck: interactionCheck ?? _interactionCheck,
);
  String? get title => _title;
  String? get type => _type;
  bool? get interactionCheck => _interactionCheck;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['type'] = _type;
    map['interactionCheck'] = _interactionCheck;
    return map;
  }

}

/// title : "Halal"
/// complianceCheck : true

ReligiousCompliance religiousComplianceFromJson(String str) => ReligiousCompliance.fromJson(json.decode(str));
String religiousComplianceToJson(ReligiousCompliance data) => json.encode(data.toJson());
class ReligiousCompliance {
  ReligiousCompliance({
      String? title, 
      bool? complianceCheck,}){
    _title = title;
    _complianceCheck = complianceCheck;
}

  ReligiousCompliance.fromJson(dynamic json) {
    _title = json['title'];
    _complianceCheck = json['complianceCheck'];
  }
  String? _title;
  bool? _complianceCheck;
ReligiousCompliance copyWith({  String? title,
  bool? complianceCheck,
}) => ReligiousCompliance(  title: title ?? _title,
  complianceCheck: complianceCheck ?? _complianceCheck,
);
  String? get title => _title;
  bool? get complianceCheck => _complianceCheck;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['complianceCheck'] = _complianceCheck;
    return map;
  }

}

/// title : "Halal"
/// complianceCheck : true

DietaryCompliance dietaryComplianceFromJson(String str) => DietaryCompliance.fromJson(json.decode(str));
String dietaryComplianceToJson(DietaryCompliance data) => json.encode(data.toJson());
class DietaryCompliance {
  DietaryCompliance({
      String? title, 
      bool? complianceCheck,}){
    _title = title;
    _complianceCheck = complianceCheck;
}

  DietaryCompliance.fromJson(dynamic json) {
    _title = json['title'];
    _complianceCheck = json['complianceCheck'];
  }
  String? _title;
  bool? _complianceCheck;
DietaryCompliance copyWith({  String? title,
  bool? complianceCheck,
}) => DietaryCompliance(  title: title ?? _title,
  complianceCheck: complianceCheck ?? _complianceCheck,
);
  String? get title => _title;
  bool? get complianceCheck => _complianceCheck;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['complianceCheck'] = _complianceCheck;
    return map;
  }

}

/// title : "Dairy"
/// description : "Found in yogurt."
/// complianceCheck : false

Allergens allergensFromJson(String str) => Allergens.fromJson(json.decode(str));
String allergensToJson(Allergens data) => json.encode(data.toJson());
class Allergens {
  Allergens({
      String? title, 
      String? description, 
      bool? complianceCheck,}){
    _title = title;
    _description = description;
    _complianceCheck = complianceCheck;
}

  Allergens.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _complianceCheck = json['complianceCheck'];
  }
  String? _title;
  String? _description;
  bool? _complianceCheck;
Allergens copyWith({  String? title,
  String? description,
  bool? complianceCheck,
}) => Allergens(  title: title ?? _title,
  description: description ?? _description,
  complianceCheck: complianceCheck ?? _complianceCheck,
);
  String? get title => _title;
  String? get description => _description;
  bool? get complianceCheck => _complianceCheck;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['complianceCheck'] = _complianceCheck;
    return map;
  }

}