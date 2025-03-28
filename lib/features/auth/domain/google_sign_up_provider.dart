import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nutri_guard_mobile/models/google_login_response.dart';
import 'package:nutri_guard_mobile/network/api_url.dart';
import 'package:nutri_guard_mobile/res/loader.dart';

import '../../../core/routes/app_routes.dart';
import '../../../models/login_response.dart';
import '../../../network/api_service.dart';
import '../../../network/models.dart';
import '../../../res/strings.dart';
import '../../../res/toasts.dart';
import '../../../res/utils.dart';

class GoogleSignUpProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final bool _isLoading = false;
  LoginResponse loginResponse = LoginResponse();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  bool get isLoading => _isLoading;

  Future<void> handleGoogleSignIn(BuildContext context) async {
    debugPrint("handleGoogleSignIn");
    debugPrint("handleGoogleSignIn");
    try {
      final result = await _googleSignIn.signIn();
      final auth = await result?.authentication;
      debugPrint("google auth id token is : ${auth?.idToken}");
      debugPrint("google auth access token is : ${auth?.accessToken}");
      if (auth!=null && auth.accessToken?.isNotEmpty==true) {
        await googleLoginApi(tokenId: auth.accessToken??'', context: context);
      }
    } catch (error) {
      debugPrint("error while google sign in $error");
    }
  }
  Future<void> googleLoginApi({required BuildContext context, required String tokenId}) async {
    try {
      loginResponse=LoginResponse();
      Loader().showLoader(context: context);
      String? fcmToken = await _firebaseMessaging.getToken();
      await PreferenceUtils.setString("${Strings.fcmToken}${DateTime.now().millisecond}",fcmToken??"");
      debugPrint("fcmToken : $fcmToken");
      Map<String, dynamic> body = {
        "token": tokenId,
        "deviceToken": fcmToken
      };
      debugPrint("body for login : $body");
      loginResponse = await MyApi.callPostApi(
          url: loginApiUrl,
          body: body,
          modelName: Models.loginModel,
          sendToken: false);
      debugPrint("loginResponse.statusCode : ${loginResponse.statusCode }");

      if (loginResponse.data != null) {
        Loader().hideLoader(context!);
        if (loginResponse.statusCode == 201 && loginResponse.data == null) {
          Toasts.getErrorToast(text: loginResponse.status);
        }
        if (loginResponse.statusCode == 201 && loginResponse.data != null) {
          // if (rememberMe.value) {
          //   await PreferenceUtils.setBool(Strings.rememberMe, true);
          //   await PreferenceUtils.setString(Strings.rememberedEmail, emailController.text.trim().toString() );
          //   await PreferenceUtils.setString(Strings.rememberedPassword, passwordController.text.trim().toString());
          //
          //   PreferenceUtils.getString(Strings.rememberedPassword);
          // }
          // else {
          //   await PreferenceUtils.clearPreferences();
          // }
          Toasts.getSuccessToast(text: loginResponse.status);
          debugPrint("AccessToken======>${loginResponse.data?.accessToken}");
          // debugPrint("AccessToken refreshToken======>${loginResponse.data?.refreshToken}");
          await PreferenceUtils.setLoginResponse(loginResponse);
          // fcmToken = '';
          // debugPrint("Logged in ${PreferenceUtils.getBool(Strings.loggedIn)}");
          // debugPrint("loginResponse.data?.gender in ${loginResponse.data?.gender}");
          // if (loginResponse.data?.appleId != null ||
          //     loginResponse.data?.googleId != null ||
          //     loginResponse.data?.facebookId != null) {
          //   PreferenceUtils.setBool(Strings.isSocialUser, true);
          // } else {
          //   PreferenceUtils.setBool(Strings.isSocialUser, false);
          // }
          // reset();
          notifyListeners();
          if(loginResponse.data?.hasCompletedSetup??false)
          {
            Navigator.pushNamedAndRemoveUntil(
              context!,
              AppRoutes.homeScreen,
                  (route) => false, // Remove all routes in the stack
            );
          }
          else{
            Navigator.pushNamedAndRemoveUntil(
              context!,
              AppRoutes.privacyPolicyScreen,
                  (route) => false, // Remove all routes in the stack
            );
          }
          // Navigator.pushReplacementNamed(
          //   context!,
          //   AppRoutes.privacyPolicyScreen,
          // );
        }
      } else {
        Toasts.getErrorToast(text: loginResponse.status);
        Loader().hideLoader(context!);
      }
    } catch (err) {
      debugPrint("error during login is : $err");
      Loader().hideLoader(context!);
    }
  }


}
