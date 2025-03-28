import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"mentalCognitiveData":{"MedicationTimingAdjustments":[],"InteractionAlerts":[],"SupplementRoutineSuggestions":[{"title":"Omega-3 Fish Oil","image":"placeholder_image.jpg","description":"Omega-3 fatty acids support cognitive function and promote mental clarity, aligning with your goal of enhancing mental clarity.","details":[{"title":"Cognitive Health","details":"Omega-3 fish oil is known to help maintain cognitive health by reducing inflammation and supporting overall brain function."},{"title":"Heart Health","details":"Supports cardiovascular health by lowering blood pressure and improving cholesterol levels."}]},{"title":"Vitamin D","image":"placeholder_image.jpg","description":"Vitamin D is essential for bone health and supports immune function, which can improve overall health and performance.","details":[{"title":"Immune Support","details":"Vitamin D plays a crucial role in immune system regulation, helping your body fend off illnesses."},{"title":"Bone Health","details":"This vitamin aids in calcium absorption, important for maintaining strong bones and preventing osteoporosis."}]},{"title":"Magnesium","image":"placeholder_image.jpg","description":"Magnesium is involved in numerous bodily functions, including muscle and nerve function, energy production, and mental clarity.","details":[{"title":"Muscle Relaxation","details":"Helps relax muscles and nerves, which can reduce stress and improve overall mood."},{"title":"Energy Production","details":"Magnesium plays a role in converting food into energy, which can help enhance daily performance."}]}]},"message":"Success"}

MedicineAndSupplmentResponseModel medicineAndSupplmentResponseModelFromJson(String str) => MedicineAndSupplmentResponseModel.fromJson(json.decode(str));
String medicineAndSupplmentResponseModelToJson(MedicineAndSupplmentResponseModel data) => json.encode(data.toJson());
class MedicineAndSupplmentResponseModel {
  MedicineAndSupplmentResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  MedicineAndSupplmentResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
MedicineAndSupplmentResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => MedicineAndSupplmentResponseModel(  status: status ?? _status,
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

/// mentalCognitiveData : {"MedicationTimingAdjustments":[],"InteractionAlerts":[],"SupplementRoutineSuggestions":[{"title":"Omega-3 Fish Oil","image":"placeholder_image.jpg","description":"Omega-3 fatty acids support cognitive function and promote mental clarity, aligning with your goal of enhancing mental clarity.","details":[{"title":"Cognitive Health","details":"Omega-3 fish oil is known to help maintain cognitive health by reducing inflammation and supporting overall brain function."},{"title":"Heart Health","details":"Supports cardiovascular health by lowering blood pressure and improving cholesterol levels."}]},{"title":"Vitamin D","image":"placeholder_image.jpg","description":"Vitamin D is essential for bone health and supports immune function, which can improve overall health and performance.","details":[{"title":"Immune Support","details":"Vitamin D plays a crucial role in immune system regulation, helping your body fend off illnesses."},{"title":"Bone Health","details":"This vitamin aids in calcium absorption, important for maintaining strong bones and preventing osteoporosis."}]},{"title":"Magnesium","image":"placeholder_image.jpg","description":"Magnesium is involved in numerous bodily functions, including muscle and nerve function, energy production, and mental clarity.","details":[{"title":"Muscle Relaxation","details":"Helps relax muscles and nerves, which can reduce stress and improve overall mood."},{"title":"Energy Production","details":"Magnesium plays a role in converting food into energy, which can help enhance daily performance."}]}]}
/// message : "Success"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      MentalCognitiveData? mentalCognitiveData, 
      String? message,}){
    _mentalCognitiveData = mentalCognitiveData;
    _message = message;
}

  Data.fromJson(dynamic json) {
    _mentalCognitiveData = json['mentalCognitiveData'] != null ? MentalCognitiveData.fromJson(json['mentalCognitiveData']) : null;
    _message = json['message'];
  }
  MentalCognitiveData? _mentalCognitiveData;
  String? _message;
Data copyWith({  MentalCognitiveData? mentalCognitiveData,
  String? message,
}) => Data(  mentalCognitiveData: mentalCognitiveData ?? _mentalCognitiveData,
  message: message ?? _message,
);
  MentalCognitiveData? get mentalCognitiveData => _mentalCognitiveData;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_mentalCognitiveData != null) {
      map['mentalCognitiveData'] = _mentalCognitiveData?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// MedicationTimingAdjustments : []
/// InteractionAlerts : []
/// SupplementRoutineSuggestions : [{"title":"Omega-3 Fish Oil","image":"placeholder_image.jpg","description":"Omega-3 fatty acids support cognitive function and promote mental clarity, aligning with your goal of enhancing mental clarity.","details":[{"title":"Cognitive Health","details":"Omega-3 fish oil is known to help maintain cognitive health by reducing inflammation and supporting overall brain function."},{"title":"Heart Health","details":"Supports cardiovascular health by lowering blood pressure and improving cholesterol levels."}]},{"title":"Vitamin D","image":"placeholder_image.jpg","description":"Vitamin D is essential for bone health and supports immune function, which can improve overall health and performance.","details":[{"title":"Immune Support","details":"Vitamin D plays a crucial role in immune system regulation, helping your body fend off illnesses."},{"title":"Bone Health","details":"This vitamin aids in calcium absorption, important for maintaining strong bones and preventing osteoporosis."}]},{"title":"Magnesium","image":"placeholder_image.jpg","description":"Magnesium is involved in numerous bodily functions, including muscle and nerve function, energy production, and mental clarity.","details":[{"title":"Muscle Relaxation","details":"Helps relax muscles and nerves, which can reduce stress and improve overall mood."},{"title":"Energy Production","details":"Magnesium plays a role in converting food into energy, which can help enhance daily performance."}]}]

MentalCognitiveData mentalCognitiveDataFromJson(String str) => MentalCognitiveData.fromJson(json.decode(str));
String mentalCognitiveDataToJson(MentalCognitiveData data) => json.encode(data.toJson());
class MentalCognitiveData {
  MentalCognitiveData({
      List<dynamic>? medicationTimingAdjustments, 
      List<dynamic>? interactionAlerts, 
      List<SupplementRoutineSuggestions>? supplementRoutineSuggestions,}){
    _medicationTimingAdjustments = medicationTimingAdjustments;
    _interactionAlerts = interactionAlerts;
    _supplementRoutineSuggestions = supplementRoutineSuggestions;
}

  MentalCognitiveData.fromJson(dynamic json) {
    if (json['MedicationTimingAdjustments'] != null) {
      _medicationTimingAdjustments = [];
      json['MedicationTimingAdjustments'].forEach((v) {
        // _medicationTimingAdjustments?.add(Dynamic.fromJson(v));
      });
    }
    if (json['InteractionAlerts'] != null) {
      _interactionAlerts = [];
      json['InteractionAlerts'].forEach((v) {
        // _interactionAlerts?.add(Dynamic.fromJson(v));
      });
    }
    if (json['SupplementRoutineSuggestions'] != null) {
      _supplementRoutineSuggestions = [];
      json['SupplementRoutineSuggestions'].forEach((v) {
        _supplementRoutineSuggestions?.add(SupplementRoutineSuggestions.fromJson(v));
      });
    }
  }
  List<dynamic>? _medicationTimingAdjustments;
  List<dynamic>? _interactionAlerts;
  List<SupplementRoutineSuggestions>? _supplementRoutineSuggestions;
MentalCognitiveData copyWith({  List<dynamic>? medicationTimingAdjustments,
  List<dynamic>? interactionAlerts,
  List<SupplementRoutineSuggestions>? supplementRoutineSuggestions,
}) => MentalCognitiveData(  medicationTimingAdjustments: medicationTimingAdjustments ?? _medicationTimingAdjustments,
  interactionAlerts: interactionAlerts ?? _interactionAlerts,
  supplementRoutineSuggestions: supplementRoutineSuggestions ?? _supplementRoutineSuggestions,
);
  List<dynamic>? get medicationTimingAdjustments => _medicationTimingAdjustments;
  List<dynamic>? get interactionAlerts => _interactionAlerts;
  List<SupplementRoutineSuggestions>? get supplementRoutineSuggestions => _supplementRoutineSuggestions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_medicationTimingAdjustments != null) {
      map['MedicationTimingAdjustments'] = _medicationTimingAdjustments?.map((v) => v.toJson()).toList();
    }
    if (_interactionAlerts != null) {
      map['InteractionAlerts'] = _interactionAlerts?.map((v) => v.toJson()).toList();
    }
    if (_supplementRoutineSuggestions != null) {
      map['SupplementRoutineSuggestions'] = _supplementRoutineSuggestions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "Omega-3 Fish Oil"
/// image : "placeholder_image.jpg"
/// description : "Omega-3 fatty acids support cognitive function and promote mental clarity, aligning with your goal of enhancing mental clarity."
/// details : [{"title":"Cognitive Health","details":"Omega-3 fish oil is known to help maintain cognitive health by reducing inflammation and supporting overall brain function."},{"title":"Heart Health","details":"Supports cardiovascular health by lowering blood pressure and improving cholesterol levels."}]

SupplementRoutineSuggestions supplementRoutineSuggestionsFromJson(String str) => SupplementRoutineSuggestions.fromJson(json.decode(str));
String supplementRoutineSuggestionsToJson(SupplementRoutineSuggestions data) => json.encode(data.toJson());
class SupplementRoutineSuggestions {
  SupplementRoutineSuggestions({
      String? title, 
      String? image, 
      String? description, 
      List<Details>? details,}){
    _title = title;
    _image = image;
    _description = description;
    _details = details;
}

  SupplementRoutineSuggestions.fromJson(dynamic json) {
    _title = json['title'];
    _image = json['image'];
    _description = json['description'];
    if (json['details'] != null) {
      _details = [];
      json['details'].forEach((v) {
        _details?.add(Details.fromJson(v));
      });
    }
  }
  String? _title;
  String? _image;
  String? _description;
  List<Details>? _details;
SupplementRoutineSuggestions copyWith({  String? title,
  String? image,
  String? description,
  List<Details>? details,
}) => SupplementRoutineSuggestions(  title: title ?? _title,
  image: image ?? _image,
  description: description ?? _description,
  details: details ?? _details,
);
  String? get title => _title;
  String? get image => _image;
  String? get description => _description;
  List<Details>? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['image'] = _image;
    map['description'] = _description;
    if (_details != null) {
      map['details'] = _details?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "Cognitive Health"
/// details : "Omega-3 fish oil is known to help maintain cognitive health by reducing inflammation and supporting overall brain function."

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));
String detailsToJson(Details data) => json.encode(data.toJson());
class Details {
  Details({
      String? title, 
      String? details,}){
    _title = title;
    _details = details;
}

  Details.fromJson(dynamic json) {
    _title = json['title'];
    _details = json['details'];
  }
  String? _title;
  String? _details;
Details copyWith({  String? title,
  String? details,
}) => Details(  title: title ?? _title,
  details: details ?? _details,
);
  String? get title => _title;
  String? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['details'] = _details;
    return map;
  }

}