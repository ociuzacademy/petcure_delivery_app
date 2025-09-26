// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_delivery_app/core/models/order.dart';
import 'package:petcure_delivery_app/modules/home_module/typedefs/get_status_color.dart';
import 'package:petcure_delivery_app/modules/home_module/typedefs/get_status_icon.dart';
import 'package:petcure_delivery_app/modules/home_module/typedefs/get_status_text.dart';
import 'package:petcure_delivery_app/modules/home_module/typedefs/refresh_orders.dart';
import 'package:petcure_delivery_app/modules/home_module/widgets/order_item.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({
    super.key,
    required this.orders,
    required this.refreshOrders,
    required this.getStatusColor,
    required this.getStatusIcon,
    required this.getStatusText,
  });

  final List<Order> orders;
  final RefreshOrders refreshOrders;
  final GetStatusColor getStatusColor;
  final GetStatusIcon getStatusIcon;
  final GetStatusText getStatusText;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshOrders,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 8),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderItem(
            order: orders[index],
            getStatusColor: getStatusColor,
            getStatusText: getStatusText,
            getStatusIcon: getStatusIcon,
          );
        },
      ),
    );
  }
}
