class PatchGenderModelResponse {
  String status;
  num statusCode;
  Data? data;  // Make the data field nullable

  PatchGenderModelResponse({
    required this.status,
    required this.statusCode,
    this.data,  // Make data optional
  });

  PatchGenderModelResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        statusCode = json['statusCode'],
        data = json['data'] != null ? Data.fromJson(json['data']) : null;

  PatchGenderModelResponse copyWith({
    String? status,
    num? statusCode,
    Data? data,
  }) {
    return PatchGenderModelResponse(
      status: status ?? this.status,
      statusCode: statusCode ?? this.statusCode,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['status'] = status;
    map['statusCode'] = statusCode;
    if (data != null) {
      map['data'] = data!.toJson();  // Null check for data
    }
    return map;
  }
}

class Data {
  String message;

  Data({
    required this.message,
  });

  Data.fromJson(Map<String, dynamic> json) : message = json['message'];

  Data copyWith({
    String? message,
  }) {
    return Data(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['message'] = message;
    return map;
  }
}
