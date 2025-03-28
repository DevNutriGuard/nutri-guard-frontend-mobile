class GetSleepDurationResponseModel {
  final String status;
  final num statusCode;
  final Data data;

  GetSleepDurationResponseModel({
    required this.status,
    required this.statusCode,
    required this.data,
  });

  factory GetSleepDurationResponseModel.fromJson(Map<String, dynamic> json) {
    return GetSleepDurationResponseModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: json['data'] != null
          ? Data.fromJson(json['data'])
          : Data(message: '', sleepDurationData: SleepDurationData.defaultData()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'statusCode': statusCode,
      'data': data.toJson(),
    };
  }
}

class Data {
  final String message;
  final SleepDurationData sleepDurationData;

  Data({
    required this.message,
    required this.sleepDurationData,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json['message'] ?? '',
      sleepDurationData: json['sleepDurationData'] != null
          ? SleepDurationData.fromJson(json['sleepDurationData'])
          : SleepDurationData.defaultData(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'sleepDurationData': sleepDurationData.toJson(),
    };
  }
}

class SleepDurationData {
  final String userId;
  final String startDate;
  final String endDate;
  final String type;
  final List<Source> source;
  final List<dynamic> data;

  SleepDurationData({
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.source,
    required this.data,
  });

  factory SleepDurationData.fromJson(Map<String, dynamic> json) {
    return SleepDurationData(
      userId: json['user_id'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      type: json['type'] ?? '',
      source: (json['source'] as List<dynamic>?)
          ?.map((item) => Source.fromJson(item))
          .toList() ??
          [],
      data: json['data'] ?? [],
    );
  }

  /// Provide a default instance for fallback
  static SleepDurationData defaultData() {
    return SleepDurationData(
      userId: '',
      startDate: '',
      endDate: '',
      type: '',
      source: [],
      data: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'start_date': startDate,
      'end_date': endDate,
      'type': type,
      'source': source.map((e) => e.toJson()).toList(),
      'data': data,
    };
  }
}

class Source {
  final String name;
  final String status;

  Source({
    required this.name,
    required this.status,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json['name'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
    };
  }
}
