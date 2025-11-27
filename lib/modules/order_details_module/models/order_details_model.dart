// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:petcure_delivery_app/core/enums/delivery_status.dart';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  final OrderDetails orderDetails;

  const OrderDetailsModel({required this.orderDetails});

  OrderDetailsModel copyWith({OrderDetails? orderDetails}) =>
      OrderDetailsModel(orderDetails: orderDetails ?? this.orderDetails);

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        orderDetails: OrderDetails.fromJson(json['order_details']),
      );

  Map<String, dynamic> toJson() => {'order_details': orderDetails.toJson()};
}

class OrderDetails {
  final int id;
  final String userName;
  final String phoneNumber;
  final String latitude;
  final String address;
  final String longitude;
  final DateTime orderDate;
  final DeliveryStatus status;
  final String totalAmount;
  final DateTime estimatedDeliveryDate;
  final List<Item> items;

  const OrderDetails({
    required this.id,
    required this.userName,
    required this.phoneNumber,
    required this.latitude,
    required this.address,
    required this.longitude,
    required this.orderDate,
    required this.status,
    required this.totalAmount,
    required this.estimatedDeliveryDate,
    required this.items,
  });

  OrderDetails copyWith({
    int? id,
    String? userName,
    String? phoneNumber,
    String? latitude,
    String? address,
    String? longitude,
    DateTime? orderDate,
    DeliveryStatus? status,
    String? totalAmount,
    DateTime? estimatedDeliveryDate,
    List<Item>? items,
  }) => OrderDetails(
    id: id ?? this.id,
    userName: userName ?? this.userName,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    latitude: latitude ?? this.latitude,
    address: address ?? this.address,
    longitude: longitude ?? this.longitude,
    orderDate: orderDate ?? this.orderDate,
    status: status ?? this.status,
    totalAmount: totalAmount ?? this.totalAmount,
    estimatedDeliveryDate: estimatedDeliveryDate ?? this.estimatedDeliveryDate,
    items: items ?? this.items,
  );

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    id: json['id'],
    userName: json['user_name'],
    phoneNumber: json['phone_number'],
    latitude: json['latitude'],
    address: json['address'],
    longitude: json['longitude'],
    orderDate: DateTime.parse(json['order_date']),
    status: DeliveryStatus.fromString(json['status']),
    totalAmount: json['total_amount'],
    estimatedDeliveryDate: DateTime.parse(json['estimated_delivery_date']),
    items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_name': userName,
    'phone_number': phoneNumber,
    'latitude': latitude,
    'address': address,
    'longitude': longitude,
    'order_date': orderDate.toIso8601String(),
    'status': status.name,
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
