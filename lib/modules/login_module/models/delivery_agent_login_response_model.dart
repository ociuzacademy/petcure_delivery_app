// To parse this JSON data, do
//
//     final deliveryAgentLoginResponseModel = deliveryAgentLoginResponseModelFromJson(jsonString);

import 'dart:convert';

DeliveryAgentLoginResponseModel deliveryAgentLoginResponseModelFromJson(
  String str,
) => DeliveryAgentLoginResponseModel.fromJson(json.decode(str));

String deliveryAgentLoginResponseModelToJson(
  DeliveryAgentLoginResponseModel data,
) => json.encode(data.toJson());

class DeliveryAgentLoginResponseModel {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String city;
  final String profileImage;
  final String idCardImage;
  final String status;

  const DeliveryAgentLoginResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.city,
    required this.profileImage,
    required this.idCardImage,
    required this.status,
  });

  DeliveryAgentLoginResponseModel copyWith({
    int? id,
    String? username,
    String? email,
    String? phone,
    String? city,
    String? profileImage,
    String? idCardImage,
    String? status,
  }) => DeliveryAgentLoginResponseModel(
    id: id ?? this.id,
    username: username ?? this.username,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    city: city ?? this.city,
    profileImage: profileImage ?? this.profileImage,
    idCardImage: idCardImage ?? this.idCardImage,
    status: status ?? this.status,
  );

  factory DeliveryAgentLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      DeliveryAgentLoginResponseModel(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        city: json['city'],
        profileImage: json['profile_image'],
        idCardImage: json['id_card_image'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'phone': phone,
    'city': city,
    'profile_image': profileImage,
    'id_card_image': idCardImage,
    'status': status,
  };
}
