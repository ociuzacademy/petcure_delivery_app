import 'package:flutter/material.dart';
import 'package:petcure_delivery_app/core/models/order.dart';

class OrdersTodayHelper {
  Color getStatusColor(OrderDeliveryStatus status) {
    switch (status) {
      case OrderDeliveryStatus.orderOnTheWay:
        return Colors.blue;
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

  IconData getStatusIcon(OrderDeliveryStatus status) {
    switch (status) {
      case OrderDeliveryStatus.orderOnTheWay:
        return Icons.delivery_dining;
      case OrderDeliveryStatus.orderDelivered:
        return Icons.check_circle;
    }
  }

  List<Order> getOnTheWayOrders(List<Order> allOrders) {
    return allOrders
        .where(
          (order) =>
              order.orderDeliveryStatus == OrderDeliveryStatus.orderOnTheWay,
        )
        .toList();
  }

  List<Order> getDeliveredOrders(List<Order> allOrders) {
    return allOrders
        .where(
          (order) =>
              order.orderDeliveryStatus == OrderDeliveryStatus.orderDelivered,
        )
        .toList();
  }
}
