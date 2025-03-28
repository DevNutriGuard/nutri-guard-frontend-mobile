class GetCaloriesResponseModel {
  GetCaloriesResponseModel({
    String? status,
    num? statusCode,
    CaloriesResponseData? data,
  }) {
    _status = status;
    _statusCode = statusCode;
    _data = data;
  }

  GetCaloriesResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? CaloriesResponseData.fromJson(json['data']) : null;
  }

  String? _status;
  num? _statusCode;
  CaloriesResponseData? _data;

  String? get status => _status;
  num? get statusCode => _statusCode;
  CaloriesResponseData? get data => _data;

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

class CaloriesResponseData {
  CaloriesResponseData({
    String? message,
    CaloriesData? caloriesData,
  }) {
    _message = message;
    _caloriesData = caloriesData;
  }

  CaloriesResponseData.fromJson(dynamic json) {
    _message = json['message'];
    _caloriesData = json['caloriesData'] != null ? CaloriesData.fromJson(json['caloriesData']) : null;
  }

  String? _message;
  CaloriesData? _caloriesData;

  String? get message => _message;
  CaloriesData? get caloriesData => _caloriesData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_caloriesData != null) {
      map['caloriesData'] = _caloriesData!.toJson();
    }
    return map;
  }
}

class CaloriesData {
  CaloriesData({
    String? userId,
    String? startDate,
    String? endDate,
    String? type,
    List<Source>? source,
    List<CaloriesDetailData>? data,
  }) {
    _userId = userId;
    _startDate = startDate;
    _endDate = endDate;
    _type = type;
    _source = source;
    _data = data;
  }

  CaloriesData.fromJson(dynamic json) {
    _userId = json['user_id'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _type = json['type'];
    if (json['source'] != null) {
      _source = [];
      json['source'].forEach((v) {
        _source!.add(Source.fromJson(v));
      });
    }
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(CaloriesDetailData.fromJson(v));
      });
    }
  }

  String? _userId;
  String? _startDate;
  String? _endDate;
  String? _type;
  List<Source>? _source;
  List<CaloriesDetailData>? _data;

  String? get userId => _userId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get type => _type;
  List<Source>? get source => _source;
  List<CaloriesDetailData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['type'] = _type;
    if (_source != null) {
      map['source'] = _source!.map((v) => v.toJson()).toList();
    }
    if (_data != null) {
      map['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CaloriesDetailData {
  CaloriesDetailData({
    String? date,
    num? value,
    String? source,
    List<IntradayData>? intradayData,
  }) {
    _date = date;
    _value = value;
    _source = source;
    _intradayData = intradayData;
  }

  CaloriesDetailData.fromJson(dynamic json) {
    _date = json['date'];
    _value = json['value'];
    _source = json['source'];
    if (json['intraday_data'] != null) {
      _intradayData = [];
      json['intraday_data'].forEach((v) {
        _intradayData!.add(IntradayData.fromJson(v));
      });
    }
  }

  String? _date;
  num? _value;
  String? _source;
  List<IntradayData>? _intradayData;

  String? get date => _date;
  num? get value => _value;
  String? get source => _source;
  List<IntradayData>? get intradayData => _intradayData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['value'] = _value;
    map['source'] = _source;
    if (_intradayData != null) {
      map['intraday_data'] = _intradayData!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class IntradayData {
  IntradayData({
    num? level,
    num? mets,
    String? time,
    num? value,
  }) {
    _level = level;
    _mets = mets;
    _time = time;
    _value = value;
  }

  IntradayData.fromJson(dynamic json) {
    _level = json['level'];
    _mets = json['mets'];
    _time = json['time'];
    _value = json['value'];
  }

  num? _level;
  num? _mets;
  String? _time;
  num? _value;

  num? get level => _level;
  num? get mets => _mets;
  String? get time => _time;
  num? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['level'] = _level;
    map['mets'] = _mets;
    map['time'] = _time;
    map['value'] = _value;
    return map;
  }
}

class Source {
  Source({
    String? name,
    String? status,
  }) {
    _name = name;
    _status = status;
  }

  Source.fromJson(dynamic json) {
    _name = json['name'];
    _status = json['status'];
  }

  String? _name;
  String? _status;

  String? get name => _name;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['status'] = _status;
    return map;
  }
}
