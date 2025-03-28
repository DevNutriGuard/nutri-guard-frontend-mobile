class MealScanResponse {
  MealScanResponse({
    String? status,
    num? statusCode,
    Data? data,
  }) {
    _status = status;
    _statusCode = statusCode;
    _data = data;
  }

  MealScanResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  num? _statusCode;
  Data? _data;

  MealScanResponse copyWith({
    String? status,
    num? statusCode,
    Data? data,
  }) =>
      MealScanResponse(
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

class FoodDetails {
  FoodDetails({
    String? mealDescription,
    String? mealName,
    String? brandName,
    OrganicLabelVerification? organicLabelVerification,
    List<Certifications>? certifications,
    NutritionalInfo? nutritionalInfo,
    List<dynamic>? allergenDetection,
    List<dynamic>? interactionAnalysis,
    List<DietaryCompliance>? dietaryCompliance,
    List<ReligiousCompliance>? religiousCompliance,
    dynamic mealPicture,
  }) {
    _mealDescription = mealDescription;
    _mealName = mealName;
    _brandName = brandName;
    _organicLabelVerification = organicLabelVerification;
    _certifications = certifications;
    _nutritionalInfo = nutritionalInfo;
    _allergenDetection = allergenDetection;
    _interactionAnalysis = interactionAnalysis;
    _dietaryCompliance = dietaryCompliance;
    _religiousCompliance = religiousCompliance;
    _mealPicture = mealPicture;
  }

  FoodDetails.fromJson(dynamic json) {
    _mealDescription = json['mealDescription'];
    _mealName = json['mealName'];
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

    // allergenDetection
    if (json['allergenDetection'] != null) {
      _allergenDetection = [];
      json['allergenDetection'].forEach((v) {
        _allergenDetection?.add(v); // v is dynamic
      });
    }

    // interactionAnalysis
    if (json['interactionAnalysis'] != null) {
      _interactionAnalysis = [];
      json['interactionAnalysis'].forEach((v) {
        _interactionAnalysis?.add(v); // v is dynamic
      });
    }

    // dietaryCompliance
    if (json['dietaryCompliance'] != null) {
      _dietaryCompliance = [];
      json['dietaryCompliance'].forEach((v) {
        _dietaryCompliance?.add(DietaryCompliance.fromJson(v));
      });
    }

    // religiousCompliance
    if (json['religiousCompliance'] != null) {
      _religiousCompliance = [];
      json['religiousCompliance'].forEach((v) {
        _religiousCompliance?.add(ReligiousCompliance.fromJson(v));
      });
    }

    _mealPicture = json['mealPicture'];
  }

  String? _mealDescription;
  String? _mealName;
  String? _brandName;
  OrganicLabelVerification? _organicLabelVerification;
  List<Certifications>? _certifications;
  NutritionalInfo? _nutritionalInfo;
  List<dynamic>? _allergenDetection;
  List<dynamic>? _interactionAnalysis;
  List<DietaryCompliance>? _dietaryCompliance;
  List<ReligiousCompliance>? _religiousCompliance;
  dynamic _mealPicture;

  FoodDetails copyWith({
    String? mealDescription,
    String? mealName,
    String? brandName,
    OrganicLabelVerification? organicLabelVerification,
    List<Certifications>? certifications,
    NutritionalInfo? nutritionalInfo,
    List<dynamic>? allergenDetection,
    List<dynamic>? interactionAnalysis,
    List<DietaryCompliance>? dietaryCompliance,
    List<ReligiousCompliance>? religiousCompliance,
    dynamic mealPicture,
  }) =>
      FoodDetails(
        mealDescription: mealDescription ?? _mealDescription,
        mealName: mealName ?? _mealName,
        brandName: brandName ?? _brandName,
        organicLabelVerification:
            organicLabelVerification ?? _organicLabelVerification,
        certifications: certifications ?? _certifications,
        nutritionalInfo: nutritionalInfo ?? _nutritionalInfo,
        allergenDetection: allergenDetection ?? _allergenDetection,
        interactionAnalysis: interactionAnalysis ?? _interactionAnalysis,
        dietaryCompliance: dietaryCompliance ?? _dietaryCompliance,
        religiousCompliance: religiousCompliance ?? _religiousCompliance,
        mealPicture: mealPicture ?? _mealPicture,
      );

  String? get mealDescription => _mealDescription;
  String? get mealName => _mealName;
  String? get brandName => _brandName;
  OrganicLabelVerification? get organicLabelVerification =>
      _organicLabelVerification;
  List<Certifications>? get certifications => _certifications;
  NutritionalInfo? get nutritionalInfo => _nutritionalInfo;
  List<dynamic>? get allergenDetection => _allergenDetection;
  List<dynamic>? get interactionAnalysis => _interactionAnalysis;
  List<DietaryCompliance>? get dietaryCompliance => _dietaryCompliance;
  List<ReligiousCompliance>? get religiousCompliance => _religiousCompliance;
  dynamic get mealPicture => _mealPicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mealDescription'] = _mealDescription;
    map['mealName'] = _mealName;
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
      map['allergenDetection'] = _allergenDetection;
    }

    if (_interactionAnalysis != null) {
      map['interactionAnalysis'] = _interactionAnalysis;
    }

    if (_dietaryCompliance != null) {
      map['dietaryCompliance'] =
          _dietaryCompliance?.map((v) => v.toJson()).toList();
    }

    if (_religiousCompliance != null) {
      map['religiousCompliance'] =
          _religiousCompliance?.map((v) => v.toJson()).toList();
    }

    map['mealPicture'] = _mealPicture;
    return map;
  }
}

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

class NutritionalInfo {
  NutritionalInfo({
    String? calories,
    Macronutrients? macronutrients,
    List<dynamic>? vitamins,
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

    // vitamins
    if (json['vitamins'] != null) {
      _vitamins = [];
      json['vitamins'].forEach((v) {
        _vitamins?.add(v); // v is dynamic
      });
    }

    // minerals
    if (json['minerals'] != null) {
      _minerals = List<String>.from(json['minerals']);
    }
  }

  String? _calories;
  Macronutrients? _macronutrients;
  List<dynamic>? _vitamins;
  List<String>? _minerals;

  NutritionalInfo copyWith({
    String? calories,
    Macronutrients? macronutrients,
    List<dynamic>? vitamins,
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
  List<dynamic>? get vitamins => _vitamins;
  List<String>? get minerals => _minerals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['calories'] = _calories;
    if (_macronutrients != null) {
      map['macronutrients'] = _macronutrients?.toJson();
    }
    map['vitamins'] = _vitamins; // list of dynamic
    map['minerals'] = _minerals; // list of string
    return map;
  }
}

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
