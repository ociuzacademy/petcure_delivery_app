// register_provider.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_delivery_app/core/models/place_model.dart';
import 'package:petcure_delivery_app/core/utils/place_utils.dart';
import 'package:petcure_delivery_app/core/utils/validators.dart';
import 'package:petcure_delivery_app/modules/register_module/classes/delivery_agent_register_data.dart';

class RegisterProvider with ChangeNotifier {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<PlaceModel> places = PlaceUtils.getPlaces();

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

  // Place selection
  PlaceModel? _selectedPlace;

  // Getters
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

  String? validatePlace(PlaceModel? place) => Validators.place(place);

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

  // Check if all required fields are filled
  bool get isFormComplete {
    return usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        _profileImage != null &&
        _idCardImage != null &&
        _selectedPlace != null;
  }

  // delivery agent register data
  DeliveryAgentRegisterData? validateRegisterData() {
    unfocusAll();
    if (isFormComplete) {
      return DeliveryAgentRegisterData(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        password: passwordController.text.trim(),
        address: addressController.text.trim(),
        profileImage: _profileImage!,
        idCardImage: _idCardImage!,
        place: _selectedPlace!,
      );
    } else {
      return null;
    }
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
