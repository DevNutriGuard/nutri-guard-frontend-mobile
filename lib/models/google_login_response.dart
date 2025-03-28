import 'dart:convert';
/// status : "success"
/// statusCode : 201
/// data : {"user":{"email":"abdullahshahbaz9940@gmail.com","name":"Abdullah Shahbaz","userUuid":"d1839c66-4a87-4fbc-a849-7ce26287e706"},"message":"User Successfully Logged In!.","accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6ImQxODM5YzY2LTRhODctNGZiYy1hODQ5LTdjZTI2Mjg3ZTcwNiIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNzM5MzI4Mzg3LCJleHAiOjE3NTY2MDgzODd9.FB3U5SI_XmWRYOXTMA3K4g8eTjuyCIfuRF6Yrd-LpI0","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6ImQxODM5YzY2LTRhODctNGZiYy1hODQ5LTdjZTI2Mjg3ZTcwNiIsImlhdCI6MTczOTMyODM4NywiZXhwIjoxNzM5OTMzMTg3fQ.Bko3e5YzhM_SmzE89OgkKOcHvK49YDZDKSZ5qYSYbIc","profiles":[{"profileName":"Abdullah Shahbaz","profileUuid":"035c6604-55ea-4881-844c-6f4243af2b5d","profilePicture":null}],"canHaveMultipleProfiles":false,"hasCompletedSetup":false}

GoogleLoginResponse googleLoginResponseFromJson(String str) => GoogleLoginResponse.fromJson(json.decode(str));
String googleLoginResponseToJson(GoogleLoginResponse data) => json.encode(data.toJson());
class GoogleLoginResponse {
  GoogleLoginResponse({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  GoogleLoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
GoogleLoginResponse copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => GoogleLoginResponse(  status: status ?? _status,
  statusCode: statusCode ?? _statusCode,
  data: data ?? _data,
);
  String? get status => _status;
  int? get statusCode => _statusCode;
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

/// user : {"email":"abdullahshahbaz9940@gmail.com","name":"Abdullah Shahbaz","userUuid":"d1839c66-4a87-4fbc-a849-7ce26287e706"}
/// message : "User Successfully Logged In!."
/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6ImQxODM5YzY2LTRhODctNGZiYy1hODQ5LTdjZTI2Mjg3ZTcwNiIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNzM5MzI4Mzg3LCJleHAiOjE3NTY2MDgzODd9.FB3U5SI_XmWRYOXTMA3K4g8eTjuyCIfuRF6Yrd-LpI0"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6ImQxODM5YzY2LTRhODctNGZiYy1hODQ5LTdjZTI2Mjg3ZTcwNiIsImlhdCI6MTczOTMyODM4NywiZXhwIjoxNzM5OTMzMTg3fQ.Bko3e5YzhM_SmzE89OgkKOcHvK49YDZDKSZ5qYSYbIc"
/// profiles : [{"profileName":"Abdullah Shahbaz","profileUuid":"035c6604-55ea-4881-844c-6f4243af2b5d","profilePicture":null}]
/// canHaveMultipleProfiles : false
/// hasCompletedSetup : false

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      User? user, 
      String? message, 
      String? accessToken, 
      String? refreshToken, 
      List<Profiles>? profiles, 
      bool? canHaveMultipleProfiles, 
      bool? hasCompletedSetup,}){
    _user = user;
    _message = message;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _profiles = profiles;
    _canHaveMultipleProfiles = canHaveMultipleProfiles;
    _hasCompletedSetup = hasCompletedSetup;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _message = json['message'];
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
    if (json['profiles'] != null) {
      _profiles = [];
      json['profiles'].forEach((v) {
        _profiles?.add(Profiles.fromJson(v));
      });
    }
    _canHaveMultipleProfiles = json['canHaveMultipleProfiles'];
    _hasCompletedSetup = json['hasCompletedSetup'];
  }
  User? _user;
  String? _message;
  String? _accessToken;
  String? _refreshToken;
  List<Profiles>? _profiles;
  bool? _canHaveMultipleProfiles;
  bool? _hasCompletedSetup;
Data copyWith({  User? user,
  String? message,
  String? accessToken,
  String? refreshToken,
  List<Profiles>? profiles,
  bool? canHaveMultipleProfiles,
  bool? hasCompletedSetup,
}) => Data(  user: user ?? _user,
  message: message ?? _message,
  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
  profiles: profiles ?? _profiles,
  canHaveMultipleProfiles: canHaveMultipleProfiles ?? _canHaveMultipleProfiles,
  hasCompletedSetup: hasCompletedSetup ?? _hasCompletedSetup,
);
  User? get user => _user;
  String? get message => _message;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  List<Profiles>? get profiles => _profiles;
  bool? get canHaveMultipleProfiles => _canHaveMultipleProfiles;
  bool? get hasCompletedSetup => _hasCompletedSetup;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['message'] = _message;
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    if (_profiles != null) {
      map['profiles'] = _profiles?.map((v) => v.toJson()).toList();
    }
    map['canHaveMultipleProfiles'] = _canHaveMultipleProfiles;
    map['hasCompletedSetup'] = _hasCompletedSetup;
    return map;
  }

}

/// profileName : "Abdullah Shahbaz"
/// profileUuid : "035c6604-55ea-4881-844c-6f4243af2b5d"
/// profilePicture : null

Profiles profilesFromJson(String str) => Profiles.fromJson(json.decode(str));
String profilesToJson(Profiles data) => json.encode(data.toJson());
class Profiles {
  Profiles({
      String? profileName, 
      String? profileUuid, 
      dynamic profilePicture,}){
    _profileName = profileName;
    _profileUuid = profileUuid;
    _profilePicture = profilePicture;
}

  Profiles.fromJson(dynamic json) {
    _profileName = json['profileName'];
    _profileUuid = json['profileUuid'];
    _profilePicture = json['profilePicture'];
  }
  String? _profileName;
  String? _profileUuid;
  dynamic _profilePicture;
Profiles copyWith({  String? profileName,
  String? profileUuid,
  dynamic profilePicture,
}) => Profiles(  profileName: profileName ?? _profileName,
  profileUuid: profileUuid ?? _profileUuid,
  profilePicture: profilePicture ?? _profilePicture,
);
  String? get profileName => _profileName;
  String? get profileUuid => _profileUuid;
  dynamic get profilePicture => _profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profileName'] = _profileName;
    map['profileUuid'] = _profileUuid;
    map['profilePicture'] = _profilePicture;
    return map;
  }

}

/// email : "abdullahshahbaz9940@gmail.com"
/// name : "Abdullah Shahbaz"
/// userUuid : "d1839c66-4a87-4fbc-a849-7ce26287e706"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? email, 
      String? name, 
      String? userUuid,}){
    _email = email;
    _name = name;
    _userUuid = userUuid;
}

  User.fromJson(dynamic json) {
    _email = json['email'];
    _name = json['name'];
    _userUuid = json['userUuid'];
  }
  String? _email;
  String? _name;
  String? _userUuid;
User copyWith({  String? email,
  String? name,
  String? userUuid,
}) => User(  email: email ?? _email,
  name: name ?? _name,
  userUuid: userUuid ?? _userUuid,
);
  String? get email => _email;
  String? get name => _name;
  String? get userUuid => _userUuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['name'] = _name;
    map['userUuid'] = _userUuid;
    return map;
  }

}