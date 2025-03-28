import 'dart:developer';

import 'package:dio/dio.dart';

class DeviceConnectionService {
  static const String _baseUrl = 'https://staging-api.nutri-guard.ai/v1';
  static const String _appToken = 'c56735a5-ad65-4274-936a-37e0ad215bd7';
  final Dio _dio = Dio();

  Future<void> connectDeviceToSpike(String provider, String spikeUserId) async {
    const url = '$_baseUrl/spike/spike-integration';
    try {
      _dio.options.headers = {
        'Authorization': 'Bearer $_appToken',
        'Content-Type': 'application/json',
      };

      final bodyData = {
        'provider': provider,
        'spikeUserId': spikeUserId,
      };

      final response = await _dio.post(url, data: bodyData);

      if (response.statusCode == 200) {
        log('Device connected successfully');
      } else {
        log('Error connecting device: ${response.data}');
      }
    } catch (e) {
      log('Error during device connection: $e');
    }
  }
}
