class GetHeartRateResponseModel {
  GetHeartRateResponseModel({
    required String status,
    required num statusCode,
    required Data data,
  })  : _status = status,
        _statusCode = statusCode,
        _data = data;

  GetHeartRateResponseModel.fromJson(dynamic json)
      : _status = json['status'],
        _statusCode = json['statusCode'],
        _data = json['data'] != null ? Data.fromJson(json['data']) : null;

  final String _status;
  final num _statusCode;
  final Data? _data;

  GetHeartRateResponseModel copyWith({
    String? status,
    num? statusCode,
    Data? data,
  }) =>
      GetHeartRateResponseModel(
        status: status ?? _status,
        statusCode: statusCode ?? _statusCode,
        data: data ?? _data!,
      );

  String get status => _status;
  num get statusCode => _statusCode;
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

class Data {
  Data({
    required String message,
    required HeartRateData heartRateData,
  })  : _message = message,
        _heartRateData = heartRateData;

  Data.fromJson(dynamic json)
      : _message = json['message'],
        _heartRateData =
        json['heartRateData'] != null ? HeartRateData.fromJson(json['heartRateData']) : null;

  final String _message;
  final HeartRateData? _heartRateData;

  Data copyWith({
    String? message,
    HeartRateData? heartRateData,
  }) =>
      Data(
        message: message ?? _message,
        heartRateData: heartRateData ?? _heartRateData!,
      );

  String get message => _message;
  HeartRateData? get heartRateData => _heartRateData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_heartRateData != null) {
      map['heartRateData'] = _heartRateData!.toJson();
    }
    return map;
  }
}

class HeartRateData {
  HeartRateData({
    required String userId,
    required String startDate,
    required String endDate,
    required String type,
    required List<Source> source,
    required List<HeartRateEntry> data,
  })  : _userId = userId,
        _startDate = startDate,
        _endDate = endDate,
        _type = type,
        _source = source,
        _data = data;

  HeartRateData.fromJson(dynamic json)
      : _userId = json['user_id'],
        _startDate = json['start_date'],
        _endDate = json['end_date'],
        _type = json['type'],
        _source = (json['source'] as List).map((v) => Source.fromJson(v)).toList(),
        _data = (json['data'] as List).map((v) => HeartRateEntry.fromJson(v)).toList();

  final String _userId;
  final String _startDate;
  final String _endDate;
  final String _type;
  final List<Source> _source;
  final List<HeartRateEntry> _data;

  HeartRateData copyWith({
    String? userId,
    String? startDate,
    String? endDate,
    String? type,
    List<Source>? source,
    List<HeartRateEntry>? data,
  }) =>
      HeartRateData(
        userId: userId ?? _userId,
        startDate: startDate ?? _startDate,
        endDate: endDate ?? _endDate,
        type: type ?? _type,
        source: source ?? _source,
        data: data ?? _data,
      );

  String get userId => _userId;
  String get startDate => _startDate;
  String get endDate => _endDate;
  String get type => _type;
  List<Source> get source => _source;
  List<HeartRateEntry> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['type'] = _type;
    map['source'] = _source.map((v) => v.toJson()).toList();
    map['data'] = _data.map((v) => v.toJson()).toList();
    return map;
  }
}

class HeartRateEntry {
  HeartRateEntry({
    required String date,
    required dynamic restingHr,
    required dynamic timezoneOffset,
    required dynamic minHr,
    required dynamic avgHr,
    required dynamic maxHr,
    required List<dynamic> heartRateSamples,
    required dynamic heartRateVariability,
    required dynamic intradayHrv,
    required String source,
  })  : _date = date,
        _restingHr = restingHr,
        _timezoneOffset = timezoneOffset,
        _minHr = minHr,
        _avgHr = avgHr,
        _maxHr = maxHr,
        _heartRateSamples = heartRateSamples,
        _heartRateVariability = heartRateVariability,
        _intradayHrv = intradayHrv,
        _source = source;

  HeartRateEntry.fromJson(dynamic json)
      : _date = json['date'],
        _restingHr = json['resting_hr'],
        _timezoneOffset = json['timezone_offset'],
        _minHr = json['min_hr'],
        _avgHr = json['avg_hr'],
        _maxHr = json['max_hr'],
        _heartRateSamples = json['heart_rate_samples'] ?? [],
        _heartRateVariability = json['heart_rate_variability'],
        _intradayHrv = json['intraday_hrv'],
        _source = json['source'];

  final String _date;
  final dynamic _restingHr;
  final dynamic _timezoneOffset;
  final dynamic _minHr;
  final dynamic _avgHr;
  final dynamic _maxHr;
  final List<dynamic> _heartRateSamples;
  final dynamic _heartRateVariability;
  final dynamic _intradayHrv;
  final String _source;

  HeartRateEntry copyWith({
    String? date,
    dynamic? restingHr,
    dynamic? timezoneOffset,
    dynamic? minHr,
    dynamic? avgHr,
    dynamic? maxHr,
    List<dynamic>? heartRateSamples,
    dynamic? heartRateVariability,
    dynamic? intradayHrv,
    String? source,
  }) =>
      HeartRateEntry(
        date: date ?? _date,
        restingHr: restingHr ?? _restingHr,
        timezoneOffset: timezoneOffset ?? _timezoneOffset,
        minHr: minHr ?? _minHr,
        avgHr: avgHr ?? _avgHr,
        maxHr: maxHr ?? _maxHr,
        heartRateSamples: heartRateSamples ?? _heartRateSamples,
        heartRateVariability: heartRateVariability ?? _heartRateVariability,
        intradayHrv: intradayHrv ?? _intradayHrv,
        source: source ?? _source,
      );

  String get date => _date;
  dynamic get restingHr => _restingHr;
  dynamic get timezoneOffset => _timezoneOffset;
  dynamic get minHr => _minHr;
  dynamic get avgHr => _avgHr;
  dynamic get maxHr => _maxHr;
  List<dynamic> get heartRateSamples => _heartRateSamples;
  dynamic get heartRateVariability => _heartRateVariability;
  dynamic get intradayHrv => _intradayHrv;
  String get source => _source;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['resting_hr'] = _restingHr;
    map['timezone_offset'] = _timezoneOffset;
    map['min_hr'] = _minHr;
    map['avg_hr'] = _avgHr;
    map['max_hr'] = _maxHr;
    map['heart_rate_samples'] = _heartRateSamples;
    map['heart_rate_variability'] = _heartRateVariability;
    map['intraday_hrv'] = _intradayHrv;
    map['source'] = _source;
    return map;
  }
}

class Source {
  Source({
    required String name,
    required String status,
  })  : _name = name,
        _status = status;

  Source.fromJson(dynamic json)
      : _name = json['name'],
        _status = json['status'];

  final String _name;
  final String _status;

  Source copyWith({
    String? name,
    String? status,
  }) =>
      Source(
        name: name ?? _name,
        status: status ?? _status,
      );

  String get name => _name;
  String get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['status'] = _status;
    return map;
  }
}
