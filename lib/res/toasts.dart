import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nutri_guard_mobile/res/res.dart';


class Toasts {
  late FToast fToast;
  late BuildContext context;


  static getErrorToast({@required String? text}) async {
    await Fluttertoast.showToast(

        msg: text ?? "",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: sizes!.fontRatio * 16.0);
  }
  iconToast()  async  {
    fToast.showToast(child:
    SvgPicture.asset(
      "assets/svg/video_pause_icon.svg",
      height: sizes!.heightRatio * 41.46,
      width: sizes!.widthRatio * 41.46,
    )
    );
  }

  static getSuccessToast({@required String? text}) async {
    await Fluttertoast.showToast(
        msg: text ?? "",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: sizes!.fontRatio * 16.0);
  }

  static getWarningToast({@required String? text}) async {
    await Fluttertoast.showToast(
        msg: text ?? "",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.yellow,
        textColor: Colors.white,
        fontSize: sizes!.fontRatio * 16.0);
  }
}