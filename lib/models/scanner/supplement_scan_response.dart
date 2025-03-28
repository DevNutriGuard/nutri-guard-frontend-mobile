/// status : "success"
/// statusCode : 201
/// data : {"supplementDetails":{"supplementName":"ANABOLIC CREATINE","brandName":"Kevin Levrone Signature Series","organicLabelVerification":{"isOrganic":false,"title":"Non-Organic"},"harmfulIngredients":[{"title":"Creatine Monohydrate","description":"In some cases, excessive doses of creatine can lead to kidney damage or gastrointestinal issues."}],"allergens":[{"title":"None","description":"No known allergens in the supplement."}],"interactions":[{"title":"Caffeine","description":"Combining creatine with caffeine may negate some of the benefits of creatine."}],"dietaryCompliance":[{"complianceWith":"Vegan","compliance":false},{"complianceWith":"Low Carb","compliance":true}],"religiousCompliance":[{"complianceWith":"Kosher","compliance":true}],"nutritionalBreakdown":[{"nutrient":"Creatine","healthBenefits":"Supports muscle mass, enhances strength and physical performance."}],"description":"ANABOLIC CREATINE is primarily used for muscle gain and enhancing strength. It may benefit users looking to improve their workout performance while adhering to a low-carb and kosher diet. However, users should consider potential interactions with caffeine, especially if they consume it regularly.","dosageWarnings":["Do not exceed the recommended dosage.","Consult with a healthcare professional before starting any new supplement, especially if you have pre-existing kidney conditions."],"certifications":[{"certified":true,"description":"Manufactured in facilities following Good Manufacturing Practices (GMP)."}],"supplementPicture":null},"message":"Supplement scan saved successfully."}

class SupplementScanResponse {
  SupplementScanResponse({
    String? status,
    num? statusCode,
    Data? data,
  }) {
    _status = status;
    _statusCode = statusCode;
    _data = data;
  }

  SupplementScanResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  num? _statusCode;
  Data? _data;
  SupplementScanResponse copyWith({
    String? status,
    num? statusCode,
    Data? data,
  }) =>
      SupplementScanResponse(
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

/// supplementDetails : {"supplementName":"ANABOLIC CREATINE","brandName":"Kevin Levrone Signature Series","organicLabelVerification":{"isOrganic":false,"title":"Non-Organic"},"harmfulIngredients":[{"title":"Creatine Monohydrate","description":"In some cases, excessive doses of creatine can lead to kidney damage or gastrointestinal issues."}],"allergens":[{"title":"None","description":"No known allergens in the supplement."}],"interactions":[{"title":"Caffeine","description":"Combining creatine with caffeine may negate some of the benefits of creatine."}],"dietaryCompliance":[{"complianceWith":"Vegan","compliance":false},{"complianceWith":"Low Carb","compliance":true}],"religiousCompliance":[{"complianceWith":"Kosher","compliance":true}],"nutritionalBreakdown":[{"nutrient":"Creatine","healthBenefits":"Supports muscle mass, enhances strength and physical performance."}],"description":"ANABOLIC CREATINE is primarily used for muscle gain and enhancing strength. It may benefit users looking to improve their workout performance while adhering to a low-carb and kosher diet. However, users should consider potential interactions with caffeine, especially if they consume it regularly.","dosageWarnings":["Do not exceed the recommended dosage.","Consult with a healthcare professional before starting any new supplement, especially if you have pre-existing kidney conditions."],"certifications":[{"certified":true,"description":"Manufactured in facilities following Good Manufacturing Practices (GMP)."}],"supplementPicture":null}
/// message : "Supplement scan saved successfully."

class Data {
  Data({
    SupplementDetails? supplementDetails,
    String? message,
  }) {
    _supplementDetails = supplementDetails;
    _message = message;
  }

  Data.fromJson(dynamic json) {
    _supplementDetails = json['supplementDetails'] != null
        ? SupplementDetails.fromJson(json['supplementDetails'])
        : null;
    _message = json['message'];
  }
  SupplementDetails? _supplementDetails;
  String? _message;
  Data copyWith({
    SupplementDetails? supplementDetails,
    String? message,
  }) =>
      Data(
        supplementDetails: supplementDetails ?? _supplementDetails,
        message: message ?? _message,
      );
  SupplementDetails? get supplementDetails => _supplementDetails;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_supplementDetails != null) {
      map['supplementDetails'] = _supplementDetails?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

/// supplementName : "ANABOLIC CREATINE"
/// brandName : "Kevin Levrone Signature Series"
/// organicLabelVerification : {"isOrganic":false,"title":"Non-Organic"}
/// harmfulIngredients : [{"title":"Creatine Monohydrate","description":"In some cases, excessive doses of creatine can lead to kidney damage or gastrointestinal issues."}]
/// allergens : [{"title":"None","description":"No known allergens in the supplement."}]
/// interactions : [{"title":"Caffeine","description":"Combining creatine with caffeine may negate some of the benefits of creatine."}]
/// dietaryCompliance : [{"complianceWith":"Vegan","compliance":false},{"complianceWith":"Low Carb","compliance":true}]
/// religiousCompliance : [{"complianceWith":"Kosher","compliance":true}]
/// nutritionalBreakdown : [{"nutrient":"Creatine","healthBenefits":"Supports muscle mass, enhances strength and physical performance."}]
/// description : "ANABOLIC CREATINE is primarily used for muscle gain and enhancing strength. It may benefit users looking to improve their workout performance while adhering to a low-carb and kosher diet. However, users should consider potential interactions with caffeine, especially if they consume it regularly."
/// dosageWarnings : ["Do not exceed the recommended dosage.","Consult with a healthcare professional before starting any new supplement, especially if you have pre-existing kidney conditions."]
/// certifications : [{"certified":true,"description":"Manufactured in facilities following Good Manufacturing Practices (GMP)."}]
/// supplementPicture : null

class SupplementDetails {
  SupplementDetails({
    String? supplementName,
    String? brandName,
    OrganicLabelVerification? organicLabelVerification,
    List<HarmfulIngredients>? harmfulIngredients,
    List<Allergens>? allergens,
    List<Interactions>? interactions,
    List<DietaryCompliance>? dietaryCompliance,
    List<ReligiousCompliance>? religiousCompliance,
    List<NutritionalBreakdown>? nutritionalBreakdown,
    String? description,
    List<String>? dosageWarnings,
    List<Certifications>? certifications,
    dynamic supplementPicture,
  }) {
    _supplementName = supplementName;
    _brandName = brandName;
    _organicLabelVerification = organicLabelVerification;
    _harmfulIngredients = harmfulIngredients;
    _allergens = allergens;
    _interactions = interactions;
    _dietaryCompliance = dietaryCompliance;
    _religiousCompliance = religiousCompliance;
    _nutritionalBreakdown = nutritionalBreakdown;
    _description = description;
    _dosageWarnings = dosageWarnings;
    _certifications = certifications;
    _supplementPicture = supplementPicture;
  }

  SupplementDetails.fromJson(dynamic json) {
    _supplementName = json['supplementName'];
    _brandName = json['brandName'];
    _organicLabelVerification = json['organicLabelVerification'] != null
        ? OrganicLabelVerification.fromJson(json['organicLabelVerification'])
        : null;
    if (json['harmfulIngredients'] != null) {
      _harmfulIngredients = [];
      json['harmfulIngredients'].forEach((v) {
        _harmfulIngredients?.add(HarmfulIngredients.fromJson(v));
      });
    }
    if (json['allergens'] != null) {
      _allergens = [];
      json['allergens'].forEach((v) {
        _allergens?.add(Allergens.fromJson(v));
      });
    }
    if (json['interactions'] != null) {
      _interactions = [];
      json['interactions'].forEach((v) {
        _interactions?.add(Interactions.fromJson(v));
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
    if (json['nutritionalBreakdown'] != null) {
      _nutritionalBreakdown = [];
      json['nutritionalBreakdown'].forEach((v) {
        _nutritionalBreakdown?.add(NutritionalBreakdown.fromJson(v));
      });
    }
    _description = json['description'];
    _dosageWarnings = json['dosageWarnings'] != null
        ? json['dosageWarnings'].cast<String>()
        : [];
    if (json['certifications'] != null) {
      _certifications = [];
      json['certifications'].forEach((v) {
        _certifications?.add(Certifications.fromJson(v));
      });
    }
    _supplementPicture = json['supplementPicture'];
  }
  String? _supplementName;
  String? _brandName;
  OrganicLabelVerification? _organicLabelVerification;
  List<HarmfulIngredients>? _harmfulIngredients;
  List<Allergens>? _allergens;
  List<Interactions>? _interactions;
  List<DietaryCompliance>? _dietaryCompliance;
  List<ReligiousCompliance>? _religiousCompliance;
  List<NutritionalBreakdown>? _nutritionalBreakdown;
  String? _description;
  List<String>? _dosageWarnings;
  List<Certifications>? _certifications;
  dynamic _supplementPicture;
  SupplementDetails copyWith({
    String? supplementName,
    String? brandName,
    OrganicLabelVerification? organicLabelVerification,
    List<HarmfulIngredients>? harmfulIngredients,
    List<Allergens>? allergens,
    List<Interactions>? interactions,
    List<DietaryCompliance>? dietaryCompliance,
    List<ReligiousCompliance>? religiousCompliance,
    List<NutritionalBreakdown>? nutritionalBreakdown,
    String? description,
    List<String>? dosageWarnings,
    List<Certifications>? certifications,
    dynamic supplementPicture,
  }) =>
      SupplementDetails(
        supplementName: supplementName ?? _supplementName,
        brandName: brandName ?? _brandName,
        organicLabelVerification:
            organicLabelVerification ?? _organicLabelVerification,
        harmfulIngredients: harmfulIngredients ?? _harmfulIngredients,
        allergens: allergens ?? _allergens,
        interactions: interactions ?? _interactions,
        dietaryCompliance: dietaryCompliance ?? _dietaryCompliance,
        religiousCompliance: religiousCompliance ?? _religiousCompliance,
        nutritionalBreakdown: nutritionalBreakdown ?? _nutritionalBreakdown,
        description: description ?? _description,
        dosageWarnings: dosageWarnings ?? _dosageWarnings,
        certifications: certifications ?? _certifications,
        supplementPicture: supplementPicture ?? _supplementPicture,
      );
  String? get supplementName => _supplementName;
  String? get brandName => _brandName;
  OrganicLabelVerification? get organicLabelVerification =>
      _organicLabelVerification;
  List<HarmfulIngredients>? get harmfulIngredients => _harmfulIngredients;
  List<Allergens>? get allergens => _allergens;
  List<Interactions>? get interactions => _interactions;
  List<DietaryCompliance>? get dietaryCompliance => _dietaryCompliance;
  List<ReligiousCompliance>? get religiousCompliance => _religiousCompliance;
  List<NutritionalBreakdown>? get nutritionalBreakdown => _nutritionalBreakdown;
  String? get description => _description;
  List<String>? get dosageWarnings => _dosageWarnings;
  List<Certifications>? get certifications => _certifications;
  dynamic get supplementPicture => _supplementPicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['supplementName'] = _supplementName;
    map['brandName'] = _brandName;
    if (_organicLabelVerification != null) {
      map['organicLabelVerification'] = _organicLabelVerification?.toJson();
    }
    if (_harmfulIngredients != null) {
      map['harmfulIngredients'] =
          _harmfulIngredients?.map((v) => v.toJson()).toList();
    }
    if (_allergens != null) {
      map['allergens'] = _allergens?.map((v) => v.toJson()).toList();
    }
    if (_interactions != null) {
      map['interactions'] = _interactions?.map((v) => v.toJson()).toList();
    }
    if (_dietaryCompliance != null) {
      map['dietaryCompliance'] =
          _dietaryCompliance?.map((v) => v.toJson()).toList();
    }
    if (_religiousCompliance != null) {
      map['religiousCompliance'] =
          _religiousCompliance?.map((v) => v.toJson()).toList();
    }
    if (_nutritionalBreakdown != null) {
      map['nutritionalBreakdown'] =
          _nutritionalBreakdown?.map((v) => v.toJson()).toList();
    }
    map['description'] = _description;
    map['dosageWarnings'] = _dosageWarnings;
    if (_certifications != null) {
      map['certifications'] = _certifications?.map((v) => v.toJson()).toList();
    }
    map['supplementPicture'] = _supplementPicture;
    return map;
  }
}

/// certified : true
/// description : "Manufactured in facilities following Good Manufacturing Practices (GMP)."

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

/// nutrient : "Creatine"
/// healthBenefits : "Supports muscle mass, enhances strength and physical performance."

class NutritionalBreakdown {
  NutritionalBreakdown({
    String? nutrient,
    String? healthBenefits,
  }) {
    _nutrient = nutrient;
    _healthBenefits = healthBenefits;
  }

  NutritionalBreakdown.fromJson(dynamic json) {
    _nutrient = json['nutrient'];
    _healthBenefits = json['healthBenefits'];
  }
  String? _nutrient;
  String? _healthBenefits;
  NutritionalBreakdown copyWith({
    String? nutrient,
    String? healthBenefits,
  }) =>
      NutritionalBreakdown(
        nutrient: nutrient ?? _nutrient,
        healthBenefits: healthBenefits ?? _healthBenefits,
      );
  String? get nutrient => _nutrient;
  String? get healthBenefits => _healthBenefits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nutrient'] = _nutrient;
    map['healthBenefits'] = _healthBenefits;
    return map;
  }
}

/// complianceWith : "Kosher"
/// compliance : true

class ReligiousCompliance {
  ReligiousCompliance({
    String? complianceWith,
    bool? compliance,
  }) {
    _complianceWith = complianceWith;
    _compliance = compliance;
  }

  ReligiousCompliance.fromJson(dynamic json) {
    _complianceWith = json['complianceWith'];
    _compliance = json['compliance'];
  }
  String? _complianceWith;
  bool? _compliance;
  ReligiousCompliance copyWith({
    String? complianceWith,
    bool? compliance,
  }) =>
      ReligiousCompliance(
        complianceWith: complianceWith ?? _complianceWith,
        compliance: compliance ?? _compliance,
      );
  String? get complianceWith => _complianceWith;
  bool? get compliance => _compliance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['complianceWith'] = _complianceWith;
    map['compliance'] = _compliance;
    return map;
  }
}

/// complianceWith : "Vegan"
/// compliance : false

class DietaryCompliance {
  DietaryCompliance({
    String? complianceWith,
    bool? compliance,
  }) {
    _complianceWith = complianceWith;
    _compliance = compliance;
  }

  DietaryCompliance.fromJson(dynamic json) {
    _complianceWith = json['complianceWith'];
    _compliance = json['compliance'];
  }
  String? _complianceWith;
  bool? _compliance;
  DietaryCompliance copyWith({
    String? complianceWith,
    bool? compliance,
  }) =>
      DietaryCompliance(
        complianceWith: complianceWith ?? _complianceWith,
        compliance: compliance ?? _compliance,
      );
  String? get complianceWith => _complianceWith;
  bool? get compliance => _compliance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['complianceWith'] = _complianceWith;
    map['compliance'] = _compliance;
    return map;
  }
}

/// title : "Caffeine"
/// description : "Combining creatine with caffeine may negate some of the benefits of creatine."

class Interactions {
  Interactions({
    String? title,
    String? description,
  }) {
    _title = title;
    _description = description;
  }

  Interactions.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
  }
  String? _title;
  String? _description;
  Interactions copyWith({
    String? title,
    String? description,
  }) =>
      Interactions(
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

/// title : "None"
/// description : "No known allergens in the supplement."

class Allergens {
  Allergens({
    String? title,
    String? description,
  }) {
    _title = title;
    _description = description;
  }

  Allergens.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
  }
  String? _title;
  String? _description;
  Allergens copyWith({
    String? title,
    String? description,
  }) =>
      Allergens(
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

/// title : "Creatine Monohydrate"
/// description : "In some cases, excessive doses of creatine can lead to kidney damage or gastrointestinal issues."

class HarmfulIngredients {
  HarmfulIngredients({
    String? title,
    String? description,
  }) {
    _title = title;
    _description = description;
  }

  HarmfulIngredients.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
  }
  String? _title;
  String? _description;
  HarmfulIngredients copyWith({
    String? title,
    String? description,
  }) =>
      HarmfulIngredients(
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

/// isOrganic : false
/// title : "Non-Organic"

class OrganicLabelVerification {
  OrganicLabelVerification({
    bool? isOrganic,
    String? title,
  }) {
    _isOrganic = isOrganic;
    _title = title;
  }

  OrganicLabelVerification.fromJson(dynamic json) {
    _isOrganic = json['isOrganic'];
    _title = json['title'];
  }
  bool? _isOrganic;
  String? _title;
  OrganicLabelVerification copyWith({
    bool? isOrganic,
    String? title,
  }) =>
      OrganicLabelVerification(
        isOrganic: isOrganic ?? _isOrganic,
        title: title ?? _title,
      );
  bool? get isOrganic => _isOrganic;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isOrganic'] = _isOrganic;
    map['title'] = _title;
    return map;
  }
}
