// To parse this JSON data, do
//
//     final deliveryAgentProfileModel = deliveryAgentProfileModelFromJson(jsonString);

import 'dart:convert';

DeliveryAgentProfileModel deliveryAgentProfileModelFromJson(String str) =>
    DeliveryAgentProfileModel.fromJson(json.decode(str));

String deliveryAgentProfileModelToJson(DeliveryAgentProfileModel data) =>
    json.encode(data.toJson());

class DeliveryAgentProfileModel {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String address;
  final String place;
  final String profileImage;
  final String idCardImage;
  final String status;
  final bool isApproved;
  final DateTime createdAt;
  final int serviceRadius;
  final bool isAvailable;
  final String placeDisplay;

  const DeliveryAgentProfileModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.place,
    required this.profileImage,
    required this.idCardImage,
    required this.status,
    required this.isApproved,
    required this.createdAt,
    required this.serviceRadius,
    required this.isAvailable,
    required this.placeDisplay,
  });

  DeliveryAgentProfileModel copyWith({
    int? id,
    String? username,
    String? email,
    String? phone,
    String? address,
    String? place,
    String? profileImage,
    String? idCardImage,
    String? status,
    bool? isApproved,
    DateTime? createdAt,
    int? serviceRadius,
    bool? isAvailable,
    String? placeDisplay,
  }) => DeliveryAgentProfileModel(
    id: id ?? this.id,
    username: username ?? this.username,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    address: address ?? this.address,
    place: place ?? this.place,
    profileImage: profileImage ?? this.profileImage,
    idCardImage: idCardImage ?? this.idCardImage,
    status: status ?? this.status,
    isApproved: isApproved ?? this.isApproved,
    createdAt: createdAt ?? this.createdAt,
    serviceRadius: serviceRadius ?? this.serviceRadius,
    isAvailable: isAvailable ?? this.isAvailable,
    placeDisplay: placeDisplay ?? this.placeDisplay,
  );

  factory DeliveryAgentProfileModel.fromJson(Map<String, dynamic> json) =>
      DeliveryAgentProfileModel(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        place: json['place'],
        profileImage: json['profile_image'],
        idCardImage: json['id_card_image'],
        status: json['status'],
        isApproved: json['is_approved'],
        createdAt: DateTime.parse(json['created_at']),
        serviceRadius: json['service_radius'],
        isAvailable: json['is_available'],
        placeDisplay: json['place_display'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'phone': phone,
    'address': address,
    'place': place,
    'profile_image': profileImage,
    'id_card_image': idCardImage,
    'status': status,
    'is_approved': isApproved,
    'created_at': createdAt.toIso8601String(),
    'service_radius': serviceRadius,
    'is_available': isAvailable,
    'place_display': placeDisplay,
  };
}
