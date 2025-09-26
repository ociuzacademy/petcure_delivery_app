// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:petcure_delivery_app/core/models/order.dart';
import 'package:petcure_delivery_app/widgets/snackbars/custom_snack_bar.dart';

class OrderDetailsHelper {
  final BuildContext context;
  final Order order;
  OrderDetailsHelper({required this.context, required this.order});

  Future<void> openMap() async {
    final String mapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${order.location.latitude},${order.location.longitude}';

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

  Future<void> makePhoneCall() async {
    final String phoneNumber = order.phoneNumber.replaceAll(
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

  Color getStatusColor(OrderDeliveryStatus status) {
    switch (status) {
      case OrderDeliveryStatus.orderOnTheWay:
        return Colors.orange;
      case OrderDeliveryStatus.orderDelivered:
        return Colors.green;
    }
  }

  String getStatusText(OrderDeliveryStatus status) {
    switch (status) {
      case OrderDeliveryStatus.orderOnTheWay:
        return 'On the Way';
      case OrderDeliveryStatus.orderDelivered:
        return 'Delivered';
    }
  }
}
