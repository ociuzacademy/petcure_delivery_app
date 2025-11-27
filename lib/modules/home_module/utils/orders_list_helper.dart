import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/modules/home_module/cubit/order_list_cubit.dart';
import 'package:petcure_delivery_app/modules/home_module/enums/delivery_status.dart';

class OrdersListHelper {
  final BuildContext context;

  const OrdersListHelper({required this.context});

  void getOrders() {
    final OrderListCubit orderListCubit = context.read<OrderListCubit>();
    orderListCubit.getDeliveryOrderList();
  }

  static Color getStatusColor(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.orderOnTheWay:
        return Colors.blue;
      case DeliveryStatus.orderDelivered:
        return Colors.green;
    }
  }

  static String getStatusText(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.orderOnTheWay:
        return 'On the Way';
      case DeliveryStatus.orderDelivered:
        return 'Delivered';
    }
  }

  static IconData getStatusIcon(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.orderOnTheWay:
        return Icons.delivery_dining;
      case DeliveryStatus.orderDelivered:
        return Icons.check_circle;
    }
  }
}
