/// status : "success"
/// statusCode : 201
/// data : {"foodDetails":{"foodDescription":"Avocado toast is a nutritious meal featuring whole grain bread topped with ripe avocado, providing healthy fats, fiber, and vitamins.","foodName":"Avocado Toast","brandName":"","organicLabelVerification":{"title":"Undefined","isOrganic":false},"certifications":[{"certified":false,"description":""}],"nutritionalInfo":{"calories":"250","macronutrients":{"protein":"6g","carbohydrates":"30g","fat":"12g","fiber":"8g"},"vitamins":["Vitamin K","Vitamin E","Vitamin C"],"minerals":["Potassium","Magnesium"]},"allergenDetection":[{"title":"Allergen","description":"Contains gluten if made with regular bread."}],"interactionAnalysis":[{"title":"None","description":"No known interactions with common medications."}],"dietaryCompliance":[{"compliance":"Low Carb","isCompliant":false},{"compliance":"Weight Loss","isCompliant":true}],"religiousCompliance":[{"compliance":"Kosher","isCompliant":true}],"foodPicture":null},"message":"translations.scanner.saveFoodProductScanSuccess"}

class FoodScanResponse {
  FoodScanResponse({
    String? status,
    num? statusCode,
    Data? data,
  }) {
    _status = status;
    _statusCode = statusCode;
    _data = data;
  }

  FoodScanResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  num? _statusCode;
  Data? _data;
  FoodScanResponse copyWith({
    String? status,
    num? statusCode,
    Data? data,
  }) =>
      FoodScanResponse(
        status: status ?? _status,
        statusCode: statusCode ?? _statusCode,
        data: data ?? _data,
      );
  String? get status => _status;
  num? get statusCode => _statusCode;
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

/// foodDetails : {"foodDescription":"Avocado toast is a nutritious meal featuring whole grain bread topped with ripe avocado, providing healthy fats, fiber, and vitamins.","foodName":"Avocado Toast","brandName":"","organicLabelVerification":{"title":"Undefined","isOrganic":false},"certifications":[{"certified":false,"description":""}],"nutritionalInfo":{"calories":"250","macronutrients":{"protein":"6g","carbohydrates":"30g","fat":"12g","fiber":"8g"},"vitamins":["Vitamin K","Vitamin E","Vitamin C"],"minerals":["Potassium","Magnesium"]},"allergenDetection":[{"title":"Allergen","description":"Contains gluten if made with regular bread."}],"interactionAnalysis":[{"title":"None","description":"No known interactions with common medications."}],"dietaryCompliance":[{"compliance":"Low Carb","isCompliant":false},{"compliance":"Weight Loss","isCompliant":true}],"religiousCompliance":[{"compliance":"Kosher","isCompliant":true}],"foodPicture":null}
/// message : "translations.scanner.saveFoodProductScanSuccess"

class Data {
  Data({
    FoodDetails? foodDetails,
    String? message,
  }) {
    _foodDetails = foodDetails;
    _message = message;
  }

  Data.fromJson(dynamic json) {
    _foodDetails = json['foodDetails'] != null
        ? FoodDetails.fromJson(json['foodDetails'])
        : null;
    _message = json['message'];
  }
  FoodDetails? _foodDetails;
  String? _message;
  Data copyWith({
    FoodDetails? foodDetails,
    String? message,
  }) =>
      Data(
        foodDetails: foodDetails ?? _foodDetails,
        message: message ?? _message,
      );
  FoodDetails? get foodDetails => _foodDetails;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_foodDetails != null) {
      map['foodDetails'] = _foodDetails?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

/// foodDescription : "Avocado toast is a nutritious meal featuring whole grain bread topped with ripe avocado, providing healthy fats, fiber, and vitamins."
/// foodName : "Avocado Toast"
/// brandName : ""
/// organicLabelVerification : {"title":"Undefined","isOrganic":false}
/// certifications : [{"certified":false,"description":""}]
/// nutritionalInfo : {"calories":"250","macronutrients":{"protein":"6g","carbohydrates":"30g","fat":"12g","fiber":"8g"},"vitamins":["Vitamin K","Vitamin E","Vitamin C"],"minerals":["Potassium","Magnesium"]}
/// allergenDetection : [{"title":"Allergen","description":"Contains gluten if made with regular bread."}]
/// interactionAnalysis : [{"title":"None","description":"No known interactions with common medications."}]
/// dietaryCompliance : [{"compliance":"Low Carb","isCompliant":false},{"compliance":"Weight Loss","isCompliant":true}]
/// religiousCompliance : [{"compliance":"Kosher","isCompliant":true}]
/// foodPicture : null

class FoodDetails {
  FoodDetails({
    String? foodDescription,
    String? foodName,
    String? brandName,
    OrganicLabelVerification? organicLabelVerification,
    List<Certifications>? certifications,
    NutritionalInfo? nutritionalInfo,
    List<AllergenDetection>? allergenDetection,
    List<InteractionAnalysis>? interactionAnalysis,
    List<DietaryCompliance>? dietaryCompliance,
    List<ReligiousCompliance>? religiousCompliance,
    dynamic foodPicture,
  }) {
    _foodDescription = foodDescription;
    _foodName = foodName;
    _brandName = brandName;
    _organicLabelVerification = organicLabelVerification;
    _certifications = certifications;
    _nutritionalInfo = nutritionalInfo;
    _allergenDetection = allergenDetection;
    _interactionAnalysis = interactionAnalysis;
    _dietaryCompliance = dietaryCompliance;
    _religiousCompliance = religiousCompliance;
    _foodPicture = foodPicture;
  }

  FoodDetails.fromJson(dynamic json) {
    _foodDescription = json['foodDescription'];
    _foodName = json['foodName'];
    _brandName = json['brandName'];
    _organicLabelVerification = json['organicLabelVerification'] != null
        ? OrganicLabelVerification.fromJson(json['organicLabelVerification'])
        : null;
    if (json['certifications'] != null) {
      _certifications = [];
      json['certifications'].forEach((v) {
        _certifications?.add(Certifications.fromJson(v));
      });
    }
    _nutritionalInfo = json['nutritionalInfo'] != null
        ? NutritionalInfo.fromJson(json['nutritionalInfo'])
        : null;
    if (json['allergenDetection'] != null) {
      _allergenDetection = [];
      json['allergenDetection'].forEach((v) {
        _allergenDetection?.add(AllergenDetection.fromJson(v));
      });
    }
    if (json['interactionAnalysis'] != null) {
      _interactionAnalysis = [];
      json['interactionAnalysis'].forEach((v) {
        _interactionAnalysis?.add(InteractionAnalysis.fromJson(v));
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
    _foodPicture = json['foodPicture'];
  }
  String? _foodDescription;
  String? _foodName;
  String? _brandName;
  OrganicLabelVerification? _organicLabelVerification;
  List<Certifications>? _certifications;
  NutritionalInfo? _nutritionalInfo;
  List<AllergenDetection>? _allergenDetection;
  List<InteractionAnalysis>? _interactionAnalysis;
  List<DietaryCompliance>? _dietaryCompliance;
  List<ReligiousCompliance>? _religiousCompliance;
  dynamic _foodPicture;
  FoodDetails copyWith({
    String? foodDescription,
    String? foodName,
    String? brandName,
    OrganicLabelVerification? organicLabelVerification,
    List<Certifications>? certifications,
    NutritionalInfo? nutritionalInfo,
    List<AllergenDetection>? allergenDetection,
    List<InteractionAnalysis>? interactionAnalysis,
    List<DietaryCompliance>? dietaryCompliance,
    List<ReligiousCompliance>? religiousCompliance,
    dynamic foodPicture,
  }) =>
      FoodDetails(
        foodDescription: foodDescription ?? _foodDescription,
        foodName: foodName ?? _foodName,
        brandName: brandName ?? _brandName,
        organicLabelVerification:
            organicLabelVerification ?? _organicLabelVerification,
        certifications: certifications ?? _certifications,
        nutritionalInfo: nutritionalInfo ?? _nutritionalInfo,
        allergenDetection: allergenDetection ?? _allergenDetection,
        interactionAnalysis: interactionAnalysis ?? _interactionAnalysis,
        dietaryCompliance: dietaryCompliance ?? _dietaryCompliance,
        religiousCompliance: religiousCompliance ?? _religiousCompliance,
        foodPicture: foodPicture ?? _foodPicture,
      );
  String? get foodDescription => _foodDescription;
  String? get foodName => _foodName;
  String? get brandName => _brandName;
  OrganicLabelVerification? get organicLabelVerification =>
      _organicLabelVerification;
  List<Certifications>? get certifications => _certifications;
  NutritionalInfo? get nutritionalInfo => _nutritionalInfo;
  List<AllergenDetection>? get allergenDetection => _allergenDetection;
  List<InteractionAnalysis>? get interactionAnalysis => _interactionAnalysis;
  List<DietaryCompliance>? get dietaryCompliance => _dietaryCompliance;
  List<ReligiousCompliance>? get religiousCompliance => _religiousCompliance;
  dynamic get foodPicture => _foodPicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['foodDescription'] = _foodDescription;
    map['foodName'] = _foodName;
    map['brandName'] = _brandName;
    if (_organicLabelVerification != null) {
      map['organicLabelVerification'] = _organicLabelVerification?.toJson();
    }
    if (_certifications != null) {
      map['certifications'] = _certifications?.map((v) => v.toJson()).toList();
    }
    if (_nutritionalInfo != null) {
      map['nutritionalInfo'] = _nutritionalInfo?.toJson();
    }
    if (_allergenDetection != null) {
      map['allergenDetection'] =
          _allergenDetection?.map((v) => v.toJson()).toList();
    }
    if (_interactionAnalysis != null) {
      map['interactionAnalysis'] =
          _interactionAnalysis?.map((v) => v.toJson()).toList();
    }
    if (_dietaryCompliance != null) {
      map['dietaryCompliance'] =
          _dietaryCompliance?.map((v) => v.toJson()).toList();
    }
    if (_religiousCompliance != null) {
      map['religiousCompliance'] =
          _religiousCompliance?.map((v) => v.toJson()).toList();
    }
    map['foodPicture'] = _foodPicture;
    return map;
  }
}

/// compliance : "Kosher"
/// isCompliant : true

class ReligiousCompliance {
  ReligiousCompliance({
    String? compliance,
    bool? isCompliant,
  }) {
    _compliance = compliance;
    _isCompliant = isCompliant;
  }

  ReligiousCompliance.fromJson(dynamic json) {
    _compliance = json['compliance'];
    _isCompliant = json['isCompliant'];
  }
  String? _compliance;
  bool? _isCompliant;
  ReligiousCompliance copyWith({
    String? compliance,
    bool? isCompliant,
  }) =>
      ReligiousCompliance(
        compliance: compliance ?? _compliance,
        isCompliant: isCompliant ?? _isCompliant,
      );
  String? get compliance => _compliance;
  bool? get isCompliant => _isCompliant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['compliance'] = _compliance;
    map['isCompliant'] = _isCompliant;
    return map;
  }
}

/// compliance : "Low Carb"
/// isCompliant : false

class DietaryCompliance {
  DietaryCompliance({
    String? compliance,
    bool? isCompliant,
  }) {
    _compliance = compliance;
    _isCompliant = isCompliant;
  }

  DietaryCompliance.fromJson(dynamic json) {
    _compliance = json['compliance'];
    _isCompliant = json['isCompliant'];
  }
  String? _compliance;
  bool? _isCompliant;
  DietaryCompliance copyWith({
    String? compliance,
    bool? isCompliant,
  }) =>
      DietaryCompliance(
        compliance: compliance ?? _compliance,
        isCompliant: isCompliant ?? _isCompliant,
      );
  String? get compliance => _compliance;
  bool? get isCompliant => _isCompliant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['compliance'] = _compliance;
    map['isCompliant'] = _isCompliant;
    return map;
  }
}

/// title : "None"
/// description : "No known interactions with common medications."

class InteractionAnalysis {
  InteractionAnalysis({
    String? title,
    String? description,
  }) {
    _title = title;
    _description = description;
  }

  InteractionAnalysis.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
  }
  String? _title;
  String? _description;
  InteractionAnalysis copyWith({
    String? title,
    String? description,
  }) =>
      InteractionAnalysis(
        title: title ?? _title,
        description: description ?? _description,
      );
  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }
}

/// title : "Allergen"
/// description : "Contains gluten if made with regular bread."

class AllergenDetection {
  AllergenDetection({
    String? title,
    String? description,
  }) {
    _title = title;
    _description = description;
  }

  AllergenDetection.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
  }
  String? _title;
  String? _description;
  AllergenDetection copyWith({
    String? title,
    String? description,
  }) =>
      AllergenDetection(
        title: title ?? _title,
        description: description ?? _description,
      );
  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }
}

/// calories : "250"
/// macronutrients : {"protein":"6g","carbohydrates":"30g","fat":"12g","fiber":"8g"}
/// vitamins : ["Vitamin K","Vitamin E","Vitamin C"]
/// minerals : ["Potassium","Magnesium"]

class NutritionalInfo {
  NutritionalInfo({
    String? calories,
    Macronutrients? macronutrients,
    List<String>? vitamins,
    List<String>? minerals,
  }) {
    _calories = calories;
    _macronutrients = macronutrients;
    _vitamins = vitamins;
    _minerals = minerals;
  }

  NutritionalInfo.fromJson(dynamic json) {
    _calories = json['calories'];
    _macronutrients = json['macronutrients'] != null
        ? Macronutrients.fromJson(json['macronutrients'])
        : null;
    _vitamins = json['vitamins'] != null ? json['vitamins'].cast<String>() : [];
    _minerals = json['minerals'] != null ? json['minerals'].cast<String>() : [];
  }
  String? _calories;
  Macronutrients? _macronutrients;
  List<String>? _vitamins;
  List<String>? _minerals;
  NutritionalInfo copyWith({
    String? calories,
    Macronutrients? macronutrients,
    List<String>? vitamins,
    List<String>? minerals,
  }) =>
      NutritionalInfo(
        calories: calories ?? _calories,
        macronutrients: macronutrients ?? _macronutrients,
        vitamins: vitamins ?? _vitamins,
        minerals: minerals ?? _minerals,
      );
  String? get calories => _calories;
  Macronutrients? get macronutrients => _macronutrients;
  List<String>? get vitamins => _vitamins;
  List<String>? get minerals => _minerals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['calories'] = _calories;
    if (_macronutrients != null) {
      map['macronutrients'] = _macronutrients?.toJson();
    }
    map['vitamins'] = _vitamins;
    map['minerals'] = _minerals;
    return map;
  }
}

/// protein : "6g"
/// carbohydrates : "30g"
/// fat : "12g"
/// fiber : "8g"

class Macronutrients {
  Macronutrients({
    String? protein,
    String? carbohydrates,
    String? fat,
    String? fiber,
  }) {
    _protein = protein;
    _carbohydrates = carbohydrates;
    _fat = fat;
    _fiber = fiber;
  }

  Macronutrients.fromJson(dynamic json) {
    _protein = json['protein'];
    _carbohydrates = json['carbohydrates'];
    _fat = json['fat'];
    _fiber = json['fiber'];
  }
  String? _protein;
  String? _carbohydrates;
  String? _fat;
  String? _fiber;
  Macronutrients copyWith({
    String? protein,
    String? carbohydrates,
    String? fat,
    String? fiber,
  }) =>
      Macronutrients(
        protein: protein ?? _protein,
        carbohydrates: carbohydrates ?? _carbohydrates,
        fat: fat ?? _fat,
        fiber: fiber ?? _fiber,
      );
  String? get protein => _protein;
  String? get carbohydrates => _carbohydrates;
  String? get fat => _fat;
  String? get fiber => _fiber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['protein'] = _protein;
    map['carbohydrates'] = _carbohydrates;
    map['fat'] = _fat;
    map['fiber'] = _fiber;
    return map;
  }
}

/// certified : false
/// description : ""

class Certifications {
  Certifications({
    bool? certified,
    String? description,
  }) {
    _certified = certified;
    _description = description;
  }

  Certifications.fromJson(dynamic json) {
    _certified = json['certified'];
    _description = json['description'];
  }
  bool? _certified;
  String? _description;
  Certifications copyWith({
    bool? certified,
    String? description,
  }) =>
      Certifications(
        certified: certified ?? _certified,
        description: description ?? _description,
      );
  bool? get certified => _certified;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['certified'] = _certified;
    map['description'] = _description;
    return map;
  }
}

/// title : "Undefined"
/// isOrganic : false

class OrganicLabelVerification {
  OrganicLabelVerification({
    String? title,
    bool? isOrganic,
  }) {
    _title = title;
    _isOrganic = isOrganic;
  }

  OrganicLabelVerification.fromJson(dynamic json) {
    _title = json['title'];
    _isOrganic = json['isOrganic'];
  }
  String? _title;
  bool? _isOrganic;
  OrganicLabelVerification copyWith({
    String? title,
    bool? isOrganic,
  }) =>
      OrganicLabelVerification(
        title: title ?? _title,
        isOrganic: isOrganic ?? _isOrganic,
      );
  String? get title => _title;
  bool? get isOrganic => _isOrganic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['isOrganic'] = _isOrganic;
    return map;
  }
}
