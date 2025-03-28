import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../models/login_response.dart';
import '../../../network/api_service.dart';
import '../../../network/api_url.dart';
import '../../../network/models.dart';
import '../../../res/loader.dart';
import '../../../res/strings.dart';
import '../../../res/toasts.dart';
import '../../../res/utilities.dart';
import '../../../res/utils.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final Loader _loader = Loader();
  bool hidePassword = true;
  bool sendToken = false;
  ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);
  LoginResponse loginResponse = LoginResponse();
  bool isDataFetched = false;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  BuildContext? context;

  setHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
  callRememberMe(bool remember) {
    rememberMe.value = remember;
    notifyListeners();
  }


  init({required BuildContext context}) async {
    this.context = context;
    sendToken = false;
  }
  void loadUserDetails() async {
    rememberMe.value = false;
    bool rememberme = PreferenceUtils.getBool(Strings.rememberMe);
    if (rememberme) {
      String? username = PreferenceUtils.getString(Strings.rememberedEmail);
      String? password = PreferenceUtils.getString(Strings.rememberedPassword);
      debugPrint("password-->$password");
      debugPrint("loginProvider.passwordController.text-->${passwordController.text}");
      emailController.text = username ?? '';
      passwordController.text = password ?? '';
      rememberMe.value = rememberme;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  reset() {
    emailController.clear();
    passwordController.clear();
  }

  // Future<void> socialLoginApi({
  //   required String provider,
  //   required String tokenId,
  // }) async {
  //   try {
  //     _loader.showLoader(context: context);
  //     var fcmToken = await _firebaseMessaging.getToken();
  //     await PreferenceUtils.setString(Strings.fcmToken,fcmToken??"");
  //     debugPrint("fcmToken : $fcmToken");
  //     Map<String, dynamic> body = {
  //       "provider": provider,
  //       "token": tokenId,
  //       "fcm_token": fcmToken
  //     };
  //     debugPrint("Social Login Body : $body");
  //     socialLoginResponse = await MyApi.callPostApi(
  //       url: socialLoginApiUrl,
  //       body: body,
  //       modelName: Models.socialLoginModel,
  //     );
  //     if (socialLoginResponse.message != null) {
  //       isDataFetched = true;
  //       await PreferenceUtils.setSocialLoginResponse(socialLoginResponse);
  //       await PreferenceUtils.setBool(Strings.loggedIn, true);
  //       await PreferenceUtils.setString(Strings.socialProvider, provider);
  //       if (socialLoginResponse.data?.accessToken != null ||
  //           socialLoginResponse.data?.refreshToken != null) {
  //         PreferenceUtils.setBool(Strings.isSocialUser, true);
  //       } else {
  //         PreferenceUtils.setBool(Strings.isSocialUser, false);
  //       }
  //       fcmToken = '';
  //       Toasts.getSuccessToast(text: socialLoginResponse.message.toString());
  //       socialLoginResponse.status == 200 &&
  //           PreferenceUtils.isSubscriber == false
  //           ? Navigator.pushAndRemoveUntil(
  //         context!,
  //         MaterialPageRoute(
  //             builder: (context) => const SubscriptionOffering()),
  //             (route) => false, // Remove all routes in the stack
  //       )
  //           : Navigator.pushAndRemoveUntil(
  //         context!,
  //         MaterialPageRoute(
  //           builder: (context) =>  BottomTabScreen(fromLogin: true,),),
  //             (route) => false, // Remove all routes in the stack
  //       );
  //     }
  //   } catch (e) {
  //     _loader.hideLoader(context!);
  //     googleSignIn.disconnect();
  //     debugPrint("Catch-Error: ${e.toString()}");
  //   }
  // }

  // Future<void> handleAppleSignIn() async {
  //   try {
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //     if (credential.identityToken != null) {
  //       socialLoginApi(provider: "apple", tokenId: credential.identityToken!);
  //     }
  //   } catch (error) {
  //     debugPrint("handleAppleSignIn error -->$error");
  //   }
  // }

  // Future<void> handleGoogleSignIn() async {
  //   debugPrint("handleGoogleSignIn");
  //   try {
  //     final result = await googleSignIn.signIn();
  //     final auth = await result?.authentication;
  //     debugPrint("auth id token is : ${auth?.idToken}");
  //     debugPrint("auth access token is : ${auth?.accessToken}");
  //     if (auth!=null && auth.accessToken?.isNotEmpty==true) {
  //       await socialLoginApi(provider: "google", tokenId: auth.accessToken??'');
  //     }
  //   } catch (error) {
  //     debugPrint("error while google sign in $error");
  //   }
  // }

  // Future<void> handleGoogleSignOut() => googleSignIn.disconnect();

  // Future<void> handleFacebookLogin() async {
  //   try {
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //     final userData = await FacebookAuth.instance.getUserData();
  //     debugPrint("user data is : $userData");
  //     debugPrint("token is : ${loginResult.accessToken}");
  //     if (loginResult.accessToken != null) {
  //       socialLoginApi(
  //           provider: "facebook", tokenId: loginResult.accessToken?.tokenString??"");
  //     }
  //   } catch (err) {
  //     debugPrint("Error while sign in by facebook : $err");
  //   }
  // }

  Future<void> onLoginTap() async{
    if (emailController.text.trim().isEmpty) {
      Toasts.getErrorToast(text: "Enter your email address");
    } else if (!emailController.text.trim().validateEmail()) {
      Toasts.getErrorToast(text: "Enter valid email address");
    } else if (validatePassword(passwordController.text)) {
      await loginApi();
    } else {
      debugPrint("email: ${emailController.text}");
      debugPrint("password ${passwordController.text}");
    }
  }

  Future<void> loginApi() async {
    try {
      loginResponse=LoginResponse();
      _loader.showLoader(context: context);
      String? fcmToken = await _firebaseMessaging.getToken();
      await PreferenceUtils.setString("${Strings.fcmToken}${DateTime.now().millisecond}",fcmToken??"");
      debugPrint("fcmToken : $fcmToken");
      Map<String, dynamic> body = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "rememberMe": rememberMe.value,
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
        _loader.hideLoader(context!);
        if (loginResponse.statusCode == 201 && loginResponse.data == null) {
          Toasts.getErrorToast(text: loginResponse.status);
        }
        if (loginResponse.statusCode == 201 && loginResponse.data != null) {
          if (rememberMe.value) {
            await PreferenceUtils.setBool(Strings.rememberMe, true);
            await PreferenceUtils.setString(Strings.rememberedEmail, emailController.text.trim().toString() );
            await PreferenceUtils.setString(Strings.rememberedPassword, passwordController.text.trim().toString());
            PreferenceUtils.getString(Strings.rememberedPassword);
          }
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
          reset();
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
        _loader.hideLoader(context!);
      }
    } catch (err) {
      debugPrint("error during login is : $err");
      _loader.hideLoader(context!);
    }
  }

  Future<void> loginWithPhoneApi({
    required String phoneNumber
}) async {
    try {
      _loader.showLoader(context: context);
      loginResponse=LoginResponse();
      String? fcmToken = await _firebaseMessaging.getToken();
      await PreferenceUtils.setString("${Strings.fcmToken}${DateTime.now().millisecond}",fcmToken??"");
      debugPrint("fcmToken : $fcmToken");
      Map<String, dynamic> body = {
        "phoneNumber": phoneNumber,
        "rememberMe": true,
        "deviceToken" : fcmToken
      };
      debugPrint("body for login : $body");
      loginResponse = await MyApi.callPostApi(
          url: phoneLoginApiUrl,
          body: body,
          modelName: Models.loginModel,
          sendToken: false);
      debugPrint("loginResponse.statusCode : ${loginResponse.statusCode }");

      if (loginResponse.data != null) {
        _loader.hideLoader(context!);
        if (loginResponse.statusCode == 201 && loginResponse.data == null) {
          Toasts.getErrorToast(text: loginResponse.status);
        }
        if (loginResponse.statusCode == 201 && loginResponse.data != null) {
          if (rememberMe.value) {
            await PreferenceUtils.setBool(Strings.rememberMe, true);
            await PreferenceUtils.setString(Strings.rememberedEmail, emailController.text.trim().toString() );
            await PreferenceUtils.setString(Strings.rememberedPassword, passwordController.text.trim().toString());
            PreferenceUtils.getString(Strings.rememberedPassword);
          }
          // else {
          //   await PreferenceUtils.clearPreferences();
          // }
          Toasts.getSuccessToast(text: loginResponse.status);
          debugPrint("AccessToken======>${loginResponse.data?.accessToken}");
          debugPrint("loginResponse.data?.hasCompletedSetup======>${loginResponse.data?.hasCompletedSetup}");
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
          reset();
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
        _loader.hideLoader(context!);
      }
    } catch (err) {
      debugPrint("error during login is : $err");
      _loader.hideLoader(context!);
    }
  }
  void handleFacebookLogin(Map<String, dynamic> userData) {
    // Handle the Facebook login data here
    // For example, you might want to save the user data and log the user in
    final email = userData['email'];
    final name = userData['name'];
    final picture = userData['picture']['data']['url'];

    // Perform your login logic here
  }
}
