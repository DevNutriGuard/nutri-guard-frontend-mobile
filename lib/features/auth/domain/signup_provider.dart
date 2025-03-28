// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mime/mime.dart';
import 'package:nutri_guard_mobile/models/email_otp_verfiy_response.dart';
import 'package:nutri_guard_mobile/models/phone_signup_response.dart';
import 'package:nutri_guard_mobile/models/phone_verification_response.dart';
import 'package:nutri_guard_mobile/models/signup_response.dart';
import 'package:nutri_guard_mobile/res/res_export.dart';
import 'package:nutri_guard_mobile/res/utils.dart';
import 'package:path/path.dart';

import '../../../core/routes/app_routes.dart';
import '../../../models/upload_image_model.dart';
import '../../../network/api_service.dart';
import '../../../network/api_url.dart';
import '../../../network/models.dart';
import '../../../res/loader.dart';
import '../../../res/toasts.dart';
import 'package:image/image.dart' as img;

class SignupProvider extends ChangeNotifier {
  BuildContext? context;
  final Loader _loader = Loader();
  SignupResponse signupResponse = SignupResponse();
  PhoneSignupResponse phoneSignupResponse = PhoneSignupResponse();
  PhoneVerificationResponse phoneVerificationResponse = PhoneVerificationResponse();
  EmailOtpVerfiyResponse emailOtpVerfiyResponse = EmailOtpVerfiyResponse();
  String ?imageUrl;
  UploadImageModel uploadImageModel = UploadImageModel();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  String ?completePhoneNumber;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  XFile? profileImage;

  void init(BuildContext context) {
    this.context = context;
  }
  Future<File> compressImage(String imagePath) async {
    File file = File(imagePath);
    img.Image? image = img.decodeImage(await file.readAsBytes());

    if (image != null) {
      // Resize the image to a max width of 800px while maintaining aspect ratio
      img.Image resizedImage = img.copyResize(image, width: 800);

      // Convert the image back to a file with quality 70%
      File compressedFile = File(imagePath)..writeAsBytesSync(img.encodeJpg(resizedImage, quality: 70));

      print("Compressed image size: ${compressedFile.lengthSync()} bytes");
      return compressedFile;
    } else {
      return file; // If compression fails, return the original file
    }
  }
  Future<void> pickProfileImage({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      File file = File(image.path);

      // Check file size before uploading
      // int fileSize = file.lengthSync();
      // if (fileSize > 5 * 1024 * 1024) { // 5MB Limit
      //   debugPrint("File is too large! Please select a smaller image.");
      //   return;
      // }
      profileImage = image;
      notifyListeners();
      final imageUrl = await uploadImage(image.path);
      if (imageUrl != null) {
        debugPrint("Image uploaded successfully: $imageUrl");
      }
      notifyListeners();
    }
    notifyListeners();

  }
  Future<String?> uploadImage(String imagePath) async {
    try {
      print("uploadImageUrl-->$uploadImageUrl");
      print("imagePath-->$imagePath");

      var url = Uri.parse(uploadImageUrl);
      var request = http.MultipartRequest("POST", url);

      // Compress image before upload
      File imageFile = await compressImage(imagePath);

      // Check file size again after compression
      if (imageFile.lengthSync() > 5 * 1024 * 1024) {
        debugPrint("File still too large after compression. Please select a smaller image.");
       Toasts.getWarningToast(text: "File still too large after compression. Please select a smaller image.");
        return null;
      }

      // Get MIME type
      var mimeType = lookupMimeType(imageFile.path) ?? "image/jpeg";

      // Attach compressed image file
      var multipartFile = await http.MultipartFile.fromPath(
        'file',
        imageFile.path,
        contentType: DioMediaType.parse(mimeType),
      );

      request.files.add(multipartFile);
      request.headers.addAll({
        "Content-Type": "multipart/form-data"
      });

      // Send request
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      debugPrint("response.body--> $responseBody");

      if (response.statusCode == 201) {
        final uploadImageModel = uploadImageModelFromJson(responseBody);
        imageUrl = uploadImageModel.data?.url;
        PreferenceUtils.setString(Strings.profilePicture, imageUrl??"");
        notifyListeners();
        return uploadImageModel.data?.url;
      } else {
        debugPrint("Failed to upload image. Status code: ${response.statusCode}");
        notifyListeners();
        return null;
      }
    } catch (e) {
      debugPrint("Error while uploading image ==> $e");
      return null;
    }
  }
  Future<void> signupApi() async {
    try {
      _loader.showLoader(context: context);
      // String? fcmToken = await _firebaseMessaging.getToken();
      // await PreferenceUtils.setString(Strings.fcmToken,fcmToken??"");
      // debugPrint("fcmToken : $fcmToken");
      Map<String, dynamic> body =    {
        "name": fullNameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "profilePicture": imageUrl ?? ""
      };
      debugPrint("body for login : $body");
      signupResponse = await MyApi.callPostApi(
          url: signUpApiUrl,
          body: body,
          modelName: Models.signupResponse,
          sendToken: false);
      debugPrint("signupResponse.statusCode : ${signupResponse.statusCode }");

      if (signupResponse.data != null) {
        _loader.hideLoader(context!);
        if (signupResponse.statusCode == 201 && signupResponse.data == null) {
          Toasts.getErrorToast(text: signupResponse.status);
        }
        if (signupResponse.statusCode == 201 && signupResponse.data != null) {
          Toasts.getSuccessToast(text: signupResponse.status);
          debugPrint("AccessToken======>${signupResponse.data}");
          // await PreferenceUtils.setLoginResponse(loginResponse);

          Navigator.pushNamed(
            context!,
            '/emailVerificationScreen',
            arguments: emailController.text,
          );
        }
      } else {
        Toasts.getErrorToast(text: signupResponse.status);
        _loader.hideLoader(context!);
      }
    } catch (err) {
      debugPrint("error during login is : $err");
      _loader.hideLoader(context!);
    }
  }
  Future<void> phoneSignupApi() async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> body =    {
        "phoneNumber": completePhoneNumber
      };
      debugPrint("body for login : $body");

      phoneSignupResponse = await MyApi.callPostApi(
          url: phoneSignUpApiUrl,
          body: body,
          modelName: Models.phoneSignupResponse,
          sendToken: false);
      debugPrint("phoneSignupResponse.statusCode : ${phoneSignupResponse.statusCode }");

      if (phoneSignupResponse.data != null) {
        _loader.hideLoader(context!);
        if (phoneSignupResponse.statusCode == 201 && phoneSignupResponse.data != null) {
          Toasts.getSuccessToast(text: phoneSignupResponse.status);
          debugPrint("AccessToken======>${phoneSignupResponse.data}");
          // await PreferenceUtils.setLoginResponse(loginResponse);

          Navigator.pushNamed(
            context!,
            '/verifyPhoneNumber',
            arguments: completePhoneNumber,
          );
        }
      } else {
        Toasts.getErrorToast(text: phoneSignupResponse.data?.message);
        _loader.hideLoader(context!);
      }
    } catch (err) {
      debugPrint("error during phoneSignupResponse is : $err");
      _loader.hideLoader(context!);
    }
  }
  Future<void> verifyOtpApi({
    required String verificationType,
    required String identifier,
    required String otpCode,
}) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> body =    {
        "type": verificationType,
        "identifier": identifier,
        "otpCode": otpCode
      };
      debugPrint("body for phoneVerificationResponse : $body");
      phoneVerificationResponse = await MyApi.callPostApi(
          url: otpApiUrl,
          body: body,
          modelName: Models.phoneVerificationResponse,
          sendToken: false);
      debugPrint("phoneVerificationResponse.statusCode : ${phoneVerificationResponse.statusCode }");

      if (phoneVerificationResponse.data != null) {
        _loader.hideLoader(context!);
        if (phoneVerificationResponse.statusCode == 201 && phoneVerificationResponse.data != null) {
          Toasts.getSuccessToast(text: phoneVerificationResponse.data?.message);
          debugPrint("phoneVerificationResponse======>${phoneVerificationResponse.data}");
          if(verificationType=="phone")
            {
              Navigator.of(context!).pushNamedAndRemoveUntil(
                '/signInWithPhoneNumber', // The named route of your new screen
                    (Route<dynamic> route) => false, // Removes all previous screens
              );
            }
          else if(verificationType=="email")
          {
            Navigator.of(context!).pushNamedAndRemoveUntil(
              '/signIn', // The named route of your new screen
                  (Route<dynamic> route) => false, // Removes all previous screens
            );
          }
        }
      } else {
        Toasts.getErrorToast(text: phoneSignupResponse.data?.message);
        _loader.hideLoader(context!);
      }
    } catch (err) {
      debugPrint("error during phoneVerificationResponse is : $err");
      _loader.hideLoader(context!);
    }
  }

  void showImagePickerOptions() {
    showModalBottomSheet(
      context: context!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                Text(
                  'Choose an Option',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Divider(),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    Navigator.pop(context);
                    pickProfileImage(source: ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    pickProfileImage(source: ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
