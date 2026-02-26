import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_delivery_app/core/constants/app_constants.dart';
import 'package:petcure_delivery_app/core/constants/app_urls.dart';
import 'package:petcure_delivery_app/modules/register_module/classes/delivery_agent_register_data.dart';
import 'package:petcure_delivery_app/modules/register_module/models/delivery_registration_response_model.dart';

class RegisterServices {
  static Future<DeliveryRegistrationResponseModel> registerDeliveryAgent({
    required DeliveryAgentRegisterData deliveryAgentRegisterData,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppUrls.registerUrl),
      );

      request.fields['username'] = deliveryAgentRegisterData.username;
      request.fields['email'] = deliveryAgentRegisterData.email;
      request.fields['password'] = deliveryAgentRegisterData.password;
      request.fields['address'] = deliveryAgentRegisterData.address;
      request.fields['phone'] = deliveryAgentRegisterData.phoneNumber;
      request.fields['place'] = deliveryAgentRegisterData.place.placeValue;

      var profileImageStream = http.ByteStream(
        deliveryAgentRegisterData.profileImage.openRead(),
      );
      var profileImageLength = await deliveryAgentRegisterData.profileImage
          .length();
      var profileImageMultipartFile = http.MultipartFile(
        'profile_image',
        profileImageStream,
        profileImageLength,
        filename: deliveryAgentRegisterData.profileImage.path.split('/').last,
      );
      request.files.add(profileImageMultipartFile);

      var idCardImageStream = http.ByteStream(
        deliveryAgentRegisterData.idCardImage.openRead(),
      );
      var idCardImageLength = await deliveryAgentRegisterData.idCardImage
          .length();
      var idCardImageMultipartFile = http.MultipartFile(
        'id_card_image',
        idCardImageStream,
        idCardImageLength,
        filename: deliveryAgentRegisterData.idCardImage.path.split('/').last,
      );
      request.files.add(idCardImageMultipartFile);

      // Send request
      final resp = await request.send().timeout(
        const Duration(seconds: AppConstants.requestTimeoutSeconds),
        onTimeout: () {
          throw TimeoutException(
            'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
          );
        },
      );

      // Convert the response stream to a string
      final responseBody = await resp.stream.bytesToString();

      if (resp.statusCode == 201) {
        final dynamic decoded = jsonDecode(responseBody);
        final DeliveryRegistrationResponseModel response =
            DeliveryRegistrationResponseModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(responseBody);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('RegisterService: Request timeout - $e');
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
