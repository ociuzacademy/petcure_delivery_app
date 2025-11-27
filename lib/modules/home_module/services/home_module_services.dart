import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_delivery_app/core/constants/app_constants.dart';
import 'package:petcure_delivery_app/core/constants/app_urls.dart';
import 'package:petcure_delivery_app/modules/home_module/models/delivery_order_list_model.dart';

class HomeModuleServices {
  static Future<DeliveryOrderListModel> getDeliveryOrderList({
    required int agentId,
  }) async {
    try {
      final Map<String, dynamic> params = {'agent_id': agentId.toString()};

      final url = Uri.parse(
        AppUrls.getAgentOrderListUrl,
      ).replace(queryParameters: params);

      final resp = await http
          .get(
            url,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
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
        final response = DeliveryOrderListModel.fromJson(decoded);

        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('HomeModuleServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception('Server error');
    } on HttpException {
      throw Exception('Something went wrong');
    } on FormatException {
      throw Exception('Bad request');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
