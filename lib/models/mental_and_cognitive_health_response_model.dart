import 'dart:convert';

MentalAndCognitiveHealthResponseModel mentalAndCognitiveHealthResponseModelFromJson(String str) =>
    MentalAndCognitiveHealthResponseModel.fromJson(json.decode(str));

String mentalAndCognitiveHealthResponseModelToJson(MentalAndCognitiveHealthResponseModel data) =>
    json.encode(data.toJson());

class MentalAndCognitiveHealthResponseModel {
  MentalAndCognitiveHealthResponseModel({
    this.status,
    this.statusCode,
    this.data,
  });

  final String? status;
  final int? statusCode;
  final Data? data;

  factory MentalAndCognitiveHealthResponseModel.fromJson(Map<String, dynamic> json) =>
      MentalAndCognitiveHealthResponseModel(
        status: json['status'] as String?,
        statusCode: json['statusCode'] as int?,
        data: json['data'] != null ? Data.fromJson(json['data']) : null,
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'statusCode': statusCode,
    'data': data?.toJson(),
  };
}

class Data {
  Data({
    this.mentalCognitiveData,
    this.stressData,
    this.message,
  });

  final MentalCognitiveData? mentalCognitiveData;
  final dynamic stressData;
  final String? message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    mentalCognitiveData: json['mentalCognitiveData'] != null
        ? MentalCognitiveData.fromJson(json['mentalCognitiveData'])
        : null,
    stressData: json['stressData'],
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'mentalCognitiveData': mentalCognitiveData?.toJson(),
    'stressData': stressData,
    'message': message,
  };
}

class MentalCognitiveData {
  MentalCognitiveData({
    this.mindfulnessReminders,
    this.cognitiveEnhancementFoods,
    this.cognitiveEnhancementSupplements,
  });

  final List<MindfulnessReminders>? mindfulnessReminders;
  final List<CognitiveEnhancementFoods>? cognitiveEnhancementFoods;
  final List<CognitiveEnhancementSupplements>? cognitiveEnhancementSupplements;

  factory MentalCognitiveData.fromJson(Map<String, dynamic> json) => MentalCognitiveData(
    mindfulnessReminders: json['MindfulnessReminders'] != null
        ? List<MindfulnessReminders>.from(
        json['MindfulnessReminders'].map((x) => MindfulnessReminders.fromJson(x)))
        : [],
    cognitiveEnhancementFoods: json['CognitiveEnhancementFoods'] != null
        ? List<CognitiveEnhancementFoods>.from(
        json['CognitiveEnhancementFoods'].map((x) => CognitiveEnhancementFoods.fromJson(x)))
        : [],
    cognitiveEnhancementSupplements: json['CognitiveEnhancementSupplements'] != null
        ? List<CognitiveEnhancementSupplements>.from(
        json['CognitiveEnhancementSupplements']
            .map((x) => CognitiveEnhancementSupplements.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    'MindfulnessReminders': mindfulnessReminders?.map((x) => x.toJson()).toList(),
    'CognitiveEnhancementFoods': cognitiveEnhancementFoods?.map((x) => x.toJson()).toList(),
    'CognitiveEnhancementSupplements':
    cognitiveEnhancementSupplements?.map((x) => x.toJson()).toList(),
  };
}

class MindfulnessReminders {
  MindfulnessReminders({
    this.title,
    this.image,
    this.description,
    this.details,
  });

  final String? title;
  final String? image;
  final String? description;
  final List<Details>? details;

  factory MindfulnessReminders.fromJson(Map<String, dynamic> json) => MindfulnessReminders(
    title: json['title'] as String?,
    image: json['image'] as String?,
    description: json['description'] as String?,
    details: json['details'] != null
        ? List<Details>.from(json['details'].map((x) => Details.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'image': image,
    'description': description,
    'details': details?.map((x) => x.toJson()).toList(),
  };
}

class CognitiveEnhancementFoods {
  CognitiveEnhancementFoods({
    this.title,
    this.image,
    this.description,
    this.details,
  });

  final String? title;
  final String? image;
  final String? description;
  final List<Details>? details;

  factory CognitiveEnhancementFoods.fromJson(Map<String, dynamic> json) => CognitiveEnhancementFoods(
    title: json['title'] as String?,
    image: json['image'] as String?,
    description: json['description'] as String?,
    details: json['details'] != null
        ? List<Details>.from(json['details'].map((x) => Details.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'image': image,
    'description': description,
    'details': details?.map((x) => x.toJson()).toList(),
  };
}

class CognitiveEnhancementSupplements {
  CognitiveEnhancementSupplements({
    this.title,
    this.image,
    this.description,
    this.details,
  });

  final String? title;
  final String? image;
  final String? description;
  final List<Details>? details;

  factory CognitiveEnhancementSupplements.fromJson(Map<String, dynamic> json) =>
      CognitiveEnhancementSupplements(
        title: json['title'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        details: json['details'] != null
            ? List<Details>.from(json['details'].map((x) => Details.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'image': image,
    'description': description,
    'details': details?.map((x) => x.toJson()).toList(),
  };
}

class Details {
  Details({
    this.title,
    this.details,
  });

  final String? title;
  final String? details;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    title: json['title'] as String?,
    details: json['details'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'details': details,
  };
}
