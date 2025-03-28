import 'package:flutter/cupertino.dart';
import '../models/refresh_token_model.dart';
import '../res/strings.dart';
import '../res/utils.dart';
import 'api_service.dart';
import 'api_url.dart';
import 'models.dart';

class RefreshToken{
  RefreshTokenModel refreshTokenModel = RefreshTokenModel();
  Future<bool> onRefreshTokenApi() async {
    try {
      debugPrint("refreshToken ${PreferenceUtils.getString(Strings.refreshToken)}");
      Map<String, dynamic> refreshTokenBody = {
        'refreshToken': '${PreferenceUtils.getString(Strings.refreshToken)}'
      };
        refreshTokenModel =  await MyApi.callPostApi(
            url: refreshTokenUrl,
            body:refreshTokenBody,
            modelName: Models.refreshTokenModel
        );
      if(refreshTokenModel.statusCode==201)
      {
        debugPrint("refreshTokenModel.status==200 ${refreshTokenModel.status}");
        await PreferenceUtils.setString(Strings.accessToken, "Bearer ${refreshTokenModel.data?.accessToken}" );
        await PreferenceUtils.setString(Strings.refreshToken, "Bearer ${refreshTokenModel.data?.refreshToken}");
        debugPrint("token is added --> ${refreshTokenModel.data}");
        return true;
      }
      else{
        return false;
      }
    } catch (error) {
      debugPrint("_loginResponse error $error");
      return false;
    }
  }
}