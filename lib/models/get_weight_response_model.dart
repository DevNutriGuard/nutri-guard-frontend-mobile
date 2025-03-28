import 'get_calories_response_model.dart';

class GetWeightResponseModel {
  GetWeightResponseModel({
    String? status,
    num? statusCode,
    Data? data,
  }) {
    _status = status;
    _statusCode = statusCode;
    _data = data;
  }

  GetWeightResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _status;
  num? _statusCode;
  Data? _data;

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

class Data {
  Data({
    String? message,
    WeightData? weightData,
  }) {
    _message = message;
    _weightData = weightData;
  }

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _weightData =
    json['weightData'] != null ? WeightData.fromJson(json['weightData']) : null;
  }

  String? _message;
  WeightData? _weightData;

  String? get message => _message;
  WeightData? get weightData => _weightData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_weightData != null) {
      map['weightData'] = _weightData!.toJson();
    }
    return map;
  }
}

class WeightData {
  WeightData({
    String? userId,
    String? startDate,
    String? endDate,
    String? type,
    List<Source>? source,
    List<WeightDetail>? data,
  }) {
    _userId = userId;
    _startDate = startDate;
    _endDate = endDate;
    _type = type;
    _source = source;
    _data = data;
  }

  WeightData.fromJson(dynamic json) {
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
        _data!.add(WeightDetail.fromJson(v));
      });
    }
  }

  String? _userId;
  String? _startDate;
  String? _endDate;
  String? _type;
  List<Source>? _source;
  List<WeightDetail>? _data;

  String? get userId => _userId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get type => _type;
  List<Source>? get source => _source;
  List<WeightDetail>? get data => _data;

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

class WeightDetail {
  WeightDetail({
    String? source,
    num? timezoneOffset,
    BodyData? bodyData,
    dynamic temperatureData,
    dynamic bloodPressureData,
  }) {
    _source = source;
    _timezoneOffset = timezoneOffset;
    _bodyData = bodyData;
    _temperatureData = temperatureData;
    _bloodPressureData = bloodPressureData;
  }

  WeightDetail.fromJson(dynamic json) {
    _source = json['source'];
    _timezoneOffset = json['timezone_offset'];
    _bodyData =
    json['body_data'] != null ? BodyData.fromJson(json['body_data']) : null;
    _temperatureData = json['temperature_data'];
    _bloodPressureData = json['blood_pressure_data'];
  }

  String? _source;
  num? _timezoneOffset;
  BodyData? _bodyData;
  dynamic _temperatureData;
  dynamic _bloodPressureData;

  String? get source => _source;
  num? get timezoneOffset => _timezoneOffset;
  BodyData? get bodyData => _bodyData;
  dynamic get temperatureData => _temperatureData;
  dynamic get bloodPressureData => _bloodPressureData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['source'] = _source;
    map['timezone_offset'] = _timezoneOffset;
    if (_bodyData != null) {
      map['body_data'] = _bodyData!.toJson();
    }
    map['temperature_data'] = _temperatureData;
    map['blood_pressure_data'] = _bloodPressureData;
    return map;
  }
}

class BodyData {
  BodyData({
    num? weightKg,
    num? heightCm,
    num? bmi,
    TimeSeries? timeSeries,
  }) {
    _weightKg = weightKg;
    _heightCm = heightCm;
    _bmi = bmi;
    _timeSeries = timeSeries;
  }

  BodyData.fromJson(dynamic json) {
    _weightKg = json['weight_kg'];
    _heightCm = json['height_cm'];
    _bmi = json['bmi'];
    _timeSeries = json['timeSeries'] != null ? TimeSeries.fromJson(json['timeSeries']) : null;
  }

  num? _weightKg;
  num? _heightCm;
  num? _bmi;
  TimeSeries? _timeSeries;

  num? get weightKg => _weightKg;
  num? get heightCm => _heightCm;
  num? get bmi => _bmi;
  TimeSeries? get timeSeries => _timeSeries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['weight_kg'] = _weightKg;
    map['height_cm'] = _heightCm;
    map['bmi'] = _bmi;
    if (_timeSeries != null) {
      map['timeSeries'] = _timeSeries!.toJson();
    }
    return map;
  }
}

class TimeSeries {
  TimeSeries({
    List<num>? weight,
    List<num>? bmi,
  }) {
    _weight = weight;
    _bmi = bmi;
  }

  TimeSeries.fromJson(dynamic json) {
    if (json['weight'] != null) {
      _weight = List<num>.from(json['weight']);
    }
    if (json['bmi'] != null) {
      _bmi = List<num>.from(json['bmi']);
    }
  }

  List<num>? _weight;
  List<num>? _bmi;

  List<num>? get weight => _weight;
  List<num>? get bmi => _bmi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_weight != null) {
      map['weight'] = _weight;
    }
    if (_bmi != null) {
      map['bmi'] = _bmi;
    }
    return map;
  }
}
