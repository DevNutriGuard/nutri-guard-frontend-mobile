class MedicineScanResponse {
  MedicineScanResponse({
    String? status,
    num? statusCode,
    Data? data,
  }) {
    _status = status;
    _statusCode = statusCode;
    _data = data;
  }

  MedicineScanResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _status;
  num? _statusCode;
  Data? _data;

  MedicineScanResponse copyWith({
    String? status,
    num? statusCode,
    Data? data,
  }) =>
      MedicineScanResponse(
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
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    MedicineDetails? medicineDetails,
    String? message,
  }) {
    _medicineDetails = medicineDetails;
    _message = message;
  }

  Data.fromJson(dynamic json) {
    _medicineDetails = json['medicineDetails'] != null
        ? MedicineDetails.fromJson(json['medicineDetails'])
        : null;
    _message = json['message'];
  }

  MedicineDetails? _medicineDetails;
  String? _message;

  Data copyWith({
    MedicineDetails? medicineDetails,
    String? message,
  }) =>
      Data(
        medicineDetails: medicineDetails ?? _medicineDetails,
        message: message ?? _message,
      );

  MedicineDetails? get medicineDetails => _medicineDetails;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_medicineDetails != null) {
      map['medicineDetails'] = _medicineDetails?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

class MedicineDetails {
  MedicineDetails({
    String? medicineName,
    String? brandName,
    String? genericName,
    String? description,
    List<dynamic>? harmfulIngredients,
    List<dynamic>? allergens,
    List<SideEffects>? sideEffects,
    List<dynamic>? interactions,
    List<String>? dosageWarnings,
    dynamic medicinePicture,
  }) {
    _medicineName = medicineName;
    _brandName = brandName;
    _genericName = genericName;
    _description = description;
    _harmfulIngredients = harmfulIngredients;
    _allergens = allergens;
    _sideEffects = sideEffects;
    _interactions = interactions;
    _dosageWarnings = dosageWarnings;
    _medicinePicture = medicinePicture;
  }

  MedicineDetails.fromJson(dynamic json) {
    _medicineName = json['medicineName'];
    _brandName = json['brandName'];
    _genericName = json['genericName'];
    _description = json['description'];

    // harmfulIngredients
    if (json['harmfulIngredients'] != null) {
      _harmfulIngredients = List<dynamic>.from(json['harmfulIngredients']);
    }

    // allergens
    if (json['allergens'] != null) {
      _allergens = List<dynamic>.from(json['allergens']);
    }

    // sideEffects
    if (json['sideEffects'] != null) {
      _sideEffects = [];
      json['sideEffects'].forEach((v) {
        _sideEffects?.add(SideEffects.fromJson(v));
      });
    }

    // interactions
    if (json['interactions'] != null) {
      _interactions = List<dynamic>.from(json['interactions']);
    }

    // dosageWarnings
    _dosageWarnings = json['dosageWarnings'] != null
        ? List<String>.from(json['dosageWarnings'])
        : [];

    _medicinePicture = json['medicinePicture'];
  }

  String? _medicineName;
  String? _brandName;
  String? _genericName;
  String? _description;
  List<dynamic>? _harmfulIngredients;
  List<dynamic>? _allergens;
  List<SideEffects>? _sideEffects;
  List<dynamic>? _interactions;
  List<String>? _dosageWarnings;
  dynamic _medicinePicture;

  MedicineDetails copyWith({
    String? medicineName,
    String? brandName,
    String? genericName,
    String? description,
    List<dynamic>? harmfulIngredients,
    List<dynamic>? allergens,
    List<SideEffects>? sideEffects,
    List<dynamic>? interactions,
    List<String>? dosageWarnings,
    dynamic medicinePicture,
  }) =>
      MedicineDetails(
        medicineName: medicineName ?? _medicineName,
        brandName: brandName ?? _brandName,
        genericName: genericName ?? _genericName,
        description: description ?? _description,
        harmfulIngredients: harmfulIngredients ?? _harmfulIngredients,
        allergens: allergens ?? _allergens,
        sideEffects: sideEffects ?? _sideEffects,
        interactions: interactions ?? _interactions,
        dosageWarnings: dosageWarnings ?? _dosageWarnings,
        medicinePicture: medicinePicture ?? _medicinePicture,
      );

  String? get medicineName => _medicineName;
  String? get brandName => _brandName;
  String? get genericName => _genericName;
  String? get description => _description;
  List<dynamic>? get harmfulIngredients => _harmfulIngredients;
  List<dynamic>? get allergens => _allergens;
  List<SideEffects>? get sideEffects => _sideEffects;
  List<dynamic>? get interactions => _interactions;
  List<String>? get dosageWarnings => _dosageWarnings;
  dynamic get medicinePicture => _medicinePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['medicineName'] = _medicineName;
    map['brandName'] = _brandName;
    map['genericName'] = _genericName;
    map['description'] = _description;

    // If we don't know the structure of these arrays, just assign them directly
    map['harmfulIngredients'] = _harmfulIngredients;
    map['allergens'] = _allergens;
    if (_sideEffects != null) {
      map['sideEffects'] = _sideEffects?.map((v) => v.toJson()).toList();
    }
    map['interactions'] = _interactions;
    map['dosageWarnings'] = _dosageWarnings;
    map['medicinePicture'] = _medicinePicture;
    return map;
  }
}

class SideEffects {
  SideEffects({
    String? title,
    String? description,
  }) {
    _title = title;
    _description = description;
  }

  SideEffects.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
  }

  String? _title;
  String? _description;

  SideEffects copyWith({
    String? title,
    String? description,
  }) =>
      SideEffects(
        title: title ?? _title,
        description: description ?? _description,
      );

  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }
}
