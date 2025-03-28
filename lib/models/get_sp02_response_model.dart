class GetSp02ResponseModel {
  GetSp02ResponseModel({
    required this.status,
    required this.statusCode,
    required this.data,
  });

  final String status;
  final int statusCode;
  final Data? data;

  factory GetSp02ResponseModel.fromJson(Map<String, dynamic> json) {
    return GetSp02ResponseModel(
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
    required this.sp02Data,
  });

  final String message;
  final Sp02Data? sp02Data;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json['message'],
      sp02Data: json['sp02Data'] != null ? Sp02Data.fromJson(json['sp02Data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'sp02Data': sp02Data?.toJson(),
    };
  }
}

class Sp02Data {
  Sp02Data({
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

  factory Sp02Data.fromJson(Map<String, dynamic> json) {
    return Sp02Data(
      userId: json['user_id'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      type: json['type'],
      source: List<Source>.from(
        (json['source'] ?? []).map((x) => Source.fromJson(x)),
      ),
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
