import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_delivery_app/modules/login_module/view/login_page.dart';
import 'package:petcure_delivery_app/widgets/snackbars/custom_snack_bar.dart';

class RegisterHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController addressController;
  final ValueNotifier<File?> profileImage;
  final ValueNotifier<File?> idCardImage;
  final ValueNotifier<String?>
  selectedCity; // NEW: Selected city value notifier
  const RegisterHelper({
    required this.context,
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.addressController,
    required this.profileImage,
    required this.idCardImage,
    required this.selectedCity, // NEW: Selected city value notifier
  });

  Future<void> pickImage({bool isIdCard = false}) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        if (isIdCard) {
          idCardImage.value = File(pickedFile.path);
        } else {
          profileImage.value = File(pickedFile.path);
        }
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, message: "Error: ${e.toString()}");
      }
    }
  }

  void register() {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      if (selectedCity.value == null) {
        CustomSnackBar.showError(context, message: 'Please select your city');
        return;
      }
      if (profileImage.value != null && idCardImage.value != null) {
        CustomSnackBar.showSuccess(
          context,
          message: 'Your account have been registered successfully',
        );
        Navigator.pushReplacement(context, LoginPage.route());
      } else {
        if (profileImage.value == null) {
          CustomSnackBar.showError(
            context,
            message: 'Please upload your profile picture',
          );
        }
        if (idCardImage.value == null) {
          CustomSnackBar.showError(
            context,
            message: 'Please upload your ID card picture',
          );
        }
      }
    } else {
      CustomSnackBar.showError(context, message: 'Please fill all the fields');
    }
  }
}
