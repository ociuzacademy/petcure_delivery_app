// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:petcure_delivery_app/core/models/cart_item.dart';

enum OrderDeliveryStatus { orderOnTheWay, orderDelivered }

class Location {
  final double latitude;
  final double longitude;
  const Location({required this.latitude, required this.longitude});
}

class Order {
  final String orderId;
  final String userId;
  final String userName;
  final String address;
  final String phoneNumber;
  final Location location;
  final DateTime orderDate;
  final List<CartItem> productsOrdered;
  final double totalRate;
  final OrderDeliveryStatus orderDeliveryStatus;
  final DateTime estimatedDeliveryDate;
  const Order({
    required this.orderId,
    required this.userId,
    required this.userName,
    required this.address,
    required this.phoneNumber,
    required this.location,
    required this.orderDate,
    required this.productsOrdered,
    required this.totalRate,
    required this.orderDeliveryStatus,
    required this.estimatedDeliveryDate,
  });
}
