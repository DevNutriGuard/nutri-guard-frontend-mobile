import 'dart:convert';

SleepAndRecoveryResponseModel sleepAndRecoveryResponseModelFromJson(String str) =>
    SleepAndRecoveryResponseModel.fromJson(json.decode(str));

String sleepAndRecoveryResponseModelToJson(SleepAndRecoveryResponseModel data) =>
    json.encode(data.toJson());

class SleepAndRecoveryResponseModel {
  SleepAndRecoveryResponseModel({
    this.status,
    this.statusCode,
    this.data,
  });

  String? status;
  int? statusCode;
  Data? data;

  factory SleepAndRecoveryResponseModel.fromJson(Map<String, dynamic> json) =>
      SleepAndRecoveryResponseModel(
        status: json["status"] as String?,
        statusCode: json["statusCode"] as int?,
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.message,
    this.sleepRecovery,
    this.spikeSleepData,
  });

  String? message;
  SleepRecovery? sleepRecovery;
  dynamic spikeSleepData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"] as String?,
    sleepRecovery: json["sleepRecovery"] != null
        ? SleepRecovery.fromJson(json["sleepRecovery"])
        : null,
    spikeSleepData: json["spikeSleepData"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "sleepRecovery": sleepRecovery?.toJson(),
    "spikeSleepData": spikeSleepData,
  };
}

class SleepRecovery {
  SleepRecovery({
    this.sleepEnvironmentTips,
    this.wellnessTips,
    this.sleepAndRecoverySupplements,
  });

  List<SleepEnvironmentTips>? sleepEnvironmentTips;
  List<WellnessTips>? wellnessTips;
  List<SleepAndRecoverySupplements>? sleepAndRecoverySupplements;

  factory SleepRecovery.fromJson(Map<String, dynamic> json) => SleepRecovery(
    sleepEnvironmentTips: json["SleepEnvironmentTips"] != null
        ? List<SleepEnvironmentTips>.from(json["SleepEnvironmentTips"]
        .map((x) => SleepEnvironmentTips.fromJson(x)))
        : [],
    wellnessTips: json["WellnessTips"] != null
        ? List<WellnessTips>.from(
        json["WellnessTips"].map((x) => WellnessTips.fromJson(x)))
        : [],
    sleepAndRecoverySupplements: json["SleepAndRecoverySupplements"] != null
        ? List<SleepAndRecoverySupplements>.from(
        json["SleepAndRecoverySupplements"]
            .map((x) => SleepAndRecoverySupplements.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "SleepEnvironmentTips": sleepEnvironmentTips?.map((x) => x.toJson()).toList(),
    "WellnessTips": wellnessTips?.map((x) => x.toJson()).toList(),
    "SleepAndRecoverySupplements":
    sleepAndRecoverySupplements?.map((x) => x.toJson()).toList(),
  };
}

class SleepEnvironmentTips {
  SleepEnvironmentTips({
    this.title,
    this.description,
  });

  String? title;
  String? description;

  factory SleepEnvironmentTips.fromJson(Map<String, dynamic> json) =>
      SleepEnvironmentTips(
        title: json["title"] as String?,
        description: json["description"] as String?,
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}

class WellnessTips {
  WellnessTips({
    this.title,
    this.description,
    this.details,
  });

  String? title;
  String? description;
  List<Details>? details;

  factory WellnessTips.fromJson(Map<String, dynamic> json) => WellnessTips(
    title: json["title"] as String?,
    description: json["description"] as String?,
    details: json["details"] != null
        ? List<Details>.from(
        json["details"].map((x) => Details.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "details": details?.map((x) => x.toJson()).toList(),
  };
}

class SleepAndRecoverySupplements {
  SleepAndRecoverySupplements({
    this.title,
    this.description,
    this.details,
  });

  String? title;
  String? description;
  List<Details>? details;

  factory SleepAndRecoverySupplements.fromJson(Map<String, dynamic> json) =>
      SleepAndRecoverySupplements(
        title: json["title"] as String?,
        description: json["description"] as String?,
        details: json["details"] != null
            ? List<Details>.from(
            json["details"].map((x) => Details.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "details": details?.map((x) => x.toJson()).toList(),
  };
}

class Details {
  Details({
    this.title,
    this.details,
  });

  String? title;
  String? details;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    title: json["title"] as String?,
    details: json["details"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "details": details,
  };
}
