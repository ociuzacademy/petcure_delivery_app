import 'dart:io';

import 'package:petcure_delivery_app/core/models/place_model.dart';

class DeliveryAgentRegisterData {
  final String username;
  final String email;
  final String phoneNumber;
  final String password;
  final String address;
  final File profileImage;
  final File idCardImage;
  final PlaceModel place;

  const DeliveryAgentRegisterData({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.address,
    required this.profileImage,
    required this.idCardImage,
    required this.place,
  });
}
