class GetRespiratoryRateResponseModel {
  GetRespiratoryRateResponseModel({
    required this.status,
    required this.statusCode,
    required this.data,
  });

  final String status;
  final int statusCode;
  final Data? data;

  factory GetRespiratoryRateResponseModel.fromJson(Map<String, dynamic> json) {
    return GetRespiratoryRateResponseModel(
      status: json['status'],
      statusCode: json['statusCode'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'statusCode': statusCode,
      'data': data?.toJson(),
    };
  }
}

class Data {
  Data({
    required this.message,
    required this.respiratoryRateData,
  });

  final String message;
  final RespiratoryRateData? respiratoryRateData;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json['message'],
      respiratoryRateData: json['respiratoryRateData'] != null
          ? RespiratoryRateData.fromJson(json['respiratoryRateData'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'respiratoryRateData': respiratoryRateData?.toJson(),
    };
  }
}

class RespiratoryRateData {
  RespiratoryRateData({
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.source,
    required this.data,
  });

  final String userId;
  final String startDate;
  final String endDate;
  final String type;
  final List<Source> source;
  final List<dynamic> data;

  factory RespiratoryRateData.fromJson(Map<String, dynamic> json) {
    return RespiratoryRateData(
      userId: json['user_id'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      type: json['type'],
      source: List<Source>.from(
          (json['source'] ?? []).map((x) => Source.fromJson(x))),
      data: List<dynamic>.from(json['data'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'start_date': startDate,
      'end_date': endDate,
      'type': type,
      'source': source.map((x) => x.toJson()).toList(),
      'data': data,
    };
  }
}

class Source {
  Source({
    required this.name,
    required this.status,
  });

  final String name;
  final String status;

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
    };
  }
}
