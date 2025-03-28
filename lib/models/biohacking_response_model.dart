import 'dart:convert';
/// status : "success"
/// statusCode : 200
/// data : {"message":"Long term health recommendations retrieved successfully","biohackingRecommendations":{"FastingRecommendations":[{"startTime":"20:00","endTime":"12:00"}],"ColdHeatTherapy":[{"title":"Sauna Session","description":"Using a sauna can significantly improve mental clarity and promote recovery by reducing muscle tension and improving circulation.","details":[{"title":"Mental Clarity","details":"Regular sauna sessions can enhance mental clarity by boosting cerebral blood flow, leading to improved focus and cognitive function."},{"title":"Physical Recovery","details":"Sauna therapy can help in muscle recovery post-exercise by reducing soreness and promoting faster healing through increased circulation."},{"title":"Stress Reduction","details":"Spending time in a sauna can lower stress hormones and promote relaxation, contributing to an overall decrease in stress levels."}]}],"SupplementsForPeakPerformance":[{"title":"L-Theanine","description":"L-Theanine is known for its ability to enhance relaxation without sedation and promote focus, making it a great supplement for those seeking to improve mental performance.","details":[{"title":"Enhanced Focus","details":"L-Theanine increases the production of alpha waves in the brain, which can lead to improved focus and attention during tasks."},{"title":"Stress Reduction","details":"This supplement can mitigate some of the negative effects of caffeine and reduce anxiety, enhancing overall performance and mental clarity."},{"title":"Sleep Quality Improvement","details":"L-Theanine may also improve sleep quality by promoting relaxation and decreasing levels of stress hormones."}]},{"title":"Ashwagandha","description":"Ashwagandha is an adaptogen that helps the body manage stress and improve overall wellness, making it a valuable supplement for performance enhancement.","details":[{"title":"Stress Management","details":"Ashwagandha significantly reduces cortisol levels in the body, helping to manage daily stress and improve overall sense of well-being."},{"title":"Physical Performance","details":"Studies suggest that Ashwagandha can enhance physical performance by increasing strength and endurance during workouts."},{"title":"Mental Clarity","details":"This herb promotes cognitive function and memory, making it a great addition for those focused on mental performance."}]}]}}

BiohackingResponseModel biohackingResponseModelFromJson(String str) => BiohackingResponseModel.fromJson(json.decode(str));
String biohackingResponseModelToJson(BiohackingResponseModel data) => json.encode(data.toJson());
class BiohackingResponseModel {
  BiohackingResponseModel({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  BiohackingResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
BiohackingResponseModel copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => BiohackingResponseModel(  status: status ?? _status,
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

/// message : "Long term health recommendations retrieved successfully"
/// biohackingRecommendations : {"FastingRecommendations":[{"startTime":"20:00","endTime":"12:00"}],"ColdHeatTherapy":[{"title":"Sauna Session","description":"Using a sauna can significantly improve mental clarity and promote recovery by reducing muscle tension and improving circulation.","details":[{"title":"Mental Clarity","details":"Regular sauna sessions can enhance mental clarity by boosting cerebral blood flow, leading to improved focus and cognitive function."},{"title":"Physical Recovery","details":"Sauna therapy can help in muscle recovery post-exercise by reducing soreness and promoting faster healing through increased circulation."},{"title":"Stress Reduction","details":"Spending time in a sauna can lower stress hormones and promote relaxation, contributing to an overall decrease in stress levels."}]}],"SupplementsForPeakPerformance":[{"title":"L-Theanine","description":"L-Theanine is known for its ability to enhance relaxation without sedation and promote focus, making it a great supplement for those seeking to improve mental performance.","details":[{"title":"Enhanced Focus","details":"L-Theanine increases the production of alpha waves in the brain, which can lead to improved focus and attention during tasks."},{"title":"Stress Reduction","details":"This supplement can mitigate some of the negative effects of caffeine and reduce anxiety, enhancing overall performance and mental clarity."},{"title":"Sleep Quality Improvement","details":"L-Theanine may also improve sleep quality by promoting relaxation and decreasing levels of stress hormones."}]},{"title":"Ashwagandha","description":"Ashwagandha is an adaptogen that helps the body manage stress and improve overall wellness, making it a valuable supplement for performance enhancement.","details":[{"title":"Stress Management","details":"Ashwagandha significantly reduces cortisol levels in the body, helping to manage daily stress and improve overall sense of well-being."},{"title":"Physical Performance","details":"Studies suggest that Ashwagandha can enhance physical performance by increasing strength and endurance during workouts."},{"title":"Mental Clarity","details":"This herb promotes cognitive function and memory, making it a great addition for those focused on mental performance."}]}]}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? message, 
      BiohackingRecommendations? biohackingRecommendations,}){
    _message = message;
    _biohackingRecommendations = biohackingRecommendations;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _biohackingRecommendations = json['biohackingRecommendations'] != null ? BiohackingRecommendations.fromJson(json['biohackingRecommendations']) : null;
  }
  String? _message;
  BiohackingRecommendations? _biohackingRecommendations;
Data copyWith({  String? message,
  BiohackingRecommendations? biohackingRecommendations,
}) => Data(  message: message ?? _message,
  biohackingRecommendations: biohackingRecommendations ?? _biohackingRecommendations,
);
  String? get message => _message;
  BiohackingRecommendations? get biohackingRecommendations => _biohackingRecommendations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_biohackingRecommendations != null) {
      map['biohackingRecommendations'] = _biohackingRecommendations?.toJson();
    }
    return map;
  }

}

/// FastingRecommendations : [{"startTime":"20:00","endTime":"12:00"}]
/// ColdHeatTherapy : [{"title":"Sauna Session","description":"Using a sauna can significantly improve mental clarity and promote recovery by reducing muscle tension and improving circulation.","details":[{"title":"Mental Clarity","details":"Regular sauna sessions can enhance mental clarity by boosting cerebral blood flow, leading to improved focus and cognitive function."},{"title":"Physical Recovery","details":"Sauna therapy can help in muscle recovery post-exercise by reducing soreness and promoting faster healing through increased circulation."},{"title":"Stress Reduction","details":"Spending time in a sauna can lower stress hormones and promote relaxation, contributing to an overall decrease in stress levels."}]}]
/// SupplementsForPeakPerformance : [{"title":"L-Theanine","description":"L-Theanine is known for its ability to enhance relaxation without sedation and promote focus, making it a great supplement for those seeking to improve mental performance.","details":[{"title":"Enhanced Focus","details":"L-Theanine increases the production of alpha waves in the brain, which can lead to improved focus and attention during tasks."},{"title":"Stress Reduction","details":"This supplement can mitigate some of the negative effects of caffeine and reduce anxiety, enhancing overall performance and mental clarity."},{"title":"Sleep Quality Improvement","details":"L-Theanine may also improve sleep quality by promoting relaxation and decreasing levels of stress hormones."}]},{"title":"Ashwagandha","description":"Ashwagandha is an adaptogen that helps the body manage stress and improve overall wellness, making it a valuable supplement for performance enhancement.","details":[{"title":"Stress Management","details":"Ashwagandha significantly reduces cortisol levels in the body, helping to manage daily stress and improve overall sense of well-being."},{"title":"Physical Performance","details":"Studies suggest that Ashwagandha can enhance physical performance by increasing strength and endurance during workouts."},{"title":"Mental Clarity","details":"This herb promotes cognitive function and memory, making it a great addition for those focused on mental performance."}]}]

BiohackingRecommendations biohackingRecommendationsFromJson(String str) => BiohackingRecommendations.fromJson(json.decode(str));
String biohackingRecommendationsToJson(BiohackingRecommendations data) => json.encode(data.toJson());
class BiohackingRecommendations {
  BiohackingRecommendations({
      List<FastingRecommendations>? fastingRecommendations, 
      List<ColdHeatTherapy>? coldHeatTherapy, 
      List<SupplementsForPeakPerformance>? supplementsForPeakPerformance,}){
    _fastingRecommendations = fastingRecommendations;
    _coldHeatTherapy = coldHeatTherapy;
    _supplementsForPeakPerformance = supplementsForPeakPerformance;
}

  BiohackingRecommendations.fromJson(dynamic json) {
    if (json['FastingRecommendations'] != null) {
      _fastingRecommendations = [];
      json['FastingRecommendations'].forEach((v) {
        _fastingRecommendations?.add(FastingRecommendations.fromJson(v));
      });
    }
    if (json['ColdHeatTherapy'] != null) {
      _coldHeatTherapy = [];
      json['ColdHeatTherapy'].forEach((v) {
        _coldHeatTherapy?.add(ColdHeatTherapy.fromJson(v));
      });
    }
    if (json['SupplementsForPeakPerformance'] != null) {
      _supplementsForPeakPerformance = [];
      json['SupplementsForPeakPerformance'].forEach((v) {
        _supplementsForPeakPerformance?.add(SupplementsForPeakPerformance.fromJson(v));
      });
    }
  }
  List<FastingRecommendations>? _fastingRecommendations;
  List<ColdHeatTherapy>? _coldHeatTherapy;
  List<SupplementsForPeakPerformance>? _supplementsForPeakPerformance;
BiohackingRecommendations copyWith({  List<FastingRecommendations>? fastingRecommendations,
  List<ColdHeatTherapy>? coldHeatTherapy,
  List<SupplementsForPeakPerformance>? supplementsForPeakPerformance,
}) => BiohackingRecommendations(  fastingRecommendations: fastingRecommendations ?? _fastingRecommendations,
  coldHeatTherapy: coldHeatTherapy ?? _coldHeatTherapy,
  supplementsForPeakPerformance: supplementsForPeakPerformance ?? _supplementsForPeakPerformance,
);
  List<FastingRecommendations>? get fastingRecommendations => _fastingRecommendations;
  List<ColdHeatTherapy>? get coldHeatTherapy => _coldHeatTherapy;
  List<SupplementsForPeakPerformance>? get supplementsForPeakPerformance => _supplementsForPeakPerformance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_fastingRecommendations != null) {
      map['FastingRecommendations'] = _fastingRecommendations?.map((v) => v.toJson()).toList();
    }
    if (_coldHeatTherapy != null) {
      map['ColdHeatTherapy'] = _coldHeatTherapy?.map((v) => v.toJson()).toList();
    }
    if (_supplementsForPeakPerformance != null) {
      map['SupplementsForPeakPerformance'] = _supplementsForPeakPerformance?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "L-Theanine"
/// description : "L-Theanine is known for its ability to enhance relaxation without sedation and promote focus, making it a great supplement for those seeking to improve mental performance."
/// details : [{"title":"Enhanced Focus","details":"L-Theanine increases the production of alpha waves in the brain, which can lead to improved focus and attention during tasks."},{"title":"Stress Reduction","details":"This supplement can mitigate some of the negative effects of caffeine and reduce anxiety, enhancing overall performance and mental clarity."},{"title":"Sleep Quality Improvement","details":"L-Theanine may also improve sleep quality by promoting relaxation and decreasing levels of stress hormones."}]

SupplementsForPeakPerformance supplementsForPeakPerformanceFromJson(String str) => SupplementsForPeakPerformance.fromJson(json.decode(str));
String supplementsForPeakPerformanceToJson(SupplementsForPeakPerformance data) => json.encode(data.toJson());
class SupplementsForPeakPerformance {
  SupplementsForPeakPerformance({
      String? title, 
      String? description, 
      List<Details>? details,}){
    _title = title;
    _description = description;
    _details = details;
}

  SupplementsForPeakPerformance.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    if (json['details'] != null) {
      _details = [];
      json['details'].forEach((v) {
        _details?.add(Details.fromJson(v));
      });
    }
  }
  String? _title;
  String? _description;
  List<Details>? _details;
SupplementsForPeakPerformance copyWith({  String? title,
  String? description,
  List<Details>? details,
}) => SupplementsForPeakPerformance(  title: title ?? _title,
  description: description ?? _description,
  details: details ?? _details,
);
  String? get title => _title;
  String? get description => _description;
  List<Details>? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    if (_details != null) {
      map['details'] = _details?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "Enhanced Focus"
/// details : "L-Theanine increases the production of alpha waves in the brain, which can lead to improved focus and attention during tasks."

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

/// title : "Sauna Session"
/// description : "Using a sauna can significantly improve mental clarity and promote recovery by reducing muscle tension and improving circulation."
/// details : [{"title":"Mental Clarity","details":"Regular sauna sessions can enhance mental clarity by boosting cerebral blood flow, leading to improved focus and cognitive function."},{"title":"Physical Recovery","details":"Sauna therapy can help in muscle recovery post-exercise by reducing soreness and promoting faster healing through increased circulation."},{"title":"Stress Reduction","details":"Spending time in a sauna can lower stress hormones and promote relaxation, contributing to an overall decrease in stress levels."}]

ColdHeatTherapy coldHeatTherapyFromJson(String str) => ColdHeatTherapy.fromJson(json.decode(str));
String coldHeatTherapyToJson(ColdHeatTherapy data) => json.encode(data.toJson());
class ColdHeatTherapy {
  ColdHeatTherapy({
      String? title, 
      String? description, 
      List<Details>? details,}){
    _title = title;
    _description = description;
    _details = details;
}

  ColdHeatTherapy.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    if (json['details'] != null) {
      _details = [];
      json['details'].forEach((v) {
        _details?.add(Details.fromJson(v));
      });
    }
  }
  String? _title;
  String? _description;
  List<Details>? _details;
ColdHeatTherapy copyWith({  String? title,
  String? description,
  List<Details>? details,
}) => ColdHeatTherapy(  title: title ?? _title,
  description: description ?? _description,
  details: details ?? _details,
);
  String? get title => _title;
  String? get description => _description;
  List<Details>? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    if (_details != null) {
      map['details'] = _details?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "Mental Clarity"
/// details : "Regular sauna sessions can enhance mental clarity by boosting cerebral blood flow, leading to improved focus and cognitive function."


/// startTime : "20:00"
/// endTime : "12:00"

FastingRecommendations fastingRecommendationsFromJson(String str) => FastingRecommendations.fromJson(json.decode(str));
String fastingRecommendationsToJson(FastingRecommendations data) => json.encode(data.toJson());
class FastingRecommendations {
  FastingRecommendations({
    String? startTime,
    String? endTime,}) {
    _startTime = startTime;
    _endTime = endTime;
  }

  FastingRecommendations.fromJson(dynamic json) {
    _startTime = json['startTime'];
    _endTime = json['endTime'];
  }

  String? _startTime;
  String? _endTime;

  FastingRecommendations copyWith({ String? startTime,
    String? endTime,
  }) =>
      FastingRecommendations(startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
      );

  String? get startTime => _startTime;

  String? get endTime => _endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['startTime'] = _startTime;
    map['endTime'] = _endTime;
    return map;
  }
}