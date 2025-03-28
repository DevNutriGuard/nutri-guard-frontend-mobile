import 'dart:convert';

/// Converts a JSON string to a [HomeModelResponse] object.
HomeModelResponse homeModelResponseFromJson(String str) =>
    HomeModelResponse.fromJson(json.decode(str));

/// Converts a [HomeModelResponse] object to a JSON string.
String homeModelResponseToJson(HomeModelResponse data) =>
    json.encode(data.toJson());

class HomeModelResponse {
  HomeModelResponse({
    this.status,
    this.statusCode,
    this.data,
  });

  String? status;
  int? statusCode;
  Data? data;

  factory HomeModelResponse.fromJson(Map<String, dynamic> json) =>
      HomeModelResponse(
        status: json["status"],
        statusCode: json["statusCode"],
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
    this.homeData,
  });

  String? message;
  HomeData? homeData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    homeData: json["homeData"] != null
        ? HomeData.fromJson(json["homeData"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "homeData": homeData?.toJson(),
  };
}

class HomeData {
  HomeData({
    this.dailyProgressPercentage,
    this.dailyStats,
    this.events,
    this.trends,
  });

  int? dailyProgressPercentage;
  DailyStats? dailyStats;
  List<Events>? events;
  Trends? trends;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
    dailyProgressPercentage: json["dailyProgressPercentage"],
    dailyStats: json["dailyStats"] != null
        ? DailyStats.fromJson(json["dailyStats"])
        : null,
    events: json["events"] != null
        ? List<Events>.from(json["events"].map((x) => Events.fromJson(x)))
        : null,
    trends: json["trends"] != null ? Trends.fromJson(json["trends"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "dailyProgressPercentage": dailyProgressPercentage,
    "dailyStats": dailyStats?.toJson(),
    "events": events != null
        ? List<dynamic>.from(events!.map((x) => x.toJson()))
        : null,
    "trends": trends?.toJson(),
  };
}

class DailyStats {
  DailyStats({
    this.readinessScore,
    this.sleep,
    this.heartRate,
    this.steps,
    this.calories,
    this.stress,
    this.spO2,
    this.weight,
  });

  int? readinessScore;
  dynamic sleep;
  dynamic heartRate;
  dynamic steps;
  dynamic calories;
  dynamic stress;
  dynamic spO2;
  dynamic weight;

  factory DailyStats.fromJson(Map<String, dynamic> json) => DailyStats(
    readinessScore: json["readinessScore"],
    sleep: json["sleep"],
    heartRate: json["heartRate"],
    steps: json["steps"],
    calories: json["calories"],
    stress: json["stress"],
    spO2: json["spO2"],
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "readinessScore": readinessScore,
    "sleep": sleep,
    "heartRate": heartRate,
    "steps": steps,
    "calories": calories,
    "stress": stress,
    "spO2": spO2,
    "weight": weight,
  };
}

class Events {
  Events({
    this.userEventId,
    this.userEventUuid,
    this.userProfileId,
    this.eventName,
    this.eventType,
    this.eventDate,
    this.completed,
    this.createdAt,
    this.updatedAt,
  });

  int? userEventId;
  String? userEventUuid;
  int? userProfileId;
  String? eventName;
  String? eventType;
  String? eventDate;
  bool? completed;
  String? createdAt;
  String? updatedAt;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
    userEventId: json["userEventId"],
    userEventUuid: json["userEventUuid"],
    userProfileId: json["userProfileId"],
    eventName: json["eventName"],
    eventType: json["eventType"],
    eventDate: json["eventDate"],
    completed: json["completed"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "userEventId": userEventId,
    "userEventUuid": userEventUuid,
    "userProfileId": userProfileId,
    "eventName": eventName,
    "eventType": eventType,
    "eventDate": eventDate,
    "completed": completed,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class Trends {
  Trends({
    this.sleepTrend,
    this.heartTrend,
    this.respiratoryRateTrend,
    this.weight,
  });

  SleepTrendData? sleepTrend;
  HeartTrendData? heartTrend;
  RespiratoryRateTrendData? respiratoryRateTrend;
  Weight? weight;

  factory Trends.fromJson(Map<String, dynamic> json) => Trends(
    sleepTrend: json["sleepTrend"] != null
        ? SleepTrendData.fromJson(json["sleepTrend"])
        : null,
    heartTrend: json["heartTrend"] != null
        ? HeartTrendData.fromJson(json["heartTrend"])
        : null,
    respiratoryRateTrend: json["respiratoryRateTrend"] != null
        ? RespiratoryRateTrendData.fromJson(json["respiratoryRateTrend"])
        : null,
    weight:
    json["weight"] != null ? Weight.fromJson(json["weight"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "sleepTrend": sleepTrend?.toJson(),
    "heartTrend": heartTrend?.toJson(),
    "respiratoryRateTrend": respiratoryRateTrend?.toJson(),
    "weight": weight?.toJson(),
  };
}

class Weight {
  Weight({
    this.weight,
    this.unit,
  });

  int? weight;
  String? unit;

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
    weight: json["weight"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "weight": weight,
    "unit": unit,
  };
}

/// --- Sleep Trend ---

/// Container class for sleep trend data.
class SleepTrendData {
  SleepTrendData({
    this.averageSleepSeconds,
    this.sleepTrend,
  });

  int? averageSleepSeconds;
  List<SleepTrendItem>? sleepTrend;

  factory SleepTrendData.fromJson(Map<String, dynamic> json) => SleepTrendData(
    averageSleepSeconds: json["averageSleepSeconds"],
    sleepTrend: json["sleepTrend"] != null
        ? List<SleepTrendItem>.from(
        json["sleepTrend"].map((x) => SleepTrendItem.fromJson(x)))
        : null,
  );

  Map<String, dynamic> toJson() => {
    "averageSleepSeconds": averageSleepSeconds,
    "sleepTrend": sleepTrend != null
        ? List<dynamic>.from(sleepTrend!.map((x) => x.toJson()))
        : null,
  };
}

/// Represents a single sleep trend item.
class SleepTrendItem {
  SleepTrendItem({
    this.day,
    this.date,
    this.sleepSeconds,
  });

  String? day;
  String? date;
  int? sleepSeconds;

  factory SleepTrendItem.fromJson(Map<String, dynamic> json) => SleepTrendItem(
    day: json["day"],
    date: json["date"],
    sleepSeconds: json["sleepSeconds"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "date": date,
    "sleepSeconds": sleepSeconds,
  };
}

/// --- Heart Trend ---

/// Container class for heart trend data.
class HeartTrendData {
  HeartTrendData({
    this.averageHeartPoints,
    this.averageBPM,
    this.heartTrend,
  });

  double? averageHeartPoints;
  double? averageBPM;
  List<HeartTrendItem>? heartTrend;

  factory HeartTrendData.fromJson(Map<String, dynamic> json) => HeartTrendData(
    averageHeartPoints: json["averageHeartPoints"]?.toDouble(),
    averageBPM: json["averageBPM"]?.toDouble(),
    heartTrend: json["heartTrend"] != null
        ? List<HeartTrendItem>.from(
        json["heartTrend"].map((x) => HeartTrendItem.fromJson(x)))
        : null,
  );

  Map<String, dynamic> toJson() => {
    "averageHeartPoints": averageHeartPoints,
    "averageBPM": averageBPM,
    "heartTrend": heartTrend != null
        ? List<dynamic>.from(heartTrend!.map((x) => x.toJson()))
        : null,
  };
}

/// Represents a single heart trend item.
class HeartTrendItem {
  HeartTrendItem({
    this.day,
    this.date,
    this.bpm,
  });

  String? day;
  String? date;
  int? bpm;

  factory HeartTrendItem.fromJson(Map<String, dynamic> json) => HeartTrendItem(
    day: json["day"],
    date: json["date"],
    bpm: json["bpm"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "date": date,
    "bpm": bpm,
  };
}

/// --- Respiratory Rate Trend ---

/// Container class for respiratory rate trend data.
class RespiratoryRateTrendData {
  RespiratoryRateTrendData({
    this.averageRespiratoryRate,
    this.respiratoryRateTrend,
  });

  double? averageRespiratoryRate;
  List<RespiratoryRateTrendItem>? respiratoryRateTrend;

  factory RespiratoryRateTrendData.fromJson(Map<String, dynamic> json) =>
      RespiratoryRateTrendData(
        averageRespiratoryRate: json["averageRespiratoryRate"]?.toDouble(),
        respiratoryRateTrend: json["respiratoryRateTrend"] != null
            ? List<RespiratoryRateTrendItem>.from(json["respiratoryRateTrend"]
            .map((x) => RespiratoryRateTrendItem.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
    "averageRespiratoryRate": averageRespiratoryRate,
    "respiratoryRateTrend": respiratoryRateTrend != null
        ? List<dynamic>.from(respiratoryRateTrend!.map((x) => x.toJson()))
        : null,
  };
}

/// Represents a single respiratory rate trend item.
class RespiratoryRateTrendItem {
  RespiratoryRateTrendItem({
    this.day,
    this.date,
    this.respiratoryRate,
  });

  String? day;
  String? date;
  int? respiratoryRate;

  factory RespiratoryRateTrendItem.fromJson(Map<String, dynamic> json) =>
      RespiratoryRateTrendItem(
        day: json["day"],
        date: json["date"],
        respiratoryRate: json["respiratoryRate"],
      );

  Map<String, dynamic> toJson() => {
    "day": day,
    "date": date,
    "respiratoryRate": respiratoryRate,
  };
}
