import 'dart:convert';
/// status : "success"
/// statusCode : 201
/// data : {"user":{"email":"user1@example.com","name":"User One","userUuid":"06d34f0c-fe86-42a4-a305-620b8853ee53"},"profiles":[{"profileName":"User One","profileUuid":"e408a2c5-53d5-4513-97f7-44bf53868a41","profilePicture":"https://example.com/user1.jpg"}],"accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6IjA2ZDM0ZjBjLWZlODYtNDJhNC1hMzA1LTYyMGI4ODUzZWU1MyIsInJvbGVzIjpbIkFETUlOIl0sImlhdCI6MTczOTA2MTYwNywiZXhwIjoxNzU2MzQxNjA3fQ.4xYpQwXKUicyNDnzjCKKzRntdHlLXnENJ4XobJsgVsk","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6IjA2ZDM0ZjBjLWZlODYtNDJhNC1hMzA1LTYyMGI4ODUzZWU1MyIsImlhdCI6MTczOTA2MTYwNywiZXhwIjoxNzM5NjY2NDA3fQ.z_NZ57j0XVO_dyU4ei4NO__k_6DZ9ADBPyOCbFLjrI4","canHaveMultipleProfiles":false,"message":"User successfully logged in","hasCompletedSetup":true}

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
      String? status, 
      int? statusCode, 
      Data? data,}){
    _status = status;
    _statusCode = statusCode;
    _data = data;
}

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  int? _statusCode;
  Data? _data;
LoginResponse copyWith({  String? status,
  int? statusCode,
  Data? data,
}) => LoginResponse(  status: status ?? _status,
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

/// user : {"email":"user1@example.com","name":"User One","userUuid":"06d34f0c-fe86-42a4-a305-620b8853ee53"}
/// profiles : [{"profileName":"User One","profileUuid":"e408a2c5-53d5-4513-97f7-44bf53868a41","profilePicture":"https://example.com/user1.jpg"}]
/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6IjA2ZDM0ZjBjLWZlODYtNDJhNC1hMzA1LTYyMGI4ODUzZWU1MyIsInJvbGVzIjpbIkFETUlOIl0sImlhdCI6MTczOTA2MTYwNywiZXhwIjoxNzU2MzQxNjA3fQ.4xYpQwXKUicyNDnzjCKKzRntdHlLXnENJ4XobJsgVsk"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVXVpZCI6IjA2ZDM0ZjBjLWZlODYtNDJhNC1hMzA1LTYyMGI4ODUzZWU1MyIsImlhdCI6MTczOTA2MTYwNywiZXhwIjoxNzM5NjY2NDA3fQ.z_NZ57j0XVO_dyU4ei4NO__k_6DZ9ADBPyOCbFLjrI4"
/// canHaveMultipleProfiles : false
/// message : "User successfully logged in"
/// hasCompletedSetup : true

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      User? user, 
      List<Profiles>? profiles, 
      String? accessToken, 
      String? refreshToken, 
      bool? canHaveMultipleProfiles, 
      String? message, 
      bool? hasCompletedSetup,}){
    _user = user;
    _profiles = profiles;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _canHaveMultipleProfiles = canHaveMultipleProfiles;
    _message = message;
    _hasCompletedSetup = hasCompletedSetup;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['profiles'] != null) {
      _profiles = [];
      json['profiles'].forEach((v) {
        _profiles?.add(Profiles.fromJson(v));
      });
    }
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
    _canHaveMultipleProfiles = json['canHaveMultipleProfiles'];
    _message = json['message'];
    _hasCompletedSetup = json['hasCompletedSetup'];
  }
  User? _user;
  List<Profiles>? _profiles;
  String? _accessToken;
  String? _refreshToken;
  bool? _canHaveMultipleProfiles;
  String? _message;
  bool? _hasCompletedSetup;
Data copyWith({  User? user,
  List<Profiles>? profiles,
  String? accessToken,
  String? refreshToken,
  bool? canHaveMultipleProfiles,
  String? message,
  bool? hasCompletedSetup,
}) => Data(  user: user ?? _user,
  profiles: profiles ?? _profiles,
  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
  canHaveMultipleProfiles: canHaveMultipleProfiles ?? _canHaveMultipleProfiles,
  message: message ?? _message,
  hasCompletedSetup: hasCompletedSetup ?? _hasCompletedSetup,
);
  User? get user => _user;
  List<Profiles>? get profiles => _profiles;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  bool? get canHaveMultipleProfiles => _canHaveMultipleProfiles;
  String? get message => _message;
  bool? get hasCompletedSetup => _hasCompletedSetup;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_profiles != null) {
      map['profiles'] = _profiles?.map((v) => v.toJson()).toList();
    }
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    map['canHaveMultipleProfiles'] = _canHaveMultipleProfiles;
    map['message'] = _message;
    map['hasCompletedSetup'] = _hasCompletedSetup;
    return map;
  }

}

/// profileName : "User One"
/// profileUuid : "e408a2c5-53d5-4513-97f7-44bf53868a41"
/// profilePicture : "https://example.com/user1.jpg"

Profiles profilesFromJson(String str) => Profiles.fromJson(json.decode(str));
String profilesToJson(Profiles data) => json.encode(data.toJson());
class Profiles {
  Profiles({
      String? profileName, 
      String? profileUuid, 
      String? profilePicture,}){
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
  String? _profilePicture;
Profiles copyWith({  String? profileName,
  String? profileUuid,
  String? profilePicture,
}) => Profiles(  profileName: profileName ?? _profileName,
  profileUuid: profileUuid ?? _profileUuid,
  profilePicture: profilePicture ?? _profilePicture,
);
  String? get profileName => _profileName;
  String? get profileUuid => _profileUuid;
  String? get profilePicture => _profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profileName'] = _profileName;
    map['profileUuid'] = _profileUuid;
    map['profilePicture'] = _profilePicture;
    return map;
  }

}

/// email : "user1@example.com"
/// name : "User One"
/// userUuid : "06d34f0c-fe86-42a4-a305-620b8853ee53"

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