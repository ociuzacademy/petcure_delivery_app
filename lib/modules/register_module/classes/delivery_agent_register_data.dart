import 'dart:io';

class DeliveryAgentRegisterData {
  final String username;
  final String email;
  final String phoneNumber;
  final String password;
  final String address;
  final String city;
  final File profileImage;
  final File idCardImage;

  const DeliveryAgentRegisterData({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.address,
    required this.city,
    required this.profileImage,
    required this.idCardImage,
  });
}
