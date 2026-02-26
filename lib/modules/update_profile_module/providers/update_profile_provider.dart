// register_provider.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_delivery_app/core/models/place_model.dart';
import 'package:petcure_delivery_app/core/utils/place_utils.dart';
import 'package:petcure_delivery_app/core/utils/validators.dart';
import 'package:petcure_delivery_app/core/models/api_models/delivery_agent_profile_model.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/classes/update_agent_profile_data.dart';

class UpdateProfileProvider with ChangeNotifier {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<PlaceModel> places = PlaceUtils.getPlaces();

  DeliveryAgentProfileModel? _agentProfile;

  // Text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Focus nodes
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();

  // Image states
  File? _profileImage;
  File? _idCardImage;

  PlaceModel? _selectedPlace;

  // Getters
  DeliveryAgentProfileModel? get agentProfile => _agentProfile;
  File? get profileImage => _profileImage;
  File? get idCardImage => _idCardImage;
  PlaceModel? get selectedPlace => _selectedPlace;

  // Setters

  void setProfileImage(File? image) {
    _profileImage = image;
    notifyListeners();
  }

  void setIdCardImage(File? image) {
    _idCardImage = image;
    notifyListeners();
  }

  void setSelectedPlace(PlaceModel? place) {
    _selectedPlace = place;
    notifyListeners();
  }

  void setProfileDataFromApi(DeliveryAgentProfileModel value) {
    _agentProfile = value;
    usernameController.text = value.username;
    emailController.text = value.email;
    phoneNumberController.text = value.phone;
    addressController.text = value.address;
    setSelectedPlace(
      places.firstWhere(
        (place) => place.placeValue == value.place,
        orElse: () => places.first,
      ),
    );
    notifyListeners();
  }

  // Image picking method
  Future<void> pickImage({bool isIdCard = false}) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        if (isIdCard) {
          setIdCardImage(File(pickedFile.path));
        } else {
          setProfileImage(File(pickedFile.path));
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  // Validation methods
  String? validateFullName(String? value) => Validators.name(value);

  String? validateEmail(String? value) => Validators.email(value);

  String? validatePhoneNumber(String? value) => Validators.phone(value);

  String? validateAddress(String? value) =>
      Validators.required(value, 'Address');

  String? validatePassword(String? value) => Validators.password(value);

  String? validatePlace(PlaceModel? value) => Validators.place(value);

  void unfocusAll() {
    fullNameFocusNode.unfocus();
    emailFocusNode.unfocus();
    phoneNumberFocusNode.unfocus();
    passwordFocusNode.unfocus();
    addressFocusNode.unfocus();
  }

  // Check if form is valid
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // delivery agent update profile data
  UpdateAgentProfileData? validateUpdateProfileData() {
    unfocusAll();
    // If form is NOT valid, return null
    if (!(formKey.currentState?.validate() ?? false)) {
      return null;
    }

    final String username = usernameController.text.trim();
    final String email = emailController.text.trim();
    final String phoneNumber = phoneNumberController.text.trim();
    final String password = passwordController.text.trim();
    final String address = addressController.text.trim();

    return UpdateAgentProfileData(
      address: address != _agentProfile!.address ? address : null,
      email: email != _agentProfile!.email ? email : null,
      idCardImage: _idCardImage,
      password: password.isNotEmpty ? password : null,
      phoneNumber: phoneNumber != _agentProfile!.phone ? phoneNumber : null,
      place: _selectedPlace?.placeValue != _agentProfile!.place
          ? _selectedPlace
          : null,
      profileImage: _profileImage,
      username: username != _agentProfile!.username ? username : null,
    );
  }

  // Clear all form data
  void clearForm() {
    usernameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    addressController.clear();
    _profileImage = null;
    _idCardImage = null;
    _selectedPlace = null;
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    addressController.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    passwordFocusNode.dispose();
    addressFocusNode.dispose();

    super.dispose();
  }
}
