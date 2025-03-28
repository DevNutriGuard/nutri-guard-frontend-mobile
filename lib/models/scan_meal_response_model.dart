import 'dart:convert';
/// status : "success"
/// statusCode : 201
/// data : {"message":"Meal Data","scannedMealData":{"meal":{"name":"Russian Salad","description":"A creamy and nutritious salad with a mix of potatoes, peas, carrots, and mayonnaise, providing a balanced mix of carbohydrates, fats, and proteins.","image":null,"macronutrients":{"proteins":7,"carbs":23,"fats":15,"calories":290}},"mealItems":[{"name":"Potatoes and Peas","totalCalories":150},{"name":"Mayonnaise Dressing","totalCalories":120},{"name":"Carrots","totalCalories":20}]}}

ScanMealResponseModel scanMealResponseModelFromJson(String str) => ScanMealResponseModel.fromJson(json.decode(str));
String scanMealResponseModelToJson(ScanMealResponseModel data) => json.encode(data.toJson());
class ScanMealResponseModel {
  ScanMealResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  ScanMealResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
ScanMealResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => ScanMealResponseModel(  status: status ?? _status,
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

/// message : "Meal Data"
/// scannedMealData : {"meal":{"name":"Russian Salad","description":"A creamy and nutritious salad with a mix of potatoes, peas, carrots, and mayonnaise, providing a balanced mix of carbohydrates, fats, and proteins.","image":null,"macronutrients":{"proteins":7,"carbs":23,"fats":15,"calories":290}},"mealItems":[{"name":"Potatoes and Peas","totalCalories":150},{"name":"Mayonnaise Dressing","totalCalories":120},{"name":"Carrots","totalCalories":20}]}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      ScannedMealData? scannedMealData,}){
    _message = message;
    _scannedMealData = scannedMealData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _scannedMealData = json['scannedMealData'] != null ? ScannedMealData.fromJson(json['scannedMealData']) : null;
  }
  String? _message;
  ScannedMealData? _scannedMealData;
Data copyWith({  String? message,
  ScannedMealData? scannedMealData,
}) => Data(  message: message ?? _message,
  scannedMealData: scannedMealData ?? _scannedMealData,
);
  String? get message => _message;
  ScannedMealData? get scannedMealData => _scannedMealData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_scannedMealData != null) {
      map['scannedMealData'] = _scannedMealData?.toJson();
    }
    return map;
  }

}

/// meal : {"name":"Russian Salad","description":"A creamy and nutritious salad with a mix of potatoes, peas, carrots, and mayonnaise, providing a balanced mix of carbohydrates, fats, and proteins.","image":null,"macronutrients":{"proteins":7,"carbs":23,"fats":15,"calories":290}}
/// mealItems : [{"name":"Potatoes and Peas","totalCalories":150},{"name":"Mayonnaise Dressing","totalCalories":120},{"name":"Carrots","totalCalories":20}]

ScannedMealData scannedMealDataFromJson(String str) => ScannedMealData.fromJson(json.decode(str));
String scannedMealDataToJson(ScannedMealData data) => json.encode(data.toJson());
class ScannedMealData {
  ScannedMealData({
      Meal? meal, 
      List<MealItems>? mealItems,}){
    _meal = meal;
    _mealItems = mealItems;
}

  ScannedMealData.fromJson(dynamic json) {
    _meal = json['meal'] != null ? Meal.fromJson(json['meal']) : null;
    if (json['mealItems'] != null) {
      _mealItems = [];
      json['mealItems'].forEach((v) {
        _mealItems?.add(MealItems.fromJson(v));
      });
    }
  }
  Meal? _meal;
  List<MealItems>? _mealItems;
ScannedMealData copyWith({  Meal? meal,
  List<MealItems>? mealItems,
}) => ScannedMealData(  meal: meal ?? _meal,
  mealItems: mealItems ?? _mealItems,
);
  Meal? get meal => _meal;
  List<MealItems>? get mealItems => _mealItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meal != null) {
      map['meal'] = _meal?.toJson();
    }
    if (_mealItems != null) {
      map['mealItems'] = _mealItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Potatoes and Peas"
/// totalCalories : 150

MealItems mealItemsFromJson(String str) => MealItems.fromJson(json.decode(str));
String mealItemsToJson(MealItems data) => json.encode(data.toJson());
class MealItems {
  MealItems({
      String? name, 
      int? totalCalories,}){
    _name = name;
    _totalCalories = totalCalories;
}

  MealItems.fromJson(dynamic json) {
    _name = json['name'];
    _totalCalories = json['totalCalories'];
  }
  String? _name;
  int? _totalCalories;
MealItems copyWith({  String? name,
  int? totalCalories,
}) => MealItems(  name: name ?? _name,
  totalCalories: totalCalories ?? _totalCalories,
);
  String? get name => _name;
  int? get totalCalories => _totalCalories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['totalCalories'] = _totalCalories;
    return map;
  }

}

/// name : "Russian Salad"
/// description : "A creamy and nutritious salad with a mix of potatoes, peas, carrots, and mayonnaise, providing a balanced mix of carbohydrates, fats, and proteins."
/// image : null
/// macronutrients : {"proteins":7,"carbs":23,"fats":15,"calories":290}

Meal mealFromJson(String str) => Meal.fromJson(json.decode(str));
String mealToJson(Meal data) => json.encode(data.toJson());
class Meal {
  Meal({
      String? name, 
      String? description, 
      dynamic image, 
      Macronutrients? macronutrients,}){
    _name = name;
    _description = description;
    _image = image;
    _macronutrients = macronutrients;
}

  Meal.fromJson(dynamic json) {
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _macronutrients = json['macronutrients'] != null ? Macronutrients.fromJson(json['macronutrients']) : null;
  }
  String? _name;
  String? _description;
  dynamic _image;
  Macronutrients? _macronutrients;
Meal copyWith({  String? name,
  String? description,
  dynamic image,
  Macronutrients? macronutrients,
}) => Meal(  name: name ?? _name,
  description: description ?? _description,
  image: image ?? _image,
  macronutrients: macronutrients ?? _macronutrients,
);
  String? get name => _name;
  String? get description => _description;
  dynamic get image => _image;
  Macronutrients? get macronutrients => _macronutrients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    if (_macronutrients != null) {
      map['macronutrients'] = _macronutrients?.toJson();
    }
    return map;
  }

}

/// proteins : 7
/// carbs : 23
/// fats : 15
/// calories : 290

Macronutrients macronutrientsFromJson(String str) => Macronutrients.fromJson(json.decode(str));
String macronutrientsToJson(Macronutrients data) => json.encode(data.toJson());
class Macronutrients {
  Macronutrients({
      int? proteins, 
      int? carbs, 
      int? fats, 
      int? calories,}){
    _proteins = proteins;
    _carbs = carbs;
    _fats = fats;
    _calories = calories;
}

  Macronutrients.fromJson(dynamic json) {
    _proteins = json['proteins'];
    _carbs = json['carbs'];
    _fats = json['fats'];
    _calories = json['calories'];
  }
  int? _proteins;
  int? _carbs;
  int? _fats;
  int? _calories;
Macronutrients copyWith({  int? proteins,
  int? carbs,
  int? fats,
  int? calories,
}) => Macronutrients(  proteins: proteins ?? _proteins,
  carbs: carbs ?? _carbs,
  fats: fats ?? _fats,
  calories: calories ?? _calories,
);
  int? get proteins => _proteins;
  int? get carbs => _carbs;
  int? get fats => _fats;
  int? get calories => _calories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['proteins'] = _proteins;
    map['carbs'] = _carbs;
    map['fats'] = _fats;
    map['calories'] = _calories;
    return map;
  }

}