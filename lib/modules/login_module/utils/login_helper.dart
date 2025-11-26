// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/core/exports/bloc_exports.dart';
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

      final LoginBloc loginBloc = context.read<LoginBloc>();
      loginBloc.add(LoginEvent.agentLoggingIn(email, password));
    } else {
      CustomSnackBar.showError(
        context,
        message: 'Please add email and password',
      );
    }
  }
}
