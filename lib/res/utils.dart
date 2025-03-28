import 'dart:async' show Future;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_response.dart';
import '../res/strings.dart';

class PreferenceUtils {
  static String? userImage;
  var time = DateTime;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String? getString(String key, [String? defValue]) {
    if (PreferenceUtils._prefsInstance != null) {
      return _prefsInstance?.getString(key) ?? defValue ?? "";
    } else {
      return null;
    }
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;

    return prefs.setString(key, value); //?? Future.value(null);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value); //?? Future.value(null);
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue ?? false;
  }

  static bool get isSubscriber {
    return _prefsInstance?.getString(Strings.subscriptionStatus) == "Paid";
  }

  static bool get isOnFreeTrial {
    return _prefsInstance?.getBool(Strings.isTrialUsed) != true;
  }

  static bool get isCustomerCreated {
    return _prefsInstance?.getString(Strings.stripeCustomerId) != "nil"
        ? true
        : false;
  }

  static Future<void> reload() async {
    var prefs = await _instance;
    return prefs.reload();
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;

    return prefs.setInt(key, value); //?? Future.value(null);
  }

  static int getInt(String key, [int? defValue]) {
    return _prefsInstance?.getInt(key) ?? defValue ?? 0;
  }
  static Future<String?> getProfileId() async {
    return await getString(Strings.profileId);
  }

  static Future setLoginResponse(LoginResponse loginResponse) async {
    PreferenceUtils.setString(Strings.accessToken, "Bearer ${loginResponse.data?.accessToken}");
    PreferenceUtils.setString(Strings.refreshToken, "Bearer ${loginResponse.data?.refreshToken}");
    PreferenceUtils.setString(Strings.userId, loginResponse.data?.user?.userUuid ?? '');
    PreferenceUtils.setBool(Strings.hasCompletedSetup, loginResponse.data?.hasCompletedSetup ?? false);
    PreferenceUtils.setString(Strings.profileId, loginResponse.data?.profiles?[0].profileUuid ?? '');
    PreferenceUtils.setString(Strings.profileName, loginResponse.data?.profiles?[0].profileName ?? '');
    PreferenceUtils.setString(Strings.profilePicture, loginResponse.data?.profiles?[0].profilePicture ?? '');
    PreferenceUtils.setString(Strings.email, loginResponse.data?.user?.email ?? "");
    PreferenceUtils.setString(Strings.userName, loginResponse.data?.user?.name ?? "");
    PreferenceUtils.setBool(Strings.loggedIn, true);
  }

  // static Future setSocialLoginResponse(
  //     SocialLoginResponse socialLoginResponse) async {
  //   await PreferenceUtils.setString(
  //       Strings.profilePicture, socialLoginResponse.data?.avatar ?? "");
  //   await PreferenceUtils.setString(
  //       Strings.weightUnit, socialLoginResponse.data?.weightUnit ?? "");
  //   await PreferenceUtils.setString(Strings.gender, socialLoginResponse.data?.gender??'');
  //   await PreferenceUtils.setString(
  //       Strings.distnaceUnit, socialLoginResponse.data?.distanceUnit ?? "");
  //   await PreferenceUtils.setString(
  //       Strings.distnaceUnit, socialLoginResponse.data?.distanceUnit ?? "");
  //   await PreferenceUtils.setString(
  //       Strings.distnaceUnit, socialLoginResponse.data?.distanceUnit ?? "");
  //   await PreferenceUtils.setString(
  //       Strings.distnaceUnit, socialLoginResponse.data?.distanceUnit ?? "");
  //
  //   await PreferenceUtils.setString(Strings.subscriptionStatus,
  //       socialLoginResponse.data?.subscriptionStatus ?? "nil");
  //   await PreferenceUtils.setString(
  //       Strings.accessToken, "Bearer ${socialLoginResponse.data?.accessToken}");
  //   await PreferenceUtils.setInt(
  //       Strings.userId, socialLoginResponse.data!.id ?? 0);
  //   await PreferenceUtils.setString(
  //       Strings.email, socialLoginResponse.data?.email ?? "");
  //   await PreferenceUtils.setString(
  //       Strings.name, socialLoginResponse.data?.name ?? "White");
  //   await PreferenceUtils.setString(
  //       Strings.refreshToken, socialLoginResponse.data?.refreshToken ?? "");
  //   await PreferenceUtils.setBool(
  //       Strings.isTrialUsed, socialLoginResponse.data?.isTrialUsed ?? false);
  //   await PreferenceUtils.setBool(
  //       Strings.isTrialing, socialLoginResponse.data?.isTrialing ?? false);
  //
  //   // PreferenceUtils.setString(
  //   //     Strings.profilePicture, socialLoginResponse.data?.user?.profilePic ?? "");
  // }

  // static Future setSignupResponse(SignupResponse signupResponse) async {
  //   PreferenceUtils.setString(
  //       Strings.accessToken, signupResponse.data?.accessToken ?? "");
  //   PreferenceUtils.setString(
  //       Strings.refreshToken, signupResponse.data?.refreshToken ?? "");
  //   PreferenceUtils.setInt(Strings.userId, signupResponse.data?.user?.id ?? 0);
  //   PreferenceUtils.setString(
  //       Strings.email, signupResponse.data?.user?.email ?? "");
  //   PreferenceUtils.setString(Strings.customerStripeId,
  //       signupResponse.data?.user?.customerStripeId ?? "");
  //   PreferenceUtils.setInt(
  //       Strings.userTypeId, signupResponse.data?.user?.userTypeId ?? 0);
  //   PreferenceUtils.setBool(
  //       Strings.isActive, signupResponse.data?.user?.isActive ?? false);
  //   PreferenceUtils.setString(
  //       Strings.profilePicture, signupResponse.data?.user?.profilePic ?? "");
  // }

  static clearSingleKey({required String key}){
    _prefsInstance?.remove(key);
  }

  static clearPreferences() {
    _prefsInstance?.clear();
  }

  static clearPreferencesExcept(List<String> exceptKeys) async {
    List<String> allKeys = _prefsInstance!.getKeys().toList();

    for (String key in allKeys) {
      if (!exceptKeys.contains(key)) {
        debugPrint("exceptKeys-->${exceptKeys}");
        await _prefsInstance?.remove(key);
      }
    }
  }

}
