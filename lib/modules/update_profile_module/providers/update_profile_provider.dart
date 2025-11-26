// register_provider.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_delivery_app/core/models/api_models/delivery_agent_profile_model.dart';
import 'package:petcure_delivery_app/modules/update_profile_module/classes/update_agent_profile_data.dart';

class UpdateProfileProvider with ChangeNotifier {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  // Getters
  DeliveryAgentProfileModel? get agentProfile => _agentProfile;
  File? get profileImage => _profileImage;
  File? get idCardImage => _idCardImage;

  // Setters

  void setProfileImage(File? image) {
    _profileImage = image;
    notifyListeners();
  }

  void setIdCardImage(File? image) {
    _idCardImage = image;
    notifyListeners();
  }

  void setProfileDataFromApi(DeliveryAgentProfileModel value) {
    _agentProfile = value;
    usernameController.text = value.username;
    emailController.text = value.email;
    phoneNumberController.text = value.phone;
    passwordController.text = value.password;
    addressController.text = value.address;
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
  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter full name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }

    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
    if (!emailValid) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }

    bool phoneValid = RegExp(r'^(\+91[\-\s]?)?[6-9]\d{9}$').hasMatch(value);
    if (!phoneValid) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please add your address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }

    if (value.length < 3) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

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

  // delivery agent register data
  UpdateAgentProfileData? validateUpdateProfileData() {
    unfocusAll();
    if (validateForm()) {
      return null;
    }

    final String username = usernameController.text.trim();
    if (username.isEmpty) {
      return null;
    }

    final String email = emailController.text.trim();
    if (email.isEmpty) {
      return null;
    }

    final String phoneNumber = phoneNumberController.text.trim();
    if (phoneNumber.isEmpty) {
      return null;
    }

    final String password = passwordController.text.trim();
    if (password.isEmpty) {
      return null;
    }

    final String address = addressController.text.trim();
    if (address.isEmpty) {
      return null;
    }

    return UpdateAgentProfileData(
      address: address != _agentProfile!.address ? address : null,
      email: email != _agentProfile!.email ? email : null,
      idCardImage: _idCardImage,
      password: password != _agentProfile!.password ? password : null,
      phoneNumber: phoneNumber != _agentProfile!.phone ? phoneNumber : null,
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
