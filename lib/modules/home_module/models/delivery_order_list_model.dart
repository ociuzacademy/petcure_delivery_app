// To parse this JSON data, do
//
//     final deliveryOrderListModel = deliveryOrderListModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_delivery_app/modules/home_module/enums/delivery_status.dart';

DeliveryOrderListModel deliveryOrderListModelFromJson(String str) =>
    DeliveryOrderListModel.fromJson(json.decode(str));

String deliveryOrderListModelToJson(DeliveryOrderListModel data) =>
    json.encode(data.toJson());

class DeliveryOrderListModel {
  final List<Order> onTheWayOrders;
  final List<Order> deliveredOrders;

  const DeliveryOrderListModel({
    required this.onTheWayOrders,
    required this.deliveredOrders,
  });

  DeliveryOrderListModel copyWith({
    List<Order>? onTheWayOrders,
    List<Order>? deliveredOrders,
  }) => DeliveryOrderListModel(
    onTheWayOrders: onTheWayOrders ?? this.onTheWayOrders,
    deliveredOrders: deliveredOrders ?? this.deliveredOrders,
  );

  factory DeliveryOrderListModel.fromJson(Map<String, dynamic> json) =>
      DeliveryOrderListModel(
        onTheWayOrders: List<Order>.from(
          json['on_the_way_orders'].map((x) => Order.fromJson(x)),
        ),
        deliveredOrders: List<Order>.from(
          json['delivered_orders'].map((x) => Order.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    'on_the_way_orders': List<dynamic>.from(
      onTheWayOrders.map((x) => x.toJson()),
    ),
    'delivered_orders': List<dynamic>.from(
      deliveredOrders.map((x) => x.toJson()),
    ),
  };
}

class Order {
  final int id;
  final String userName;
  final DateTime orderDate;
  final DeliveryStatus status;
  final String totalAmount;
  final DateTime estimatedDeliveryDate;
  final List<Item> items;

  const Order({
    required this.id,
    required this.userName,
    required this.orderDate,
    required this.status,
    required this.totalAmount,
    required this.estimatedDeliveryDate,
    required this.items,
  });

  Order copyWith({
    int? id,
    String? userName,
    DateTime? orderDate,
    DeliveryStatus? status,
    String? totalAmount,
    DateTime? estimatedDeliveryDate,
    List<Item>? items,
  }) => Order(
    id: id ?? this.id,
    userName: userName ?? this.userName,
    orderDate: orderDate ?? this.orderDate,
    status: status ?? this.status,
    totalAmount: totalAmount ?? this.totalAmount,
    estimatedDeliveryDate: estimatedDeliveryDate ?? this.estimatedDeliveryDate,
    items: items ?? this.items,
  );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    userName: json['user_name'],
    orderDate: DateTime.parse(json['order_date']),
    status: DeliveryStatus.fromString(json['status']),
    totalAmount: json['total_amount'],
    estimatedDeliveryDate: DateTime.parse(json['estimated_delivery_date']),
    items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_name': userName,
    'order_date': orderDate.toIso8601String(),
    'status': status.toJson(),
    'total_amount': totalAmount,
    'estimated_delivery_date': estimatedDeliveryDate.toIso8601String(),
    'items': List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  final String productName;
  final int quantity;
  final String price;

  const Item({
    required this.productName,
    required this.quantity,
    required this.price,
  });

  Item copyWith({String? productName, int? quantity, String? price}) => Item(
    productName: productName ?? this.productName,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    productName: json['product_name'],
    quantity: json['quantity'],
    price: json['price'],
  );

  Map<String, dynamic> toJson() => {
    'product_name': productName,
    'quantity': quantity,
    'price': price,
  };
}
