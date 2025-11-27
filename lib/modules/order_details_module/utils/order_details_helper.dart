// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/core/enums/delivery_status.dart';
import 'package:petcure_delivery_app/core/exports/bloc_exports.dart';
import 'package:petcure_delivery_app/modules/order_details_module/models/order_details_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:petcure_delivery_app/widgets/snackbars/custom_snack_bar.dart';

class OrderDetailsHelper {
  final BuildContext context;
  final int orderId;
  OrderDetailsHelper({required this.context, required this.orderId});

  void orderDetailsInit() {
    final OrderDetailsCubit orderDetailsCubit =
        BlocProvider.of<OrderDetailsCubit>(context);
    orderDetailsCubit.getOrderDetails(orderId: orderId);
  }

  Future<void> openMap(OrderDetails orderDetails) async {
    final String mapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${orderDetails.latitude},${orderDetails.longitude}';

    try {
      if (await canLaunchUrl(Uri.parse(mapsUrl))) {
        await launchUrl(Uri.parse(mapsUrl));
      } else {
        if (!context.mounted) return;
        CustomSnackBar.showError(context, message: 'Could not open maps app');
      }
    } catch (e) {
      if (!context.mounted) return;
      CustomSnackBar.showError(context, message: 'Error: $e');
    }
  }

  Future<void> makePhoneCall(OrderDetails orderDetails) async {
    final String phoneNumber = orderDetails.phoneNumber.replaceAll(
      RegExp(r'[^\d+]'),
      '',
    );
    final String telUrl = 'tel:$phoneNumber';

    try {
      if (await canLaunchUrl(Uri.parse(telUrl))) {
        await launchUrl(Uri.parse(telUrl));
      } else {
        if (!context.mounted) return;
        CustomSnackBar.showError(context, message: 'Could not make phone call');
      }
    } catch (e) {
      if (!context.mounted) return;
      CustomSnackBar.showError(context, message: 'Error: $e');
    }
  }

  Color getStatusColor(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.orderOnTheWay:
        return Colors.orange;
      case DeliveryStatus.orderDelivered:
        return Colors.green;
    }
  }

  String getStatusText(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.orderOnTheWay:
        return 'On the Way';
      case DeliveryStatus.orderDelivered:
        return 'Delivered';
    }
  }
}
