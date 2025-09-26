// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_delivery_app/core/models/order.dart';
import 'package:petcure_delivery_app/modules/home_module/typedefs/get_status_color.dart';
import 'package:petcure_delivery_app/modules/home_module/typedefs/get_status_icon.dart';
import 'package:petcure_delivery_app/modules/home_module/typedefs/get_status_text.dart';
import 'package:petcure_delivery_app/modules/home_module/typedefs/refresh_orders.dart';
import 'package:petcure_delivery_app/modules/home_module/widgets/empty_orders_list.dart';
import 'package:petcure_delivery_app/modules/home_module/widgets/orders_list.dart';

class OrderListBuilder extends StatelessWidget {
  final List<Order> orders;
  final RefreshOrders refreshOrders;
  final GetStatusColor getStatusColor;
  final GetStatusIcon getStatusIcon;
  final GetStatusText getStatusText;
  const OrderListBuilder({
    super.key,
    required this.orders,
    required this.refreshOrders,
    required this.getStatusColor,
    required this.getStatusIcon,
    required this.getStatusText,
  });

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const EmptyOrdersList();
    }

    return OrdersList(
      orders: orders,
      refreshOrders: refreshOrders,
      getStatusColor: getStatusColor,
      getStatusIcon: getStatusIcon,
      getStatusText: getStatusText,
    );
  }
}
