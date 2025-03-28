import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Nutrition Plan Data","nutritionPlanData":{"userNutritionPlanUuid":"1d77df24-f0e6-4833-b5cb-8d53722d2576","totalCaloriesToBurn":2089,"totalCarbsForDay":237,"totalFatsForDay":75,"totalProteinsForDay":130,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealPlans":[{"mealPlanUuid":"7136d83e-37b6-4d67-a301-0510fa60bd1f","meal":"Breakfast","recommendedCalories":400,"timing":"2025-01-20T08:00:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":400,"carbs":45,"fats":18,"proteins":12,"fiber":7,"mealOptionUuid":"2b4fdf27-b2e2-4dd7-9f4c-fceb4aeb2c9d","name":"Oatmeal with Almond Butter","description":"Oatmeal provides fiber and whole grains, great for blood sugar control, while almond butter adds healthy fats and protein.","image":null,"vitamins":["Vitamin E","Vitamin B6"],"minerals":["Magnesium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":400,"carbs":40,"fats":10,"proteins":25,"fiber":5,"mealOptionUuid":"b0066e10-7519-46a0-87c1-9ba703a54cfa","name":"Greek Yogurt with Mixed Berries","description":"This meal is rich in protein to support muscle recovery and provides sustained energy. Probiotic yogurt supports gut health for users with digestive issues.","image":null,"vitamins":["Vitamin C","Vitamin D"],"minerals":["Calcium","Potassium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:55:22.649Z","allergens":[{"title":"Dairy","description":"Found in yogurt.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"5dd17b45-3bc3-4d22-b981-0ed6ed37297b","meal":"Morning Snack","recommendedCalories":200,"timing":"2025-01-20T10:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":200,"carbs":30,"fats":5,"proteins":7,"fiber":8,"mealOptionUuid":"57e5ff3d-2b44-474f-8e1d-25f6a44ccc59","name":"Hummus with Carrot Sticks","description":"Hummus is high in protein and fiber, which can help regulate blood sugar levels, while carrots are low in calories and rich in vitamins.","image":null,"vitamins":["Vitamin A","Folate"],"minerals":["Iron","Copper"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"Vegan","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":200,"carbs":35,"fats":10,"proteins":4,"fiber":5,"mealOptionUuid":"d41823aa-88ec-4d3d-aac0-7abe3c5fc34c","name":"Apple Slices with Almond Butter","description":"Apples provide fiber and are low in calories, while almond butter adds healthy fats and proteins for sustained energy.","image":null,"vitamins":["Vitamin C","Potassium"],"minerals":["Calcium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"26209550-09da-4ad1-8aa1-5d485357f633","meal":"Lunch","recommendedCalories":600,"timing":"2025-01-20T12:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":600,"carbs":15,"fats":20,"proteins":40,"fiber":6,"mealOptionUuid":"c7aa4d0f-b42b-4ee7-a3fc-67b13ffa5462","name":"Grilled Chicken Salad","description":"A high-protein salad with greens and colorful veggies promotes satiety, while grilled chicken supports muscle repair and weight loss goals.","image":null,"vitamins":["Vitamin K","Vitamin C"],"minerals":["Sodium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":600,"carbs":60,"fats":15,"proteins":18,"fiber":12,"mealOptionUuid":"259a2d50-b55e-4a6d-aa99-2f1f35c46787","name":"Quinoa Bowl with Chickpeas","description":"Quinoa offers a complete protein source while chickpeas provide fiber, both supporting muscle maintenance in a calorie-controlled diet.","image":null,"vitamins":["Vitamin B6","Folate"],"minerals":["Iron","Magnesium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"dfbdf2f7-d64e-466a-b223-2832fe89e063","meal":"Afternoon Snack","recommendedCalories":150,"timing":"2025-01-20T15:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":150,"carbs":15,"fats":5,"proteins":5,"fiber":3,"mealOptionUuid":"c735465c-e274-4850-85eb-eb2ddb18b689","name":"Cucumber and Hummus","description":"Cucumbers are refreshing, low-calorie veggies that provide crunch, and hummus gives protein and fiber to satisfy cravings.","image":null,"vitamins":["Vitamin K","Vitamin C"],"minerals":["Potassium","Magnesium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"Vegan","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"d97083bd-9891-451f-aea3-fae306e9c79f","meal":"Dinner","recommendedCalories":500,"timing":"2025-01-20T19:00:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":500,"carbs":20,"fats":25,"proteins":30,"fiber":5,"mealOptionUuid":"2de298ec-48a4-48c9-8429-3d3e3d724f9e","name":"Baked Salmon with Asparagus","description":"Rich in Omega-3 fatty acids for heart health, salmon supports energy levels and overall health aligned with weight loss goals.","image":null,"vitamins":["Vitamin D","Vitamin B12"],"minerals":["Selenium","Phosphorus"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Fish","description":"Found in salmon.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]}],"essentialItems":[{"essentialItemUuid":"75124d47-5b1c-41c2-8972-9cf6a9e68f4a","name":"Mixed Berries","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"6392ba57-6ab2-4e7e-aea0-e5fa56305f62","name":"Almond Butter","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"675ae66b-f31a-49a0-bd0d-9dfc6cb139e2","name":"Oats","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"93087abe-3ee8-4be6-8504-9b4f0943d610","name":"Hummus","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"14b8f16f-93a1-44e5-8c17-3b8ae56b10be","name":"Carrots","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"22b31592-3d9b-476a-9599-cb533d20fe19","name":"Cucumber","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"a3bf255a-2e97-4684-a01d-897ddad7be4b","name":"Chicken Breast","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"f3c01f51-e34e-4fad-a240-bce1f256b8f7","name":"Salmon","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"3930b813-e8ac-4098-b0e2-aa85bb598e89","name":"Asparagus","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"9b75fe13-fcfd-4066-ba2b-385e8d1b363d","name":"Chickpeas","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"517a4b65-99c9-4f3e-a0f6-f4005e9bb95f","name":"Quinoa","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"19db7d15-caa3-4e32-9a2d-59d4e445f4c8","name":"Greek Yogurt","image":null,"checked":true,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T03:05:01.314Z"}],"supplements":[{"supplementUuid":"0c5d6e13-a63b-4de7-8519-8f746bece71f","title":"Omega-3 Fish Oil","description":"Supports heart health, reduces inflammation and maintains overall wellness, particularly important for those concerned with weight management and diabetes.","image":null,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","subtopics":[{"subtopicUuid":"b9ffcb96-640f-4eec-8e74-28e89d565b5c","title":"Heart Health","details":"Omega-3 fatty acids are essential for maintaining cardiovascular health. They help reduce triglyceride levels, lower blood pressure, and prevent plaque buildup in arteries. Regular consumption can support heart function, making it beneficial for users with a focus on weight management and hypertension.","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"subtopicUuid":"33230b41-6eba-476c-b18e-784bb978cea0","title":"Anti-Inflammatory Effects","details":"Omega-3s can reduce inflammation in the body, which is particularly beneficial for those experiencing chronic conditions. Reducing inflammation can help improve energy levels and overall well-being. This is critical for this user, considering their concerns about energy levels and stress.","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"}]}]}}

GetNutritionPlanResponseModel getNutritionPlanResponseModelFromJson(String str) => GetNutritionPlanResponseModel.fromJson(json.decode(str));
String getNutritionPlanResponseModelToJson(GetNutritionPlanResponseModel data) => json.encode(data.toJson());
class GetNutritionPlanResponseModel {
  GetNutritionPlanResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GetNutritionPlanResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GetNutritionPlanResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GetNutritionPlanResponseModel(  status: status ?? _status,
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
/// nutritionPlanData : {"userNutritionPlanUuid":"1d77df24-f0e6-4833-b5cb-8d53722d2576","totalCaloriesToBurn":2089,"totalCarbsForDay":237,"totalFatsForDay":75,"totalProteinsForDay":130,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealPlans":[{"mealPlanUuid":"7136d83e-37b6-4d67-a301-0510fa60bd1f","meal":"Breakfast","recommendedCalories":400,"timing":"2025-01-20T08:00:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":400,"carbs":45,"fats":18,"proteins":12,"fiber":7,"mealOptionUuid":"2b4fdf27-b2e2-4dd7-9f4c-fceb4aeb2c9d","name":"Oatmeal with Almond Butter","description":"Oatmeal provides fiber and whole grains, great for blood sugar control, while almond butter adds healthy fats and protein.","image":null,"vitamins":["Vitamin E","Vitamin B6"],"minerals":["Magnesium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":400,"carbs":40,"fats":10,"proteins":25,"fiber":5,"mealOptionUuid":"b0066e10-7519-46a0-87c1-9ba703a54cfa","name":"Greek Yogurt with Mixed Berries","description":"This meal is rich in protein to support muscle recovery and provides sustained energy. Probiotic yogurt supports gut health for users with digestive issues.","image":null,"vitamins":["Vitamin C","Vitamin D"],"minerals":["Calcium","Potassium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:55:22.649Z","allergens":[{"title":"Dairy","description":"Found in yogurt.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"5dd17b45-3bc3-4d22-b981-0ed6ed37297b","meal":"Morning Snack","recommendedCalories":200,"timing":"2025-01-20T10:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":200,"carbs":30,"fats":5,"proteins":7,"fiber":8,"mealOptionUuid":"57e5ff3d-2b44-474f-8e1d-25f6a44ccc59","name":"Hummus with Carrot Sticks","description":"Hummus is high in protein and fiber, which can help regulate blood sugar levels, while carrots are low in calories and rich in vitamins.","image":null,"vitamins":["Vitamin A","Folate"],"minerals":["Iron","Copper"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"Vegan","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":200,"carbs":35,"fats":10,"proteins":4,"fiber":5,"mealOptionUuid":"d41823aa-88ec-4d3d-aac0-7abe3c5fc34c","name":"Apple Slices with Almond Butter","description":"Apples provide fiber and are low in calories, while almond butter adds healthy fats and proteins for sustained energy.","image":null,"vitamins":["Vitamin C","Potassium"],"minerals":["Calcium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"26209550-09da-4ad1-8aa1-5d485357f633","meal":"Lunch","recommendedCalories":600,"timing":"2025-01-20T12:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":600,"carbs":15,"fats":20,"proteins":40,"fiber":6,"mealOptionUuid":"c7aa4d0f-b42b-4ee7-a3fc-67b13ffa5462","name":"Grilled Chicken Salad","description":"A high-protein salad with greens and colorful veggies promotes satiety, while grilled chicken supports muscle repair and weight loss goals.","image":null,"vitamins":["Vitamin K","Vitamin C"],"minerals":["Sodium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":600,"carbs":60,"fats":15,"proteins":18,"fiber":12,"mealOptionUuid":"259a2d50-b55e-4a6d-aa99-2f1f35c46787","name":"Quinoa Bowl with Chickpeas","description":"Quinoa offers a complete protein source while chickpeas provide fiber, both supporting muscle maintenance in a calorie-controlled diet.","image":null,"vitamins":["Vitamin B6","Folate"],"minerals":["Iron","Magnesium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"dfbdf2f7-d64e-466a-b223-2832fe89e063","meal":"Afternoon Snack","recommendedCalories":150,"timing":"2025-01-20T15:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":150,"carbs":15,"fats":5,"proteins":5,"fiber":3,"mealOptionUuid":"c735465c-e274-4850-85eb-eb2ddb18b689","name":"Cucumber and Hummus","description":"Cucumbers are refreshing, low-calorie veggies that provide crunch, and hummus gives protein and fiber to satisfy cravings.","image":null,"vitamins":["Vitamin K","Vitamin C"],"minerals":["Potassium","Magnesium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"Vegan","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"d97083bd-9891-451f-aea3-fae306e9c79f","meal":"Dinner","recommendedCalories":500,"timing":"2025-01-20T19:00:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":500,"carbs":20,"fats":25,"proteins":30,"fiber":5,"mealOptionUuid":"2de298ec-48a4-48c9-8429-3d3e3d724f9e","name":"Baked Salmon with Asparagus","description":"Rich in Omega-3 fatty acids for heart health, salmon supports energy levels and overall health aligned with weight loss goals.","image":null,"vitamins":["Vitamin D","Vitamin B12"],"minerals":["Selenium","Phosphorus"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Fish","description":"Found in salmon.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]}],"essentialItems":[{"essentialItemUuid":"75124d47-5b1c-41c2-8972-9cf6a9e68f4a","name":"Mixed Berries","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"6392ba57-6ab2-4e7e-aea0-e5fa56305f62","name":"Almond Butter","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"675ae66b-f31a-49a0-bd0d-9dfc6cb139e2","name":"Oats","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"93087abe-3ee8-4be6-8504-9b4f0943d610","name":"Hummus","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"14b8f16f-93a1-44e5-8c17-3b8ae56b10be","name":"Carrots","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"22b31592-3d9b-476a-9599-cb533d20fe19","name":"Cucumber","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"a3bf255a-2e97-4684-a01d-897ddad7be4b","name":"Chicken Breast","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"f3c01f51-e34e-4fad-a240-bce1f256b8f7","name":"Salmon","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"3930b813-e8ac-4098-b0e2-aa85bb598e89","name":"Asparagus","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"9b75fe13-fcfd-4066-ba2b-385e8d1b363d","name":"Chickpeas","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"517a4b65-99c9-4f3e-a0f6-f4005e9bb95f","name":"Quinoa","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"19db7d15-caa3-4e32-9a2d-59d4e445f4c8","name":"Greek Yogurt","image":null,"checked":true,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T03:05:01.314Z"}],"supplements":[{"supplementUuid":"0c5d6e13-a63b-4de7-8519-8f746bece71f","title":"Omega-3 Fish Oil","description":"Supports heart health, reduces inflammation and maintains overall wellness, particularly important for those concerned with weight management and diabetes.","image":null,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","subtopics":[{"subtopicUuid":"b9ffcb96-640f-4eec-8e74-28e89d565b5c","title":"Heart Health","details":"Omega-3 fatty acids are essential for maintaining cardiovascular health. They help reduce triglyceride levels, lower blood pressure, and prevent plaque buildup in arteries. Regular consumption can support heart function, making it beneficial for users with a focus on weight management and hypertension.","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"subtopicUuid":"33230b41-6eba-476c-b18e-784bb978cea0","title":"Anti-Inflammatory Effects","details":"Omega-3s can reduce inflammation in the body, which is particularly beneficial for those experiencing chronic conditions. Reducing inflammation can help improve energy levels and overall well-being. This is critical for this user, considering their concerns about energy levels and stress.","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"}]}]}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      NutritionPlanData? nutritionPlanData,}){
    _message = message;
    _nutritionPlanData = nutritionPlanData;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _nutritionPlanData = json['nutritionPlanData'] != null ? NutritionPlanData.fromJson(json['nutritionPlanData']) : null;
  }
  String? _message;
  NutritionPlanData? _nutritionPlanData;
Data copyWith({  String? message,
  NutritionPlanData? nutritionPlanData,
}) => Data(  message: message ?? _message,
  nutritionPlanData: nutritionPlanData ?? _nutritionPlanData,
);
  String? get message => _message;
  NutritionPlanData? get nutritionPlanData => _nutritionPlanData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_nutritionPlanData != null) {
      map['nutritionPlanData'] = _nutritionPlanData?.toJson();
    }
    return map;
  }

}

/// userNutritionPlanUuid : "1d77df24-f0e6-4833-b5cb-8d53722d2576"
/// totalCaloriesToBurn : 2089
/// totalCarbsForDay : 237
/// totalFatsForDay : 75
/// totalProteinsForDay : 130
/// createdAt : "2025-01-20T02:37:59.418Z"
/// updatedAt : "2025-01-20T02:37:59.418Z"
/// mealPlans : [{"mealPlanUuid":"7136d83e-37b6-4d67-a301-0510fa60bd1f","meal":"Breakfast","recommendedCalories":400,"timing":"2025-01-20T08:00:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":400,"carbs":45,"fats":18,"proteins":12,"fiber":7,"mealOptionUuid":"2b4fdf27-b2e2-4dd7-9f4c-fceb4aeb2c9d","name":"Oatmeal with Almond Butter","description":"Oatmeal provides fiber and whole grains, great for blood sugar control, while almond butter adds healthy fats and protein.","image":null,"vitamins":["Vitamin E","Vitamin B6"],"minerals":["Magnesium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":400,"carbs":40,"fats":10,"proteins":25,"fiber":5,"mealOptionUuid":"b0066e10-7519-46a0-87c1-9ba703a54cfa","name":"Greek Yogurt with Mixed Berries","description":"This meal is rich in protein to support muscle recovery and provides sustained energy. Probiotic yogurt supports gut health for users with digestive issues.","image":null,"vitamins":["Vitamin C","Vitamin D"],"minerals":["Calcium","Potassium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:55:22.649Z","allergens":[{"title":"Dairy","description":"Found in yogurt.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"5dd17b45-3bc3-4d22-b981-0ed6ed37297b","meal":"Morning Snack","recommendedCalories":200,"timing":"2025-01-20T10:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":200,"carbs":30,"fats":5,"proteins":7,"fiber":8,"mealOptionUuid":"57e5ff3d-2b44-474f-8e1d-25f6a44ccc59","name":"Hummus with Carrot Sticks","description":"Hummus is high in protein and fiber, which can help regulate blood sugar levels, while carrots are low in calories and rich in vitamins.","image":null,"vitamins":["Vitamin A","Folate"],"minerals":["Iron","Copper"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"Vegan","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":200,"carbs":35,"fats":10,"proteins":4,"fiber":5,"mealOptionUuid":"d41823aa-88ec-4d3d-aac0-7abe3c5fc34c","name":"Apple Slices with Almond Butter","description":"Apples provide fiber and are low in calories, while almond butter adds healthy fats and proteins for sustained energy.","image":null,"vitamins":["Vitamin C","Potassium"],"minerals":["Calcium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"26209550-09da-4ad1-8aa1-5d485357f633","meal":"Lunch","recommendedCalories":600,"timing":"2025-01-20T12:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":600,"carbs":15,"fats":20,"proteins":40,"fiber":6,"mealOptionUuid":"c7aa4d0f-b42b-4ee7-a3fc-67b13ffa5462","name":"Grilled Chicken Salad","description":"A high-protein salad with greens and colorful veggies promotes satiety, while grilled chicken supports muscle repair and weight loss goals.","image":null,"vitamins":["Vitamin K","Vitamin C"],"minerals":["Sodium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":600,"carbs":60,"fats":15,"proteins":18,"fiber":12,"mealOptionUuid":"259a2d50-b55e-4a6d-aa99-2f1f35c46787","name":"Quinoa Bowl with Chickpeas","description":"Quinoa offers a complete protein source while chickpeas provide fiber, both supporting muscle maintenance in a calorie-controlled diet.","image":null,"vitamins":["Vitamin B6","Folate"],"minerals":["Iron","Magnesium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"dfbdf2f7-d64e-466a-b223-2832fe89e063","meal":"Afternoon Snack","recommendedCalories":150,"timing":"2025-01-20T15:30:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":150,"carbs":15,"fats":5,"proteins":5,"fiber":3,"mealOptionUuid":"c735465c-e274-4850-85eb-eb2ddb18b689","name":"Cucumber and Hummus","description":"Cucumbers are refreshing, low-calorie veggies that provide crunch, and hummus gives protein and fiber to satisfy cravings.","image":null,"vitamins":["Vitamin K","Vitamin C"],"minerals":["Potassium","Magnesium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"None","description":"This meal is allergen-free.","complianceCheck":true}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"Vegan","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]},{"mealPlanUuid":"d97083bd-9891-451f-aea3-fae306e9c79f","meal":"Dinner","recommendedCalories":500,"timing":"2025-01-20T19:00:00.000Z","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","mealOptions":[{"totalCalories":500,"carbs":20,"fats":25,"proteins":30,"fiber":5,"mealOptionUuid":"2de298ec-48a4-48c9-8429-3d3e3d724f9e","name":"Baked Salmon with Asparagus","description":"Rich in Omega-3 fatty acids for heart health, salmon supports energy levels and overall health aligned with weight loss goals.","image":null,"vitamins":["Vitamin D","Vitamin B12"],"minerals":["Selenium","Phosphorus"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Fish","description":"Found in salmon.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]}]
/// essentialItems : [{"essentialItemUuid":"75124d47-5b1c-41c2-8972-9cf6a9e68f4a","name":"Mixed Berries","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"6392ba57-6ab2-4e7e-aea0-e5fa56305f62","name":"Almond Butter","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"675ae66b-f31a-49a0-bd0d-9dfc6cb139e2","name":"Oats","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"93087abe-3ee8-4be6-8504-9b4f0943d610","name":"Hummus","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"14b8f16f-93a1-44e5-8c17-3b8ae56b10be","name":"Carrots","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"22b31592-3d9b-476a-9599-cb533d20fe19","name":"Cucumber","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"a3bf255a-2e97-4684-a01d-897ddad7be4b","name":"Chicken Breast","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"f3c01f51-e34e-4fad-a240-bce1f256b8f7","name":"Salmon","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"3930b813-e8ac-4098-b0e2-aa85bb598e89","name":"Asparagus","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"9b75fe13-fcfd-4066-ba2b-385e8d1b363d","name":"Chickpeas","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"517a4b65-99c9-4f3e-a0f6-f4005e9bb95f","name":"Quinoa","image":null,"checked":false,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"essentialItemUuid":"19db7d15-caa3-4e32-9a2d-59d4e445f4c8","name":"Greek Yogurt","image":null,"checked":true,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T03:05:01.314Z"}]
/// supplements : [{"supplementUuid":"0c5d6e13-a63b-4de7-8519-8f746bece71f","title":"Omega-3 Fish Oil","description":"Supports heart health, reduces inflammation and maintains overall wellness, particularly important for those concerned with weight management and diabetes.","image":null,"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","subtopics":[{"subtopicUuid":"b9ffcb96-640f-4eec-8e74-28e89d565b5c","title":"Heart Health","details":"Omega-3 fatty acids are essential for maintaining cardiovascular health. They help reduce triglyceride levels, lower blood pressure, and prevent plaque buildup in arteries. Regular consumption can support heart function, making it beneficial for users with a focus on weight management and hypertension.","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"subtopicUuid":"33230b41-6eba-476c-b18e-784bb978cea0","title":"Anti-Inflammatory Effects","details":"Omega-3s can reduce inflammation in the body, which is particularly beneficial for those experiencing chronic conditions. Reducing inflammation can help improve energy levels and overall well-being. This is critical for this user, considering their concerns about energy levels and stress.","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"}]}]

NutritionPlanData nutritionPlanDataFromJson(String str) => NutritionPlanData.fromJson(json.decode(str));
String nutritionPlanDataToJson(NutritionPlanData data) => json.encode(data.toJson());
class NutritionPlanData {
  NutritionPlanData({
      String? userNutritionPlanUuid, 
      int? totalCaloriesToBurn, 
      int? totalCarbsForDay, 
      int? totalFatsForDay, 
      int? totalProteinsForDay, 
      String? createdAt, 
      String? updatedAt, 
      List<MealPlans>? mealPlans, 
      List<EssentialItems>? essentialItems, 
      List<Supplements>? supplements,}){
    _userNutritionPlanUuid = userNutritionPlanUuid;
    _totalCaloriesToBurn = totalCaloriesToBurn;
    _totalCarbsForDay = totalCarbsForDay;
    _totalFatsForDay = totalFatsForDay;
    _totalProteinsForDay = totalProteinsForDay;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _mealPlans = mealPlans;
    _essentialItems = essentialItems;
    _supplements = supplements;
}

  NutritionPlanData.fromJson(dynamic json) {
    _userNutritionPlanUuid = json['userNutritionPlanUuid'];
    _totalCaloriesToBurn = json['totalCaloriesToBurn'];
    _totalCarbsForDay = json['totalCarbsForDay'];
    _totalFatsForDay = json['totalFatsForDay'];
    _totalProteinsForDay = json['totalProteinsForDay'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    if (json['mealPlans'] != null) {
      _mealPlans = [];
      json['mealPlans'].forEach((v) {
        _mealPlans?.add(MealPlans.fromJson(v));
      });
    }
    if (json['essentialItems'] != null) {
      _essentialItems = [];
      json['essentialItems'].forEach((v) {
        _essentialItems?.add(EssentialItems.fromJson(v));
      });
    }
    if (json['supplements'] != null) {
      _supplements = [];
      json['supplements'].forEach((v) {
        _supplements?.add(Supplements.fromJson(v));
      });
    }
  }
  String? _userNutritionPlanUuid;
  int? _totalCaloriesToBurn;
  int? _totalCarbsForDay;
  int? _totalFatsForDay;
  int? _totalProteinsForDay;
  String? _createdAt;
  String? _updatedAt;
  List<MealPlans>? _mealPlans;
  List<EssentialItems>? _essentialItems;
  List<Supplements>? _supplements;
NutritionPlanData copyWith({  String? userNutritionPlanUuid,
  int? totalCaloriesToBurn,
  int? totalCarbsForDay,
  int? totalFatsForDay,
  int? totalProteinsForDay,
  String? createdAt,
  String? updatedAt,
  List<MealPlans>? mealPlans,
  List<EssentialItems>? essentialItems,
  List<Supplements>? supplements,
}) => NutritionPlanData(  userNutritionPlanUuid: userNutritionPlanUuid ?? _userNutritionPlanUuid,
  totalCaloriesToBurn: totalCaloriesToBurn ?? _totalCaloriesToBurn,
  totalCarbsForDay: totalCarbsForDay ?? _totalCarbsForDay,
  totalFatsForDay: totalFatsForDay ?? _totalFatsForDay,
  totalProteinsForDay: totalProteinsForDay ?? _totalProteinsForDay,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  mealPlans: mealPlans ?? _mealPlans,
  essentialItems: essentialItems ?? _essentialItems,
  supplements: supplements ?? _supplements,
);
  String? get userNutritionPlanUuid => _userNutritionPlanUuid;
  int? get totalCaloriesToBurn => _totalCaloriesToBurn;
  int? get totalCarbsForDay => _totalCarbsForDay;
  int? get totalFatsForDay => _totalFatsForDay;
  int? get totalProteinsForDay => _totalProteinsForDay;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<MealPlans>? get mealPlans => _mealPlans;
  List<EssentialItems>? get essentialItems => _essentialItems;
  List<Supplements>? get supplements => _supplements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userNutritionPlanUuid'] = _userNutritionPlanUuid;
    map['totalCaloriesToBurn'] = _totalCaloriesToBurn;
    map['totalCarbsForDay'] = _totalCarbsForDay;
    map['totalFatsForDay'] = _totalFatsForDay;
    map['totalProteinsForDay'] = _totalProteinsForDay;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_mealPlans != null) {
      map['mealPlans'] = _mealPlans?.map((v) => v.toJson()).toList();
    }
    if (_essentialItems != null) {
      map['essentialItems'] = _essentialItems?.map((v) => v.toJson()).toList();
    }
    if (_supplements != null) {
      map['supplements'] = _supplements?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// supplementUuid : "0c5d6e13-a63b-4de7-8519-8f746bece71f"
/// title : "Omega-3 Fish Oil"
/// description : "Supports heart health, reduces inflammation and maintains overall wellness, particularly important for those concerned with weight management and diabetes."
/// image : null
/// createdAt : "2025-01-20T02:37:59.418Z"
/// updatedAt : "2025-01-20T02:37:59.418Z"
/// subtopics : [{"subtopicUuid":"b9ffcb96-640f-4eec-8e74-28e89d565b5c","title":"Heart Health","details":"Omega-3 fatty acids are essential for maintaining cardiovascular health. They help reduce triglyceride levels, lower blood pressure, and prevent plaque buildup in arteries. Regular consumption can support heart function, making it beneficial for users with a focus on weight management and hypertension.","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"},{"subtopicUuid":"33230b41-6eba-476c-b18e-784bb978cea0","title":"Anti-Inflammatory Effects","details":"Omega-3s can reduce inflammation in the body, which is particularly beneficial for those experiencing chronic conditions. Reducing inflammation can help improve energy levels and overall well-being. This is critical for this user, considering their concerns about energy levels and stress.","createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z"}]

Supplements supplementsFromJson(String str) => Supplements.fromJson(json.decode(str));
String supplementsToJson(Supplements data) => json.encode(data.toJson());
class Supplements {
  Supplements({
      String? supplementUuid, 
      String? title, 
      String? description, 
      dynamic image, 
      String? createdAt, 
      String? updatedAt, 
      List<Subtopics>? subtopics,}){
    _supplementUuid = supplementUuid;
    _title = title;
    _description = description;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subtopics = subtopics;
}

  Supplements.fromJson(dynamic json) {
    _supplementUuid = json['supplementUuid'];
    _title = json['title'];
    _description = json['description'];
    _image = json['image'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    if (json['subtopics'] != null) {
      _subtopics = [];
      json['subtopics'].forEach((v) {
        _subtopics?.add(Subtopics.fromJson(v));
      });
    }
  }
  String? _supplementUuid;
  String? _title;
  String? _description;
  dynamic _image;
  String? _createdAt;
  String? _updatedAt;
  List<Subtopics>? _subtopics;
Supplements copyWith({  String? supplementUuid,
  String? title,
  String? description,
  dynamic image,
  String? createdAt,
  String? updatedAt,
  List<Subtopics>? subtopics,
}) => Supplements(  supplementUuid: supplementUuid ?? _supplementUuid,
  title: title ?? _title,
  description: description ?? _description,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  subtopics: subtopics ?? _subtopics,
);
  String? get supplementUuid => _supplementUuid;
  String? get title => _title;
  String? get description => _description;
  dynamic get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Subtopics>? get subtopics => _subtopics;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['supplementUuid'] = _supplementUuid;
    map['title'] = _title;
    map['description'] = _description;
    map['image'] = _image;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_subtopics != null) {
      map['subtopics'] = _subtopics?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// subtopicUuid : "b9ffcb96-640f-4eec-8e74-28e89d565b5c"
/// title : "Heart Health"
/// details : "Omega-3 fatty acids are essential for maintaining cardiovascular health. They help reduce triglyceride levels, lower blood pressure, and prevent plaque buildup in arteries. Regular consumption can support heart function, making it beneficial for users with a focus on weight management and hypertension."
/// createdAt : "2025-01-20T02:37:59.418Z"
/// updatedAt : "2025-01-20T02:37:59.418Z"

Subtopics subtopicsFromJson(String str) => Subtopics.fromJson(json.decode(str));
String subtopicsToJson(Subtopics data) => json.encode(data.toJson());
class Subtopics {
  Subtopics({
      String? subtopicUuid, 
      String? title, 
      String? details, 
      String? createdAt, 
      String? updatedAt,}){
    _subtopicUuid = subtopicUuid;
    _title = title;
    _details = details;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Subtopics.fromJson(dynamic json) {
    _subtopicUuid = json['subtopicUuid'];
    _title = json['title'];
    _details = json['details'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _subtopicUuid;
  String? _title;
  String? _details;
  String? _createdAt;
  String? _updatedAt;
Subtopics copyWith({  String? subtopicUuid,
  String? title,
  String? details,
  String? createdAt,
  String? updatedAt,
}) => Subtopics(  subtopicUuid: subtopicUuid ?? _subtopicUuid,
  title: title ?? _title,
  details: details ?? _details,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get subtopicUuid => _subtopicUuid;
  String? get title => _title;
  String? get details => _details;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subtopicUuid'] = _subtopicUuid;
    map['title'] = _title;
    map['details'] = _details;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}

/// essentialItemUuid : "75124d47-5b1c-41c2-8972-9cf6a9e68f4a"
/// name : "Mixed Berries"
/// image : null
/// checked : false
/// createdAt : "2025-01-20T02:37:59.418Z"
/// updatedAt : "2025-01-20T02:37:59.418Z"

EssentialItems essentialItemsFromJson(String str) => EssentialItems.fromJson(json.decode(str));
String essentialItemsToJson(EssentialItems data) => json.encode(data.toJson());
class EssentialItems {
  EssentialItems({
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

  EssentialItems.fromJson(dynamic json) {
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
EssentialItems copyWith({  String? essentialItemUuid,
  String? name,
  dynamic image,
  bool? checked,
  String? createdAt,
  String? updatedAt,
}) => EssentialItems(  essentialItemUuid: essentialItemUuid ?? _essentialItemUuid,
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

/// mealPlanUuid : "7136d83e-37b6-4d67-a301-0510fa60bd1f"
/// meal : "Breakfast"
/// recommendedCalories : 400
/// timing : "2025-01-20T08:00:00.000Z"
/// createdAt : "2025-01-20T02:37:59.418Z"
/// updatedAt : "2025-01-20T02:37:59.418Z"
/// mealOptions : [{"totalCalories":400,"carbs":45,"fats":18,"proteins":12,"fiber":7,"mealOptionUuid":"2b4fdf27-b2e2-4dd7-9f4c-fceb4aeb2c9d","name":"Oatmeal with Almond Butter","description":"Oatmeal provides fiber and whole grains, great for blood sugar control, while almond butter adds healthy fats and protein.","image":null,"vitamins":["Vitamin E","Vitamin B6"],"minerals":["Magnesium","Iron"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:37:59.418Z","allergens":[{"title":"Tree Nuts","description":"Almond butter contains tree nuts.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]},{"totalCalories":400,"carbs":40,"fats":10,"proteins":25,"fiber":5,"mealOptionUuid":"b0066e10-7519-46a0-87c1-9ba703a54cfa","name":"Greek Yogurt with Mixed Berries","description":"This meal is rich in protein to support muscle recovery and provides sustained energy. Probiotic yogurt supports gut health for users with digestive issues.","image":null,"vitamins":["Vitamin C","Vitamin D"],"minerals":["Calcium","Potassium"],"createdAt":"2025-01-20T02:37:59.418Z","updatedAt":"2025-01-20T02:55:22.649Z","allergens":[{"title":"Dairy","description":"Found in yogurt.","complianceCheck":false}],"dietaryCompliance":[{"title":"Halal","complianceCheck":true},{"title":"High Protein","complianceCheck":true}],"religiousCompliance":[{"title":"Halal","complianceCheck":true}],"supplementMedicineCheck":[{"title":"Metformin","type":"Medication","interactionCheck":false}]}]

MealPlans mealPlansFromJson(String str) => MealPlans.fromJson(json.decode(str));
String mealPlansToJson(MealPlans data) => json.encode(data.toJson());
class MealPlans {
  MealPlans({
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

  MealPlans.fromJson(dynamic json) {
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
MealPlans copyWith({  String? mealPlanUuid,
  String? meal,
  int? recommendedCalories,
  String? timing,
  String? createdAt,
  String? updatedAt,
  List<MealOptions>? mealOptions,
}) => MealPlans(  mealPlanUuid: mealPlanUuid ?? _mealPlanUuid,
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