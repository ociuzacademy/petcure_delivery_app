import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_delivery_app/core/constants/app_constants.dart';
import 'package:petcure_delivery_app/core/constants/app_urls.dart';
import 'package:petcure_delivery_app/modules/q_r_scanner_module/models/confirm_delivery_response_model.dart';

class QRScannerServices {
  static Future<ConfirmDeliveryResponseModel> confirmDelivery({
    required int orderId,
  }) async {
    try {
      Map<String, dynamic> params = {'order_id': orderId};

      final resp = await http
          .patch(
            Uri.parse(AppUrls.confirmDeliveryUrl),
            body: jsonEncode(params),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8',
            },
          )
          .timeout(
            const Duration(seconds: AppConstants.requestTimeoutSeconds),
            onTimeout: () {
              throw TimeoutException(
                'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
              );
            },
          );

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(resp.body);
        final ConfirmDeliveryResponseModel response =
            ConfirmDeliveryResponseModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to confirm delivery: ${errorResponse['message'] ?? 'Unknown error'}',
        );
      }
    } on TimeoutException catch (e) {
      debugPrint('QRScannerServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Server error');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
