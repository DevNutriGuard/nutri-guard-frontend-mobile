import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Nutrition Plan Data","mealPlanData":[{"mealPlanUuid":"7136d83e-37b6-4d67-a301-0510fa60bd1f","meal":"Breakfast","recommendedCalories":400,"timing":"2025-01-20T08:00:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":400,"carbs":45,"fats":18,"proteins":12,"fiber":7,"mealOptionUuid":"2b4fdf27-b2e2-4dd7-9f4c-fceb4aeb2c9d","name":"Oatmeal with Almond Butter","description":"Oatmeal provides fiber and whole grains, great for blood sugar control, while almond butter adds healthy fats and protein.","image":null,"vitamins":["Vitamin E","Vitamin B6"],"minerals":["Magnesium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":400,"carbs":40,"fats":10,"proteins":25,"fiber":5,"mealOptionUuid":"b0066e10-7519-46a0-87c1-9ba703a54cfa","name":"Greek Yogurt with Mixed Berries","description":"This meal is rich in protein to support muscle recovery and provides sustained energy. Probiotic yogurt supports gut health for users with digestive issues.","image":null,"vitamins":["Vitamin C","Vitamin D"],"minerals":["Calcium","Potassium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:55:22.649Z","allergens":[{"title":"Dairy","description":"Found in yogurt.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"5dd17b45-3bc3-4d22-b981-0ed6ed37297b","meal":"Morning Snack","recommendedCalories":200,"timing":"2025-01-20T10:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":200,"carbs":30,"fats":5,"proteins":7,"fiber":8,"mealOptionUuid":"57e5ff3d-2b44-474f-8e1d-25f6a44ccc59","name":"Hummus with Carrot Sticks","description":"Hummus is high in protein and fiber, which can help regulate blood sugar levels, while carrots are low in calories and rich in vitamins.","image":null,"vitamins":["Vitamin A","Folate"],"minerals":["Iron","Copper"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"Vegan","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":200,"carbs":35,"fats":10,"proteins":4,"fiber":5,"mealOptionUuid":"d41823aa-88ec-4d3d-aac0-7abe3c5fc34c","name":"Apple Slices with Almond Butter","description":"Apples provide fiber and are low in calories, while almond butter adds healthy fats and proteins for sustained energy.","image":null,"vitamins":["Vitamin C","Potassium"],"minerals":["Calcium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"26209550-09da-4ad1-8aa1-5d485357f633","meal":"Lunch","recommendedCalories":600,"timing":"2025-01-20T12:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":600,"carbs":15,"fats":20,"proteins":40,"fiber":6,"mealOptionUuid":"c7aa4d0f-b42b-4ee7-a3fc-67b13ffa5462","name":"Grilled Chicken Salad","description":"A high-protein salad with greens and colorful veggies promotes satiety, while grilled chicken supports muscle repair and weight loss goals.","image":null,"vitamins":["Vitamin K","Vitamin C"],"minerals":["Sodium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":600,"carbs":60,"fats":15,"proteins":18,"fiber":12,"mealOptionUuid":"259a2d50-b55e-4a6d-aa99-2f1f35c46787","name":"Quinoa Bowl with Chickpeas","description":"Quinoa offers a complete protein source while chickpeas provide fiber, both supporting muscle maintenance in a calorie-controlled diet.","image":null,"vitamins":["Vitamin B6","Folate"],"minerals":["Iron","Magnesium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"dfbdf2f7-d64e-466a-b223-2832fe89e063","meal":"Afternoon Snack","recommendedCalories":150,"timing":"2025-01-20T15:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":150,"carbs":15,"fats":5,"proteins":5,"fiber":3,"mealOptionUuid":"c735465c-e274-4850-85eb-eb2ddb18b689","name":"Cucumber and Hummus","description":"Cucumbers are refreshing, low-calorie veggies that provide crunch, and hummus gives protein and fiber to satisfy cravings.","image":null,"vitamins":["Vitamin K","Vitamin C"],"minerals":["Potassium","Magnesium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"Vegan","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"d97083bd-9891-451f-aea3-fae306e9c79f","meal":"Dinner","recommendedCalories":500,"timing":"2025-01-20T19:00:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":500,"carbs":20,"fats":25,"proteins":30,"fiber":5,"mealOptionUuid":"2de298ec-48a4-48c9-8429-3d3e3d724f9e","name":"Baked Salmon with Asparagus","description":"Rich in Omega-3 fatty acids for heart health, salmon supports energy levels and overall health aligned with weight loss goals.","image":null,"vitamins":["Vitamin D","Vitamin B12"],"minerals":["Selenium","Phosphorus"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Fish","description":"Found in salmon.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]}]}

GetAllMealPlansResponseModel getAllMealPlansResponseModelFromJson(String str) => GetAllMealPlansResponseModel.fromJson(json.decode(str));
String getAllMealPlansResponseModelToJson(GetAllMealPlansResponseModel data) => json.encode(data.toJson());
class GetAllMealPlansResponseModel {
  GetAllMealPlansResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GetAllMealPlansResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GetAllMealPlansResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GetAllMealPlansResponseModel(  status: status ?? _status,
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

/// message : "Nutrition Plan Data"
/// mealPlanData : [{"mealPlanUuid":"7136d83e-37b6-4d67-a301-0510fa60bd1f","meal":"Breakfast","recommendedCalories":400,"timing":"2025-01-20T08:00:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":400,"carbs":45,"fats":18,"proteins":12,"fiber":7,"mealOptionUuid":"2b4fdf27-b2e2-4dd7-9f4c-fceb4aeb2c9d","name":"Oatmeal with Almond Butter","description":"Oatmeal provides fiber and whole grains, great for blood sugar control, while almond butter adds healthy fats and protein.","image":null,"vitamins":["Vitamin E","Vitamin B6"],"minerals":["Magnesium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":400,"carbs":40,"fats":10,"proteins":25,"fiber":5,"mealOptionUuid":"b0066e10-7519-46a0-87c1-9ba703a54cfa","name":"Greek Yogurt with Mixed Berries","description":"This meal is rich in protein to support muscle recovery and provides sustained energy. Probiotic yogurt supports gut health for users with digestive issues.","image":null,"vitamins":["Vitamin C","Vitamin D"],"minerals":["Calcium","Potassium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:55:22.649Z","allergens":[{"title":"Dairy","description":"Found in yogurt.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"5dd17b45-3bc3-4d22-b981-0ed6ed37297b","meal":"Morning Snack","recommendedCalories":200,"timing":"2025-01-20T10:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":200,"carbs":30,"fats":5,"proteins":7,"fiber":8,"mealOptionUuid":"57e5ff3d-2b44-474f-8e1d-25f6a44ccc59","name":"Hummus with Carrot Sticks","description":"Hummus is high in protein and fiber, which can help regulate blood sugar levels, while carrots are low in calories and rich in vitamins.","image":null,"vitamins":["Vitamin A","Folate"],"minerals":["Iron","Copper"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"Vegan","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":200,"carbs":35,"fats":10,"proteins":4,"fiber":5,"mealOptionUuid":"d41823aa-88ec-4d3d-aac0-7abe3c5fc34c","name":"Apple Slices with Almond Butter","description":"Apples provide fiber and are low in calories, while almond butter adds healthy fats and proteins for sustained energy.","image":null,"vitamins":["Vitamin C","Potassium"],"minerals":["Calcium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"26209550-09da-4ad1-8aa1-5d485357f633","meal":"Lunch","recommendedCalories":600,"timing":"2025-01-20T12:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":600,"carbs":15,"fats":20,"proteins":40,"fiber":6,"mealOptionUuid":"c7aa4d0f-b42b-4ee7-a3fc-67b13ffa5462","name":"Grilled Chicken Salad","description":"A high-protein salad with greens and colorful veggies promotes satiety, while grilled chicken supports muscle repair and weight loss goals.","image":null,"vitamins":["Vitamin K","Vitamin C"],"minerals":["Sodium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":600,"carbs":60,"fats":15,"proteins":18,"fiber":12,"mealOptionUuid":"259a2d50-b55e-4a6d-aa99-2f1f35c46787","name":"Quinoa Bowl with Chickpeas","description":"Quinoa offers a complete protein source while chickpeas provide fiber, both supporting muscle maintenance in a calorie-controlled diet.","image":null,"vitamins":["Vitamin B6","Folate"],"minerals":["Iron","Magnesium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"dfbdf2f7-d64e-466a-b223-2832fe89e063","meal":"Afternoon Snack","recommendedCalories":150,"timing":"2025-01-20T15:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":150,"carbs":15,"fats":5,"proteins":5,"fiber":3,"mealOptionUuid":"c735465c-e274-4850-85eb-eb2ddb18b689","name":"Cucumber and Hummus","description":"Cucumbers are refreshing, low-calorie veggies that provide crunch, and hummus gives protein and fiber to satisfy cravings.","image":null,"vitamins":["Vitamin K","Vitamin C"],"minerals":["Potassium","Magnesium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"Vegan","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"d97083bd-9891-451f-aea3-fae306e9c79f","meal":"Dinner","recommendedCalories":500,"timing":"2025-01-20T19:00:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":500,"carbs":20,"fats":25,"proteins":30,"fiber":5,"mealOptionUuid":"2de298ec-48a4-48c9-8429-3d3e3d724f9e","name":"Baked Salmon with Asparagus","description":"Rich in Omega-3 fatty acids for heart health, salmon supports energy levels and overall health aligned with weight loss goals.","image":null,"vitamins":["Vitamin D","Vitamin B12"],"minerals":["Selenium","Phosphorus"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Fish","description":"Found in salmon.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      List<MealPlanData>? mealPlanData,}){
    _message = message;
    _mealPlanData = mealPlanData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    if (json['mealPlanData'] != null) {
      _mealPlanData = [];
      json['mealPlanData'].forEach((v) {
        _mealPlanData?.add(MealPlanData.fromJson(v));
      });
    }
  }
  String? _message;
  List<MealPlanData>? _mealPlanData;
Data copyWith({  String? message,
  List<MealPlanData>? mealPlanData,
}) => Data(  message: message ?? _message,
  mealPlanData: mealPlanData ?? _mealPlanData,
);
  String? get message => _message;
  List<MealPlanData>? get mealPlanData => _mealPlanData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_mealPlanData != null) {
      map['mealPlanData'] = _mealPlanData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// mealPlanUuid : "7136d83e-37b6-4d67-a301-0510fa60bd1f"
/// meal : "Breakfast"
/// recommendedCalories : 400
/// timing : "2025-01-20T08:00:00.000Z"
/// createdAt : "2025-01-20T02:37:59.418Z"
/// updatedAt : "2025-01-20T02:37:59.418Z"
/// mealOptions : [{"totalCalories":400,"carbs":45,"fats":18,"proteins":12,"fiber":7,"mealOptionUuid":"2b4fdf27-b2e2-4dd7-9f4c-fceb4aeb2c9d","name":"Oatmeal with Almond Butter","description":"Oatmeal provides fiber and whole grains, great for blood sugar control, while almond butter adds healthy fats and protein.","image":null,"vitamins":["Vitamin E","Vitamin B6"],"minerals":["Magnesium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":400,"carbs":40,"fats":10,"proteins":25,"fiber":5,"mealOptionUuid":"b0066e10-7519-46a0-87c1-9ba703a54cfa","name":"Greek Yogurt with Mixed Berries","description":"This meal is rich in protein to support muscle recovery and provides sustained energy. Probiotic yogurt supports gut health for users with digestive issues.","image":null,"vitamins":["Vitamin C","Vitamin D"],"minerals":["Calcium","Potassium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:55:22.649Z","allergens":[{"title":"Dairy","description":"Found in yogurt.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]

MealPlanData mealPlanDataFromJson(String str) => MealPlanData.fromJson(json.decode(str));
String mealPlanDataToJson(MealPlanData data) => json.encode(data.toJson());
class MealPlanData {
  MealPlanData({
      String? mealPlanUuid, 
      String? meal, 
      int? recommendedCalories, 
      String? timing, 
      String? createdAt, 
      String? updatedAt, 
      List<MealOptions>? mealOptions,}){
    _mealPlanUuid = mealPlanUuid;
    _meal = meal;
    _recommendedCalories = recommendedCalories;
    _timing = timing;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _mealOptions = mealOptions;
}

  MealPlanData.fromJson(dynamic json) {
    _mealPlanUuid = json['mealPlanUuid'];
    _meal = json['meal'];
    _recommendedCalories = json['recommendedCalories'];
    _timing = json['timing'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    if (json['mealOptions'] != null) {
      _mealOptions = [];
      json['mealOptions'].forEach((v) {
        _mealOptions?.add(MealOptions.fromJson(v));
      });
    }
  }
  String? _mealPlanUuid;
  String? _meal;
  int? _recommendedCalories;
  String? _timing;
  String? _createdAt;
  String? _updatedAt;
  List<MealOptions>? _mealOptions;
MealPlanData copyWith({  String? mealPlanUuid,
  String? meal,
  int? recommendedCalories,
  String? timing,
  String? createdAt,
  String? updatedAt,
  List<MealOptions>? mealOptions,
}) => MealPlanData(  mealPlanUuid: mealPlanUuid ?? _mealPlanUuid,
  meal: meal ?? _meal,
  recommendedCalories: recommendedCalories ?? _recommendedCalories,
  timing: timing ?? _timing,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  mealOptions: mealOptions ?? _mealOptions,
);
  String? get mealPlanUuid => _mealPlanUuid;
  String? get meal => _meal;
  int? get recommendedCalories => _recommendedCalories;
  String? get timing => _timing;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<MealOptions>? get mealOptions => _mealOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mealPlanUuid'] = _mealPlanUuid;
    map['meal'] = _meal;
    map['recommendedCalories'] = _recommendedCalories;
    map['timing'] = _timing;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_mealOptions != null) {
      map['mealOptions'] = _mealOptions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// totalCalories : 400
/// carbs : 45
/// fats : 18
/// proteins : 12
/// fiber : 7
/// mealOptionUuid : "2b4fdf27-b2e2-4dd7-9f4c-fceb4aeb2c9d"
/// name : "Oatmeal with Almond Butter"
/// description : "Oatmeal provides fiber and whole grains, great for blood sugar control, while almond butter adds healthy fats and protein."
/// image : null
/// vitamins : ["Vitamin E","Vitamin B6"]
/// minerals : ["Magnesium","Iron"]
/// createdAt : "2025-01-20T02:37:59.418Z"
/// updatedAt : "2025-01-20T02:37:59.418Z"
/// allergens : [{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}]
/// dietaryCompliance : [{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}]
/// religiousCompliance : [{"title":"Halal","complianceCheck":true}]
/// supplementMedicineCheck : [{"title":"Metformin","type":"Medication","interactionCheck":false}]

MealOptions mealOptionsFromJson(String str) => MealOptions.fromJson(json.decode(str));
String mealOptionsToJson(MealOptions data) => json.encode(data.toJson());
class MealOptions {
  MealOptions({
      int? totalCalories, 
      int? carbs, 
      int? fats, 
      int? proteins, 
      int? fiber, 
      String? mealOptionUuid, 
      String? name, 
      String? description, 
      dynamic image, 
      List<String>? vitamins, 
      List<String>? minerals, 
      String? createdAt, 
      String? updatedAt, 
      List<Allergens>? allergens, 
      List<DietaryCompliance>? dietaryCompliance, 
      List<ReligiousCompliance>? religiousCompliance, 
      List<SupplementMedicineCheck>? supplementMedicineCheck,}){
    _totalCalories = totalCalories;
    _carbs = carbs;
    _fats = fats;
    _proteins = proteins;
    _fiber = fiber;
    _mealOptionUuid = mealOptionUuid;
    _name = name;
    _description = description;
    _image = image;
    _vitamins = vitamins;
    _minerals = minerals;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _allergens = allergens;
    _dietaryCompliance = dietaryCompliance;
    _religiousCompliance = religiousCompliance;
    _supplementMedicineCheck = supplementMedicineCheck;
}

  MealOptions.fromJson(dynamic json) {
    _totalCalories = json['totalCalories'];
    _carbs = json['carbs'];
    _fats = json['fats'];
    _proteins = json['proteins'];
    _fiber = json['fiber'];
    _mealOptionUuid = json['mealOptionUuid'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _vitamins = json['vitamins'] != null ? json['vitamins'].cast<String>() : [];
    _minerals = json['minerals'] != null ? json['minerals'].cast<String>() : [];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
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
  int? _totalCalories;
  int? _carbs;
  int? _fats;
  int? _proteins;
  int? _fiber;
  String? _mealOptionUuid;
  String? _name;
  String? _description;
  dynamic _image;
  List<String>? _vitamins;
  List<String>? _minerals;
  String? _createdAt;
  String? _updatedAt;
  List<Allergens>? _allergens;
  List<DietaryCompliance>? _dietaryCompliance;
  List<ReligiousCompliance>? _religiousCompliance;
  List<SupplementMedicineCheck>? _supplementMedicineCheck;
MealOptions copyWith({  int? totalCalories,
  int? carbs,
  int? fats,
  int? proteins,
  int? fiber,
  String? mealOptionUuid,
  String? name,
  String? description,
  dynamic image,
  List<String>? vitamins,
  List<String>? minerals,
  String? createdAt,
  String? updatedAt,
  List<Allergens>? allergens,
  List<DietaryCompliance>? dietaryCompliance,
  List<ReligiousCompliance>? religiousCompliance,
  List<SupplementMedicineCheck>? supplementMedicineCheck,
}) => MealOptions(  totalCalories: totalCalories ?? _totalCalories,
  carbs: carbs ?? _carbs,
  fats: fats ?? _fats,
  proteins: proteins ?? _proteins,
  fiber: fiber ?? _fiber,
  mealOptionUuid: mealOptionUuid ?? _mealOptionUuid,
  name: name ?? _name,
  description: description ?? _description,
  image: image ?? _image,
  vitamins: vitamins ?? _vitamins,
  minerals: minerals ?? _minerals,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  allergens: allergens ?? _allergens,
  dietaryCompliance: dietaryCompliance ?? _dietaryCompliance,
  religiousCompliance: religiousCompliance ?? _religiousCompliance,
  supplementMedicineCheck: supplementMedicineCheck ?? _supplementMedicineCheck,
);
  int? get totalCalories => _totalCalories;
  int? get carbs => _carbs;
  int? get fats => _fats;
  int? get proteins => _proteins;
  int? get fiber => _fiber;
  String? get mealOptionUuid => _mealOptionUuid;
  String? get name => _name;
  String? get description => _description;
  dynamic get image => _image;
  List<String>? get vitamins => _vitamins;
  List<String>? get minerals => _minerals;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Allergens>? get allergens => _allergens;
  List<DietaryCompliance>? get dietaryCompliance => _dietaryCompliance;
  List<ReligiousCompliance>? get religiousCompliance => _religiousCompliance;
  List<SupplementMedicineCheck>? get supplementMedicineCheck => _supplementMedicineCheck;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalCalories'] = _totalCalories;
    map['carbs'] = _carbs;
    map['fats'] = _fats;
    map['proteins'] = _proteins;
    map['fiber'] = _fiber;
    map['mealOptionUuid'] = _mealOptionUuid;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['vitamins'] = _vitamins;
    map['minerals'] = _minerals;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
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

/// title : "Tree Nuts"
/// description : "Almond butter contains tree nuts."
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