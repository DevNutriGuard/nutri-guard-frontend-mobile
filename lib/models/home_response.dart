import 'dart:convert';

// To convert a JSON string to HomeResponse object:
HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

// To convert a HomeResponse object to JSON string:
String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  String? status;
  int? statusCode;
  Data? data;

  HomeResponse({this.status, this.statusCode, this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['status'] = status;
    dataMap['statusCode'] = statusCode;
    if (data != null) dataMap['data'] = data!.toJson();
    return dataMap;
  }
}

class Data {
  String? message;
  HomeData? homeData;

  Data({this.message, this.homeData});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    homeData =
    json['homeData'] != null ? HomeData.fromJson(json['homeData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['message'] = message;
    if (homeData != null) dataMap['homeData'] = homeData!.toJson();
    return dataMap;
  }
}

class HomeData {
  int? dailyProgressPercentage;
  DailyStats? dailyStats;
  List<Event>? events;
  Trends? trends;

  HomeData({this.dailyProgressPercentage, this.dailyStats, this.events, this.trends});

  HomeData.fromJson(Map<String, dynamic> json) {
    dailyProgressPercentage = json['dailyProgressPercentage'];
    dailyStats = json['dailyStats'] != null
        ? DailyStats.fromJson(json['dailyStats'])
        : null;
    if (json['events'] != null) {
      events = [];
      json['events'].forEach((v) {
        events!.add(Event.fromJson(v));
      });
    }
    trends =
    json['trends'] != null ? Trends.fromJson(json['trends']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['dailyProgressPercentage'] = dailyProgressPercentage;
    if (dailyStats != null) dataMap['dailyStats'] = dailyStats!.toJson();
    if (events != null)
      dataMap['events'] = events!.map((v) => v.toJson()).toList();
    if (trends != null) dataMap['trends'] = trends!.toJson();
    return dataMap;
  }
}

class DailyStats {
  int? readinessScore;
  dynamic sleep;
  dynamic heartRate;
  dynamic steps;
  dynamic calories;
  dynamic stress;
  dynamic spO2;
  dynamic weight;

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

  DailyStats.fromJson(Map<String, dynamic> json) {
    readinessScore = json['readinessScore'];
    sleep = json['sleep'];
    heartRate = json['heartRate'];
    steps = json['steps'];
    calories = json['calories'];
    stress = json['stress'];
    spO2 = json['spO2'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['readinessScore'] = readinessScore;
    dataMap['sleep'] = sleep;
    dataMap['heartRate'] = heartRate;
    dataMap['steps'] = steps;
    dataMap['calories'] = calories;
    dataMap['stress'] = stress;
    dataMap['spO2'] = spO2;
    dataMap['weight'] = weight;
    return dataMap;
  }
}

class Trends {
  SleepTrendWrapper? sleepTrend;
  HeartTrendWrapper? heartTrend;
  RespiratoryRateTrendWrapper? respiratoryRateTrend;
  Weight? weight;

  Trends({this.sleepTrend, this.heartTrend, this.respiratoryRateTrend, this.weight});

  Trends.fromJson(Map<String, dynamic> json) {
    sleepTrend = json['sleepTrend'] != null
        ? SleepTrendWrapper.fromJson(json['sleepTrend'])
        : null;
    heartTrend = json['heartTrend'] != null
        ? HeartTrendWrapper.fromJson(json['heartTrend'])
        : null;
    respiratoryRateTrend = json['respiratoryRateTrend'] != null
        ? RespiratoryRateTrendWrapper.fromJson(json['respiratoryRateTrend'])
        : null;
    weight =
    json['weight'] != null ? Weight.fromJson(json['weight']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    if (sleepTrend != null) dataMap['sleepTrend'] = sleepTrend!.toJson();
    if (heartTrend != null) dataMap['heartTrend'] = heartTrend!.toJson();
    if (respiratoryRateTrend != null)
      dataMap['respiratoryRateTrend'] = respiratoryRateTrend!.toJson();
    if (weight != null) dataMap['weight'] = weight!.toJson();
    return dataMap;
  }
}

class SleepTrendWrapper {
  int? averageSleepSeconds;
  List<SleepTrendItem>? sleepTrend;

  SleepTrendWrapper({this.averageSleepSeconds, this.sleepTrend});

  SleepTrendWrapper.fromJson(Map<String, dynamic> json) {
    averageSleepSeconds = json['averageSleepSeconds'];
    if (json['sleepTrend'] != null) {
      sleepTrend = [];
      json['sleepTrend'].forEach((v) {
        sleepTrend!.add(SleepTrendItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['averageSleepSeconds'] = averageSleepSeconds;
    if (sleepTrend != null) {
      dataMap['sleepTrend'] =
          sleepTrend!.map((v) => v.toJson()).toList();
    }
    return dataMap;
  }
}

class SleepTrendItem {
  String? day;
  String? date;
  int? sleepSeconds;

  SleepTrendItem({this.day, this.date, this.sleepSeconds});

  SleepTrendItem.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    date = json['date'];
    sleepSeconds = json['sleepSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['day'] = day;
    dataMap['date'] = date;
    dataMap['sleepSeconds'] = sleepSeconds;
    return dataMap;
  }
}

class HeartTrendWrapper {
  double? averageHeartPoints;
  double? averageBPM;
  List<HeartTrendItem>? heartTrend;

  HeartTrendWrapper({this.averageHeartPoints, this.averageBPM, this.heartTrend});

  HeartTrendWrapper.fromJson(Map<String, dynamic> json) {
    averageHeartPoints =
    json['averageHeartPoints'] != null ? json['averageHeartPoints'].toDouble() : null;
    averageBPM =
    json['averageBPM'] != null ? json['averageBPM'].toDouble() : null;
    if (json['heartTrend'] != null) {
      heartTrend = [];
      json['heartTrend'].forEach((v) {
        heartTrend!.add(HeartTrendItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['averageHeartPoints'] = averageHeartPoints;
    dataMap['averageBPM'] = averageBPM;
    if (heartTrend != null) {
      dataMap['heartTrend'] =
          heartTrend!.map((v) => v.toJson()).toList();
    }
    return dataMap;
  }
}

class HeartTrendItem {
  String? day;
  String? date;
  int? bpm;

  HeartTrendItem({this.day, this.date, this.bpm});

  HeartTrendItem.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    date = json['date'];
    bpm = json['bpm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['day'] = day;
    dataMap['date'] = date;
    dataMap['bpm'] = bpm;
    return dataMap;
  }
}

class RespiratoryRateTrendWrapper {
  double? averageRespiratoryRate;
  List<RespiratoryRateTrendItem>? respiratoryRateTrend;

  RespiratoryRateTrendWrapper({this.averageRespiratoryRate, this.respiratoryRateTrend});

  RespiratoryRateTrendWrapper.fromJson(Map<String, dynamic> json) {
    averageRespiratoryRate = json['averageRespiratoryRate'] != null
        ? json['averageRespiratoryRate'].toDouble()
        : null;
    if (json['respiratoryRateTrend'] != null) {
      respiratoryRateTrend = [];
      json['respiratoryRateTrend'].forEach((v) {
        respiratoryRateTrend!.add(RespiratoryRateTrendItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['averageRespiratoryRate'] = averageRespiratoryRate;
    if (respiratoryRateTrend != null) {
      dataMap['respiratoryRateTrend'] =
          respiratoryRateTrend!.map((v) => v.toJson()).toList();
    }
    return dataMap;
  }
}

class RespiratoryRateTrendItem {
  String? day;
  String? date;
  int? respiratoryRate;

  RespiratoryRateTrendItem({this.day, this.date, this.respiratoryRate});

  RespiratoryRateTrendItem.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    date = json['date'];
    respiratoryRate = json['respiratoryRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['day'] = day;
    dataMap['date'] = date;
    dataMap['respiratoryRate'] = respiratoryRate;
    return dataMap;
  }
}

class Weight {
  int? weight;
  String? unit;

  Weight({this.weight, this.unit});

  Weight.fromJson(Map<String, dynamic> json) {
    weight = json['weight'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['weight'] = weight;
    dataMap['unit'] = unit;
    return dataMap;
  }
}

class Event {
  int? userEventId;
  String? userEventUuid;
  int? userProfileId;
  String? eventName;
  String? eventType;
  String? eventDate;
  bool? completed;
  String? createdAt;
  String? updatedAt;

  Event(
      {this.userEventId,
        this.userEventUuid,
        this.userProfileId,
        this.eventName,
        this.eventType,
        this.eventDate,
        this.completed,
        this.createdAt,
        this.updatedAt});

  Event.fromJson(Map<String, dynamic> json) {
    userEventId = json['userEventId'];
    userEventUuid = json['userEventUuid'];
    userProfileId = json['userProfileId'];
    eventName = json['eventName'];
    eventType = json['eventType'];
    eventDate = json['eventDate'];
    completed = json['completed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['userEventId'] = userEventId;
    dataMap['userEventUuid'] = userEventUuid;
    dataMap['userProfileId'] = userProfileId;
    dataMap['eventName'] = eventName;
    dataMap['eventType'] = eventType;
    dataMap['eventDate'] = eventDate;
    dataMap['completed'] = completed;
    dataMap['createdAt'] = createdAt;
    dataMap['updatedAt'] = updatedAt;
    return dataMap;
  }
}
