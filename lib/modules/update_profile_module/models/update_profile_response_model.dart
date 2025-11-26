// To parse this JSON data, do
//
//     final updateProfileResponseModel = updateProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileResponseModel updateProfileResponseModelFromJson(String str) =>
    UpdateProfileResponseModel.fromJson(json.decode(str));

String updateProfileResponseModelToJson(UpdateProfileResponseModel data) =>
    json.encode(data.toJson());

class UpdateProfileResponseModel {
  final String details;

  const UpdateProfileResponseModel({required this.details});

  UpdateProfileResponseModel copyWith({String? details}) =>
      UpdateProfileResponseModel(details: details ?? this.details);

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponseModel(details: json['details']);

  Map<String, dynamic> toJson() => {'details': details};
}
