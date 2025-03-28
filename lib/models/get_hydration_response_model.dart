class GetHydrationResponseModel {
  GetHydrationResponseModel({
    required this.status,
    required this.statusCode,
    required this.data,
  });

  final String status;
  final int statusCode;
  final Data? data;

  factory GetHydrationResponseModel.fromJson(Map<String, dynamic> json) {
    return GetHydrationResponseModel(
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
    this.hydrationData,
  });

  final String message;
  final dynamic hydrationData;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json['message'],
      hydrationData: json['hydrationData'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'hydrationData': hydrationData,
    };
  }
}
