/// status : "success"
/// statusCode : 200
/// data : {"message":"Readiness scores for intervals retrieved successfully","readinessData":{"0:00–4:00":29,"4:00–8:00":29,"8:00–12:00":29,"12:00–16:00":29,"16:00–20:00":29,"20:00–24:00":29}}

class GetReadinessData {
  GetReadinessData({
    String? status,
    num? statusCode,
    Data? data,
  }) {
    _status = status;
    _statusCode = statusCode;
    _data = data;
  }

  GetReadinessData.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _status;
  num? _statusCode;
  Data? _data;

  GetReadinessData copyWith({
    String? status,
    num? statusCode,
    Data? data,
  }) =>
      GetReadinessData(
        status: status ?? _status,
        statusCode: statusCode ?? _statusCode,
        data: data ?? _data,
      );

  String? get status => _status;
  num? get statusCode => _statusCode;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['statusCode'] = _statusCode;
    if (_data != null) {
      map['data'] = _data!.toJson();
    }
    return map;
  }
}

/// message : "Readiness scores for intervals retrieved successfully"
/// readinessData : {"0:00–4:00":29,"4:00–8:00":29,"8:00–12:00":29,"12:00–16:00":29,"16:00–20:00":29,"20:00–24:00":29}

class Data {
  Data({
    String? message,
    ReadinessData? readinessData,
  }) {
    _message = message;
    _readinessData = readinessData;
  }

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _readinessData =
    json['readinessData'] != null ? ReadinessData.fromJson(json['readinessData']) : null;
  }

  String? _message;
  ReadinessData? _readinessData;

  Data copyWith({
    String? message,
    ReadinessData? readinessData,
  }) =>
      Data(
        message: message ?? _message,
        readinessData: readinessData ?? _readinessData,
      );

  String? get message => _message;
  ReadinessData? get readinessData => _readinessData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_readinessData != null) {
      map['readinessData'] = _readinessData!.toJson();
    }
    return map;
  }
}

/// 0:00–4:00 : 29
/// 4:00–8:00 : 29
/// 8:00–12:00 : 29
/// 12:00–16:00 : 29
/// 16:00–20:00 : 29
/// 20:00–24:00 : 29

class ReadinessData {
  ReadinessData({
    num? midnightTo4am,
    num? fourAmTo8am,
    num? eightAmTo12pm,
    num? twelvePmTo4pm,
    num? fourPmTo8pm,
    num? eightPmToMidnight,
  }) {
    _midnightTo4am = midnightTo4am;
    _fourAmTo8am = fourAmTo8am;
    _eightAmTo12pm = eightAmTo12pm;
    _twelvePmTo4pm = twelvePmTo4pm;
    _fourPmTo8pm = fourPmTo8pm;
    _eightPmToMidnight = eightPmToMidnight;
  }

  ReadinessData.fromJson(dynamic json) {
    _midnightTo4am = json['0:00–4:00'];
    _fourAmTo8am = json['4:00–8:00'];
    _eightAmTo12pm = json['8:00–12:00'];
    _twelvePmTo4pm = json['12:00–16:00'];
    _fourPmTo8pm = json['16:00–20:00'];
    _eightPmToMidnight = json['20:00–24:00'];
  }

  num? _midnightTo4am;
  num? _fourAmTo8am;
  num? _eightAmTo12pm;
  num? _twelvePmTo4pm;
  num? _fourPmTo8pm;
  num? _eightPmToMidnight;

  ReadinessData copyWith({
    num? midnightTo4am,
    num? fourAmTo8am,
    num? eightAmTo12pm,
    num? twelvePmTo4pm,
    num? fourPmTo8pm,
    num? eightPmToMidnight,
  }) =>
      ReadinessData(
        midnightTo4am: midnightTo4am ?? _midnightTo4am,
        fourAmTo8am: fourAmTo8am ?? _fourAmTo8am,
        eightAmTo12pm: eightAmTo12pm ?? _eightAmTo12pm,
        twelvePmTo4pm: twelvePmTo4pm ?? _twelvePmTo4pm,
        fourPmTo8pm: fourPmTo8pm ?? _fourPmTo8pm,
        eightPmToMidnight: eightPmToMidnight ?? _eightPmToMidnight,
      );

  num? get midnightTo4am => _midnightTo4am;
  num? get fourAmTo8am => _fourAmTo8am;
  num? get eightAmTo12pm => _eightAmTo12pm;
  num? get twelvePmTo4pm => _twelvePmTo4pm;
  num? get fourPmTo8pm => _fourPmTo8pm;
  num? get eightPmToMidnight => _eightPmToMidnight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['0:00–4:00'] = _midnightTo4am;
    map['4:00–8:00'] = _fourAmTo8am;
    map['8:00–12:00'] = _eightAmTo12pm;
    map['12:00–16:00'] = _twelvePmTo4pm;
    map['16:00–20:00'] = _fourPmTo8pm;
    map['20:00–24:00'] = _eightPmToMidnight;
    return map;
  }
}
