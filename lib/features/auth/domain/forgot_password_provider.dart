import 'package:flutter/cupertino.dart';
import 'package:nutri_guard_mobile/models/forgot_password_response.dart';
import '../../../core/routes/app_routes.dart';
import '../../../network/api_service.dart';
import '../../../network/api_url.dart';
import '../../../network/models.dart';
import '../../../res/loader.dart';
import '../../../res/toasts.dart';
import '../../../res/utilities.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  ForgotPasswordResponse forgotPasswordResponse = ForgotPasswordResponse();
  final TextEditingController emailController = TextEditingController();
  final Loader _loader = Loader();
  bool hidePassword = true;
  BuildContext? context;


  init({required BuildContext context}) async {
    this.context = context;
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  reset() {
    emailController.clear();
  }

  Future<void> onSendInstructionsTap() async{
    if (emailController.text.trim().isEmpty) {
      Toasts.getErrorToast(text: "Enter your email address");
    } else if (!emailController.text.trim().validateEmail()) {
      Toasts.getErrorToast(text: "Enter valid email address");
    } else if (validatePassword(emailController.text)) {
      await forgotPasswordEmailApi();
    } else {
      debugPrint("email: ${emailController.text}");
    }
  }

  Future<void> forgotPasswordEmailApi() async {
    try {
      _loader.showLoader(context: context);
      // String? fcmToken = await _firebaseMessaging.getToken();
      // await PreferenceUtils.setString(Strings.fcmToken,fcmToken??"");
      // debugPrint("fcmToken : $fcmToken");
      Map<String, dynamic> body = {
        "type" : "email",
        "identifier": emailController.text.trim()
      };
      debugPrint("body for login : $body");
      forgotPasswordResponse = await MyApi.callPostApi(
          url: forgotPasswordEmailApiUrl,
          body: body,
          modelName: Models.forgotPasswordResponse,
          sendToken: false);
      debugPrint("forgotPasswordResponse.statusCode : ${forgotPasswordResponse.statusCode }");

      if (forgotPasswordResponse.data != null) {
        _loader.hideLoader(context!);
        if (forgotPasswordResponse.statusCode == 201 && forgotPasswordResponse.data == null) {
          Toasts.getErrorToast(text: forgotPasswordResponse.status);
        }
        if (forgotPasswordResponse.statusCode == 201 && forgotPasswordResponse.data != null) {
          Toasts.getSuccessToast(text: forgotPasswordResponse.status);
          debugPrint("AccessToken======>${forgotPasswordResponse.data}");
          // debugPrint("AccessToken refreshToken======>${loginResponse.data?.refreshToken}");
          reset();
          Navigator.pushReplacementNamed(
            context!,
            AppRoutes.forgetPasswordVerification,
          );
        }
      } else {
        Toasts.getErrorToast(text: forgotPasswordResponse.status);
        _loader.hideLoader(context!);
      }
    } catch (err) {
      debugPrint("error during login is : $err");
      _loader.hideLoader(context!);
    }
  }
}
