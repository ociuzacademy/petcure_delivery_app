// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_delivery_app/modules/home_module/view/home_page.dart';
import 'package:petcure_delivery_app/widgets/snackbars/custom_snack_bar.dart';

class LoginHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginHelper({
    required this.context,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  void login() {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      if (email == 'user@email.com') {
        if (password == 'pass') {
          CustomSnackBar.showSuccess(
            context,
            message: 'User logged in successfully',
          );

          Navigator.pushAndRemoveUntil(
            context,
            HomePage.route(),
            (route) => false,
          );
        } else {
          CustomSnackBar.showError(context, message: 'Invalid password');
        }
      } else {
        CustomSnackBar.showError(
          context,
          message: 'Invalid email and/or password',
        );
      }
    } else {
      CustomSnackBar.showError(
        context,
        message: "Please add email and password",
      );
    }
  }
}
