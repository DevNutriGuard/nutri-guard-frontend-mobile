import 'dart:convert';

/// Status model
class LongTermHealthResponseModel {
  String? status;
  int? statusCode;
  Data? data;

  LongTermHealthResponseModel({this.status, this.statusCode, this.data});

  LongTermHealthResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['status'] = status;
    map['statusCode'] = statusCode;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// Data model
class Data {
  String? message;
  LongTermHealth? longTermHealth;

  Data({this.message, this.longTermHealth});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    longTermHealth = json['longTermHealth'] != null
        ? LongTermHealth.fromJson(json['longTermHealth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['message'] = message;
    if (longTermHealth != null) {
      map['longTermHealth'] = longTermHealth?.toJson();
    }
    return map;
  }
}

/// Long-term health model
class LongTermHealth {
  List<dynamic>? healthCheckupReminders;
  LongTermHealthData? longTermHealthData;

  LongTermHealth({this.healthCheckupReminders, this.longTermHealthData});

  LongTermHealth.fromJson(Map<String, dynamic> json) {
    healthCheckupReminders = json['healthCheckupReminders'] != null
        ? List.from(json['healthCheckupReminders'])
        : null;
    longTermHealthData = json['longTermHealthData'] != null
        ? LongTermHealthData.fromJson(json['longTermHealthData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (healthCheckupReminders != null) {
      map['healthCheckupReminders'] = healthCheckupReminders;
    }
    if (longTermHealthData != null) {
      map['longTermHealthData'] = longTermHealthData?.toJson();
    }
    return map;
  }
}

/// Long-term health data model
class LongTermHealthData {
  List<RoutineAdjustments>? routineAdjustments;
  List<PersonalizedLongTermHealthSupplements>?
  personalizedLongTermHealthSupplements;

  LongTermHealthData(
      {this.routineAdjustments, this.personalizedLongTermHealthSupplements});

  LongTermHealthData.fromJson(Map<String, dynamic> json) {
    if (json['RoutineAdjustments'] != null) {
      routineAdjustments = [];
      json['RoutineAdjustments'].forEach((v) {
        routineAdjustments?.add(RoutineAdjustments.fromJson(v));
      });
    }
    if (json['PersonalizedLongTermHealthSupplements'] != null) {
      personalizedLongTermHealthSupplements = [];
      json['PersonalizedLongTermHealthSupplements'].forEach((v) {
        personalizedLongTermHealthSupplements
            ?.add(PersonalizedLongTermHealthSupplements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (routineAdjustments != null) {
      map['RoutineAdjustments'] =
          routineAdjustments?.map((v) => v.toJson()).toList();
    }
    if (personalizedLongTermHealthSupplements != null) {
      map['PersonalizedLongTermHealthSupplements'] =
          personalizedLongTermHealthSupplements
              ?.map((v) => v.toJson())
              .toList();
    }
    return map;
  }
}

/// Routine adjustments model
class RoutineAdjustments {
  String? title;
  String? description;
  List<Details>? details;

  RoutineAdjustments({this.title, this.description, this.details});

  RoutineAdjustments.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    if (json['details'] != null) {
      details = [];
      json['details'].forEach((v) {
        details?.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['title'] = title;
    map['description'] = description;
    if (details != null) {
      map['details'] = details?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Personalized long-term health supplements model
class PersonalizedLongTermHealthSupplements {
  String? title;
  String? description;
  List<Details>? details;

  PersonalizedLongTermHealthSupplements(
      {this.title, this.description, this.details});

  PersonalizedLongTermHealthSupplements.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    if (json['details'] != null) {
      details = [];
      json['details'].forEach((v) {
        details?.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['title'] = title;
    map['description'] = description;
    if (details != null) {
      map['details'] = details?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Details model for each adjustment or supplement
class Details {
  String? title;
  String? details;

  Details({this.title, this.details});

  Details.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['title'] = title;
    map['details'] = details;
    return map;
  }
}

LongTermHealthResponseModel longTermHealthResponseModelFromJson(String str) =>
    LongTermHealthResponseModel.fromJson(json.decode(str));

String longTermHealthResponseModelToJson(LongTermHealthResponseModel data) =>
    json.encode(data.toJson());

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

LongTermHealth longTermHealthFromJson(String str) =>
    LongTermHealth.fromJson(json.decode(str));

String longTermHealthToJson(LongTermHealth data) => json.encode(data.toJson());

LongTermHealthData longTermHealthDataFromJson(String str) =>
    LongTermHealthData.fromJson(json.decode(str));

String longTermHealthDataToJson(LongTermHealthData data) =>
    json.encode(data.toJson());

PersonalizedLongTermHealthSupplements
personalizedLongTermHealthSupplementsFromJson(String str) =>
    PersonalizedLongTermHealthSupplements.fromJson(json.decode(str));

String personalizedLongTermHealthSupplementsToJson(
    PersonalizedLongTermHealthSupplements data) =>
    json.encode(data.toJson());

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());
