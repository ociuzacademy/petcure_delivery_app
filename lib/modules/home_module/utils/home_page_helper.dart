import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/core/exports/bloc_exports.dart';

class HomePageHelper {
  static void logout(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();
    authBloc.add(const AuthEvent.loggingOut());
  }
}
