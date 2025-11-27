// To parse this JSON data, do
//
//     final confirmDeliveryResponseModel = confirmDeliveryResponseModelFromJson(jsonString);

import 'dart:convert';

ConfirmDeliveryResponseModel confirmDeliveryResponseModelFromJson(String str) =>
    ConfirmDeliveryResponseModel.fromJson(json.decode(str));

String confirmDeliveryResponseModelToJson(ConfirmDeliveryResponseModel data) =>
    json.encode(data.toJson());

class ConfirmDeliveryResponseModel {
  final String status;
  final String message;

  const ConfirmDeliveryResponseModel({
    required this.status,
    required this.message,
  });

  ConfirmDeliveryResponseModel copyWith({String? status, String? message}) =>
      ConfirmDeliveryResponseModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory ConfirmDeliveryResponseModel.fromJson(Map<String, dynamic> json) =>
      ConfirmDeliveryResponseModel(
        status: json['status'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
