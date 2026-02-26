// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:petcure_delivery_app/core/models/place_model.dart';

class UpdateAgentProfileData {
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? address;
  final File? profileImage;
  final File? idCardImage;
  final PlaceModel? place;
  const UpdateAgentProfileData({
    this.username,
    this.email,
    this.phoneNumber,
    this.password,
    this.address,
    this.profileImage,
    this.idCardImage,
    this.place,
  });

  UpdateAgentProfileData copyWith({
    String? username,
    String? email,
    String? phoneNumber,
    String? password,
    String? address,
    File? profileImage,
    File? idCardImage,
    PlaceModel? place,
  }) {
    return UpdateAgentProfileData(
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
      idCardImage: idCardImage ?? this.idCardImage,
      place: place ?? this.place,
    );
  }

  /// Returns true if any property is null.
  bool isAnyNull() =>
      username == null ||
      email == null ||
      phoneNumber == null ||
      password == null ||
      address == null ||
      profileImage == null ||
      idCardImage == null ||
      place == null;

  /// Returns true only if all properties are null.
  bool isAllNull() =>
      username == null &&
      email == null &&
      phoneNumber == null &&
      password == null &&
      address == null &&
      profileImage == null &&
      idCardImage == null &&
      place == null;

  /// Returns true when none of the properties are null.
  bool isComplete() =>
      username != null &&
      email != null &&
      phoneNumber != null &&
      password != null &&
      address != null &&
      profileImage != null &&
      idCardImage != null &&
      place != null;

  @Deprecated(
    'Use isAnyNull() instead. This will be removed in a future release.',
  )
  bool isNull() => isAnyNull();
}
