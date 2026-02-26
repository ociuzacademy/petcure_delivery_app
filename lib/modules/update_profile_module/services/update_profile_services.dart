import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_delivery_app/core/constants/app_constants.dart';
import 'package:petcure_delivery_app/core/constants/app_urls.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/classes/update_agent_profile_data.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/models/update_profile_response_model.dart';

class UpdateProfileServices {
  static Future<UpdateProfileResponseModel> updateDeliveryAgentProfile({
    required int agentId,
    required UpdateAgentProfileData updateAgentProfileData,
  }) async {
    try {
      if (updateAgentProfileData.isAllNull()) {
        throw TimeoutException('There is no new data to be updated.');
      }

      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse(AppUrls.updateProfileUrl),
      );

      request.fields['delivery_agent_id'] = agentId.toString();

      if (updateAgentProfileData.username != null) {
        request.fields['username'] = updateAgentProfileData.username!;
      }
      if (updateAgentProfileData.email != null) {
        request.fields['email'] = updateAgentProfileData.email!;
      }

      if (updateAgentProfileData.password != null) {
        request.fields['password'] = updateAgentProfileData.password!;
      }

      if (updateAgentProfileData.address != null) {
        request.fields['address'] = updateAgentProfileData.address!;
      }

      if (updateAgentProfileData.phoneNumber != null) {
        request.fields['phone'] = updateAgentProfileData.phoneNumber!;
      }

      if (updateAgentProfileData.place != null) {
        request.fields['place'] = updateAgentProfileData.place!.placeValue;
      }

      if (updateAgentProfileData.profileImage != null) {
        var profileImageStream = http.ByteStream(
          updateAgentProfileData.profileImage!.openRead(),
        );
        var profileImageLength = await updateAgentProfileData.profileImage!
            .length();
        var profileImageMultipartFile = http.MultipartFile(
          'profile_image',
          profileImageStream,
          profileImageLength,
          filename: updateAgentProfileData.profileImage!.path.split('/').last,
        );
        request.files.add(profileImageMultipartFile);
      }

      if (updateAgentProfileData.idCardImage != null) {
        var idCardImageStream = http.ByteStream(
          updateAgentProfileData.idCardImage!.openRead(),
        );
        var idCardImageLength = await updateAgentProfileData.idCardImage!
            .length();
        var idCardImageMultipartFile = http.MultipartFile(
          'id_card_image',
          idCardImageStream,
          idCardImageLength,
          filename: updateAgentProfileData.idCardImage!.path.split('/').last,
        );
        request.files.add(idCardImageMultipartFile);
      }

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

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(responseBody);
        final UpdateProfileResponseModel response =
            UpdateProfileResponseModel.fromJson(decoded);
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
