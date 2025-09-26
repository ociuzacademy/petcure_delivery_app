// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:petcure_delivery_app/core/models/product.dart';

class CartItem {
  final Product product;
  final int quantity;
  final double productPrice;
  final DateTime deliveryDate;
  const CartItem({
    required this.product,
    required this.quantity,
    required this.productPrice,
    required this.deliveryDate,
  });
}
