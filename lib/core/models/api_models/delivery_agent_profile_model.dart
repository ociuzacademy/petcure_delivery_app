// To parse this JSON data, do
//
//     final deliveryAgentProfileModel = deliveryAgentProfileModelFromJson(jsonString);

import 'dart:convert';

DeliveryAgentProfileModel deliveryAgentProfileModelFromJson(String str) =>
    DeliveryAgentProfileModel.fromJson(json.decode(str));

String deliveryAgentProfileModelToJson(DeliveryAgentProfileModel data) =>
    json.encode(data.toJson());

class DeliveryAgentProfileModel {
  final String username;
  final String email;
  final String phone;
  final String password;
  final String address;
  final String city;
  final String profileImage;
  final String idCardImage;

  const DeliveryAgentProfileModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.address,
    required this.city,
    required this.profileImage,
    required this.idCardImage,
  });

  DeliveryAgentProfileModel copyWith({
    String? username,
    String? email,
    String? phone,
    String? password,
    String? address,
    String? city,
    String? profileImage,
    String? idCardImage,
  }) => DeliveryAgentProfileModel(
    username: username ?? this.username,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    password: password ?? this.password,
    address: address ?? this.address,
    city: city ?? this.city,
    profileImage: profileImage ?? this.profileImage,
    idCardImage: idCardImage ?? this.idCardImage,
  );

  factory DeliveryAgentProfileModel.fromJson(Map<String, dynamic> json) =>
      DeliveryAgentProfileModel(
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        password: json['password'],
        address: json['address'],
        city: json['city'],
        profileImage: json['profile_image'],
        idCardImage: json['id_card_image'],
      );

  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'phone': phone,
    'password': password,
    'address': address,
    'city': city,
    'profile_image': profileImage,
    'id_card_image': idCardImage,
  };
}
