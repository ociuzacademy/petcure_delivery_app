import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_delivery_app/core/constants/app_constants.dart';
import 'package:petcure_delivery_app/core/constants/app_urls.dart';
import 'package:petcure_delivery_app/modules/login_module/models/delivery_agent_login_response_model.dart';

class LoginServices {
  static Future<DeliveryAgentLoginResponseModel> deliveryAgentLogin({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> params = {'email': email, 'password': password};

      final resp = await http
          .post(
            Uri.parse(AppUrls.loginUrl),
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
        final DeliveryAgentLoginResponseModel response =
            DeliveryAgentLoginResponseModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to login: ${errorResponse['message'] ?? 'Unknown error'}',
        );
      }
    } on TimeoutException catch (e) {
      debugPrint('LoginServices: Request timeout - $e');
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
