import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignUpProvider extends ChangeNotifier {
  final bool _isLoading = false;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  bool get isLoading => _isLoading;
  Future<void> handleFacebookLogin() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      debugPrint("user data is : $userData");
      debugPrint("token is : ${loginResult.accessToken}");
      if (loginResult.accessToken != null) {
        // facebookSocialLoginApi(
        //     provider: "facebook", tokenId: loginResult.accessToken?.tokenString??"");
      }
    } catch (err) {
      debugPrint("Error while sign in by facebook : $err");
    }
  }

// Future<void> facebookSocialLoginApi({
//   required String tokenId,
// }) async {
//   try {
//     // _loader.showLoader(context: context);
//     var fcmToken = await _firebaseMessaging.getToken();
//   await PreferenceUtils.setString("${Strings.fcmToken}${DateTime.now().millisecond}",fcmToken??"");
//     debugPrint("fcmToken : $fcmToken");
//     Map<String, dynamic> body = {
//       "token": tokenId,
//       "deviceToken": fcmToken
//     };
//     debugPrint("Social Login Body : $body");
//     var socialLoginResponse = await MyApi.callPostApi(
//       url: facebookSignUpUrl,
//       body: body,
//       modelName: Models.socialLoginModel,
//     );e
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
//       // socialLoginResponse.status == 200 &&
//       //     PreferenceUtils.isSubscriber == false
//       //     ? Navigator.pushAndRemoveUntil(
//       //   context!,
//       //   MaterialPageRoute(
//       //       builder: (context) => const SubscriptionOffering()),
//       //       (route) => false, // Remove all routes in the stack
//       // )
//       //     : Navigator.pushAndRemoveUntil(
//       //   context!,
//       //   MaterialPageRoute(
//       //     builder: (context) =>  BottomTabScreen(fromLogin: true,),),
//       //       (route) => false, // Remove all routes in the stack
//       // );
//     }
//   } catch (e) {
//     _loader.hideLoader(context!);
//     _facebookSignIn.disconnect();
//     debugPrint("Catch-Error: ${e.toString()}");
//   }
// }


}
