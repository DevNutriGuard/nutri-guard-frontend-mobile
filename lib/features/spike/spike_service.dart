import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class SpikeService {
  static const String _apiUrl = 'https://dev.api.spikeapi.com';
  static const String _appToken = 'c56735a5-ad65-4274-936a-37e0ad215bd7';
  static Dio _dio = Dio();

  static Future<void> initializeSpike() async {
    _dio = Dio(BaseOptions(
      baseUrl: _apiUrl,
      headers: {'Authorization': 'Bearer $_appToken'},
    )
    );

    String? spikeUserId = await _getSpikeUserId();
    if (spikeUserId != null) {
      debugPrint("Spike User ID: $spikeUserId");
    }
  }

  static Future<String?> _getSpikeUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('spikeUserId');
  }

  static Future<void> saveSpikeUserId(String spikeUserId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('spikeUserId', spikeUserId);
  }

  static Future<void> connectDeviceToSpike(String provider, String spikeUserId) async {
    const url = '$_apiUrl/spike/spike-integration';

    try {
      final bodyData = {
        'provider': provider,
        'spikeUserId': spikeUserId,
      };

      final response = await _dio.post(url, data: bodyData);
      if (response.statusCode == 201) {
        debugPrint('Device connected successfully');
      } else {
        debugPrint('Error connecting device: ${response.data}');
      }
    } catch (e) {
      debugPrint('Error during device connection: $e');
    }
  }
}
