// register_provider.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterProvider with ChangeNotifier {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController fullNameController = TextEditingController();
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

  // City selection
  String? _selectedCity;
  static const List<String> cities = ['Thrissur', 'Palakkad', 'Ernakulam'];

  // Loading state
  bool _isLoading = false;

  // Getters
  File? get profileImage => _profileImage;
  File? get idCardImage => _idCardImage;
  String? get selectedCity => _selectedCity;
  bool get isLoading => _isLoading;
  List<String> get availableCities => cities;

  // Setters
  void setProfileImage(File? image) {
    _profileImage = image;
    notifyListeners();
  }

  void setIdCardImage(File? image) {
    _idCardImage = image;
    notifyListeners();
  }

  void setSelectedCity(String? city) {
    _selectedCity = city;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
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

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Check if form is valid
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // Check if all required fields are filled
  bool get isFormComplete {
    return fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        _selectedCity != null &&
        _profileImage != null &&
        _idCardImage != null;
  }

  // Clear all form data
  void clearForm() {
    fullNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    addressController.clear();
    _profileImage = null;
    _idCardImage = null;
    _selectedCity = null;
    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    fullNameController.dispose();
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
