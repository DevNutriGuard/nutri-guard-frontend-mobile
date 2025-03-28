class GetStepsResponseModel {
  GetStepsResponseModel({
    required String status,
    required num statusCode,
    required Data data,
  }) : _status = status,
        _statusCode = statusCode,
        _data = data;

  GetStepsResponseModel.fromJson(dynamic json)
      : _status = json['status'],
        _statusCode = json['statusCode'],
        _data = json['data'] != null ? Data.fromJson(json['data']) : Data(message: "", stepsData: null);

  final String _status;
  final num _statusCode;
  final Data _data;

  GetStepsResponseModel copyWith({
    String? status,
    num? statusCode,
    Data? data,
  }) => GetStepsResponseModel(
    status: status ?? _status,
    statusCode: statusCode ?? _statusCode,
    data: data ?? _data,
  );

  String get status => _status;
  num get statusCode => _statusCode;
  Data get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['statusCode'] = _statusCode;
    map['data'] = _data.toJson();
    return map;
  }
}

class Data {
  Data({
    required String message,
    required this.stepsData,
  }) : _message = message;

  Data.fromJson(dynamic json)
      : _message = json['message'],
        stepsData = json['stepsData'] != null ? StepsData.fromJson(json['stepsData']) : null;

  final String _message;
  final StepsData? stepsData; // Nullable StepsData

  Data copyWith({
    String? message,
    StepsData? stepsData,
  }) => Data(
    message: message ?? _message,
    stepsData: stepsData ?? this.stepsData,
  );

  String get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (stepsData != null) {
      map['stepsData'] = stepsData!.toJson();
    }
    return map;
  }
}


class StepsData {
  StepsData({
    required String userId,
    required String startDate,
    required String endDate,
    required String type,
    required List<Source> source,
    required List<StepsDataDetails> data,
  }) : _userId = userId,
        _startDate = startDate,
        _endDate = endDate,
        _type = type,
        _source = source,
        _data = data;

  StepsData.fromJson(dynamic json)
      : _userId = json['user_id'],
        _startDate = json['start_date'],
        _endDate = json['end_date'],
        _type = json['type'],
        _source = (json['source'] as List).map((v) => Source.fromJson(v)).toList(),
        _data = (json['data'] as List).map((v) => StepsDataDetails.fromJson(v)).toList();

  final String _userId;
  final String _startDate;
  final String _endDate;
  final String _type;
  final List<Source> _source;
  final List<StepsDataDetails> _data;

  StepsData copyWith({
    String? userId,
    String? startDate,
    String? endDate,
    String? type,
    List<Source>? source,
    List<StepsDataDetails>? data,
  }) => StepsData(
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
  List<StepsDataDetails> get data => _data;

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

class StepsDataDetails {
  StepsDataDetails({
    required String date,
    required num value,
    required String source,
    required List<IntradayData> intradayData,
  }) : _date = date, _value = value, _source = source, _intradayData = intradayData;

  StepsDataDetails.fromJson(dynamic json)
      : _date = json['date'],
        _value = json['value'],
        _source = json['source'],
        _intradayData = (json['intraday_data'] as List).map((v) => IntradayData.fromJson(v)).toList();

  final String _date;
  final num _value;
  final String _source;
  final List<IntradayData> _intradayData;

  StepsDataDetails copyWith({
    String? date,
    num? value,
    String? source,
    List<IntradayData>? intradayData,
  }) => StepsDataDetails(
    date: date ?? _date,
    value: value ?? _value,
    source: source ?? _source,
    intradayData: intradayData ?? _intradayData,
  );

  String get date => _date;
  num get value => _value;
  String get source => _source;
  List<IntradayData> get intradayData => _intradayData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['value'] = _value;
    map['source'] = _source;
    map['intraday_data'] = _intradayData.map((v) => v.toJson()).toList();
    return map;
  }
}

class IntradayData {
  IntradayData({
    required String time,
    required num value,
  }) : _time = time, _value = value;

  IntradayData.fromJson(dynamic json)
      : _time = json['time'],
        _value = json['value'];

  final String _time;
  final num _value;

  IntradayData copyWith({
    String? time,
    num? value,
  }) => IntradayData(
    time: time ?? _time,
    value: value ?? _value,
  );

  String get time => _time;
  num get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['value'] = _value;
    return map;
  }
}

class Source {
  Source({
    required String name,
    required String status,
  }) : _name = name, _status = status;

  Source.fromJson(dynamic json)
      : _name = json['name'],
        _status = json['status'];

  final String _name;
  final String _status;

  Source copyWith({
    String? name,
    String? status,
  }) => Source(
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
