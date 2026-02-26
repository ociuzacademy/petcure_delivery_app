// To parse this JSON data, do
//
//     final deliveryRegistrationResponseModel = deliveryRegistrationResponseModelFromJson(jsonString);

import 'dart:convert';

DeliveryRegistrationResponseModel deliveryRegistrationResponseModelFromJson(
  String str,
) => DeliveryRegistrationResponseModel.fromJson(json.decode(str));

String deliveryRegistrationResponseModelToJson(
  DeliveryRegistrationResponseModel data,
) => json.encode(data.toJson());

class DeliveryRegistrationResponseModel {
  final String status;
  final String message;
  final Data data;

  const DeliveryRegistrationResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  DeliveryRegistrationResponseModel copyWith({
    String? status,
    String? message,
    Data? data,
  }) => DeliveryRegistrationResponseModel(
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory DeliveryRegistrationResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => DeliveryRegistrationResponseModel(
    status: json['status'],
    message: json['message'],
    data: Data.fromJson(json['data']),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}

class Data {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String address;
  final String place;
  final String? profileImage;
  final String? idCardImage;
  final String status;
  final bool isApproved;
  final DateTime createdAt;
  final int serviceRadius;
  final bool isAvailable;
  final String placeDisplay;

  const Data({
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

  Data copyWith({
    int? id,
    String? username,
    String? email,
    String? phone,
    String? address,
    String? place,
    dynamic profileImage,
    dynamic idCardImage,
    String? status,
    bool? isApproved,
    DateTime? createdAt,
    int? serviceRadius,
    bool? isAvailable,
    String? placeDisplay,
  }) => Data(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
