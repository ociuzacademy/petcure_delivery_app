import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/modules/register_module/bloc/register_bloc.dart';
import 'package:petcure_delivery_app/modules/register_module/classes/delivery_agent_register_data.dart';
import 'package:petcure_delivery_app/modules/register_module/providers/register_provider.dart';
import 'package:petcure_delivery_app/widgets/snackbars/custom_snack_bar.dart';

class RegisterHelper {
  final BuildContext context;
  const RegisterHelper({required this.context});

  void register(RegisterProvider provider) {
    FocusScope.of(context).unfocus();

    if (provider.isFormComplete) {
      final DeliveryAgentRegisterData? deliveryAgentRegisterData = provider
          .validateRegisterData();

      if (deliveryAgentRegisterData != null) {
        final RegisterBloc registerBloc = context.read<RegisterBloc>();
        registerBloc.add(
          RegisterEvent.deliveryAgentRegistering(deliveryAgentRegisterData),
        );
      }
    } else {
      CustomSnackBar.showError(
        context,
        message: 'Please fill all the fields, and provide required data',
      );
    }
  }
}
