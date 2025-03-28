import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:nutri_guard_mobile/res/utils.dart';  // Make sure this is where PreferenceUtils is

class FacebookAuthService {
  Future<Map<String, dynamic>?> loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;

        // Save the access token in PreferenceUtils for later use
        await PreferenceUtils.setString('facebook_access_token', accessToken.tokenString);

        final userData = await FacebookAuth.instance.getUserData(
          fields: "email,name,picture",
        );

        return userData;
      } else {
        print('Login failed: ${result.status}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // A method to retrieve the saved access token
  Future<String?> getAccessToken() async {
    return await PreferenceUtils.getString('facebook_access_token');
  }

  // Optionally, you can also provide a logout method to clear the token
  Future<void> logout() async {
    await FacebookAuth.instance.logOut();
    await PreferenceUtils.clearPreferences();  // Clear the token after logout
  }
}
