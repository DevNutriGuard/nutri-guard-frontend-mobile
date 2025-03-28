import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';

import '../models/common_model.dart';

class NetworkProvider extends ChangeNotifier {
  String case400Error = "";
  bool isSubscriber = false;
  BuildContext? context;
  File? image;
  String? imageUrl;

  static CommonResponse commonResponse = CommonResponse();

  init({BuildContext? context}) {
    case400Error = "";
    image = null;
    imageUrl = null;
    this.context = context;
  }

  set subscriber(bool isSubscibed) {
    isSubscriber = isSubscibed;
    notifyListeners();
  }

  makeEmpty() {
    case400Error = "";
    notifyListeners();
  }

  assignError(String? error) {
    case400Error = error ?? "";
    notifyListeners();
  }

  bool filterSpecialCharacters(String input) {
    log("coming input value : $input");
    bool alphabetOnly = RegExp(r'^(?=.*[a-zA-Z])[a-zA-Z "]+$').hasMatch(input);
    log("the given value is valid/invalid--------->$alphabetOnly");
    return alphabetOnly;
  }

  bool filterOnlyLetters(String input) {
    log("coming input value : $input");
    bool alphabetOnly = RegExp(
            // r'^[A-Za-z]+$'
            r'^(?=.*[a-zA-Z])[a-zA-Z "]+$'
            // r'^[a-zA-Z, "]+$'

            )
        .hasMatch(input);
    log("the given value is valid/invalid--------->$alphabetOnly");
    return alphabetOnly;
  }

}

extension FileExtention on FileSystemEntity {
  String get name {
    return path.split(Platform.pathSeparator).last;
  }

  String get fileType {
    return name.split('.').last;
  }
}
