class CommonResponse {
  int? status;
  dynamic data;
  var message;
  bool? error;

  CommonResponse({this.data, this.message, this.error});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['message'] = message;
    data['error'] = error;
    return data;
  }
}
