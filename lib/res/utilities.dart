import 'package:flutter/material.dart';
import '../res/toasts.dart';

bool isInt(dynamic val) {
  if (val != null) {
    if (val.toString().contains('.')) {
      // debugPrint("Not Int ${val.toDouble()}");
      return false;
    } else {
      // debugPrint("Int Number  $val");
      return true;
    }
  } else {
    debugPrint("=====>>>>>>Null");
    return false;
  }
}

Color getColorsForSuperSet({required int id1,required int id2}){
  String lengthFind='';
  if(id1==-1|| id2==-1){
    return Colors.transparent;
  }
  if(id1> id2){
    lengthFind= '$id1$id2';
  }else{
    lengthFind= '$id2$id1';
  }
  // debugPrint(lengthFind);
  int newNum= int.parse(lengthFind);
  // debugPrint(newNum.toString());
  if(newNum%3==0){
    return Colors.blue ;
  }else if(newNum%5==0){
    return Colors.yellow;
  }else if(newNum%7==0){
    return Colors.orange;
  }else{
    return Colors.grey;
  }
}


extension StringExtensions on String {
  bool validateEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool validatePassword() {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9!@#$%^&*]).{8,}$').hasMatch(this);
  }

  bool validatePhoneNumber() {
    return
        //RegExp(r"/^((\+|00)32\s?|0)4(60|[789]\d)(\s?\d{2}){3}$/").hasMatch(this);
        RegExp(r"^(\+\d{12})?$").hasMatch(this);
  }
}

bool validatePassword(String? value) {
  if (value != null && value.isNotEmpty) {
    if (!value.validatePassword()) {
      if (value.length < 8) {
        // Toasts.getErrorToast(text: "Password must contain 8 characters");
        Toasts.getErrorToast(text: "Invalid Password");
        return false;
      }
      Toasts.getErrorToast(
          text:
              "Email is not registered");
      // Toasts.getErrorToast(
      //     text:
      //         "Password must contain Numbers,Capital letters and special characters");
      return false;
    }
    return true;
  } else {
    Toasts.getErrorToast(text: "Enter a valid Password");
    return false;
  }
}

bool validEmail(String value) {
  if (value.isEmpty) {
    Toasts.getErrorToast(text: "Please enter your email");
    return false;
  }
  if (value.toString().validateEmail() == false) {
    Toasts.getErrorToast(text: "Enter a valid Email");
    return false;
  } else {
    return true;
  }
}

bool validName(String? value) {
  if (value != null && value.length < 5) {
    Toasts.getErrorToast(text: "Name Must have 5 characters");
    return false;
  } else {
    return true;
  }
}


// notificationNavigation() async{
//   await Future.delayed(Duration(milliseconds: 300)).then((val){
//     navigatorKey.currentState?.pushReplacement(
//       MaterialPageRoute(
//           builder: (_) => const BottomTabScreen()),
//     );
//   });
// }

