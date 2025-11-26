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
  final String username;
  final String email;
  final String phone;
  final String password;
  final String address;
  final String city;
  final String profileImage;
  final String idCardImage;

  const Data({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.address,
    required this.city,
    required this.profileImage,
    required this.idCardImage,
  });

  Data copyWith({
    String? username,
    String? email,
    String? phone,
    String? password,
    String? address,
    String? city,
    String? profileImage,
    String? idCardImage,
  }) => Data(
    username: username ?? this.username,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    password: password ?? this.password,
    address: address ?? this.address,
    city: city ?? this.city,
    profileImage: profileImage ?? this.profileImage,
    idCardImage: idCardImage ?? this.idCardImage,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
