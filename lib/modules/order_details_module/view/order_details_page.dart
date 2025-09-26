// order_details_page.dart - Update the phone number row with call functionality
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:petcure_delivery_app/core/models/order.dart';
import 'package:petcure_delivery_app/modules/order_details_module/utils/order_details_helper.dart';
import 'package:petcure_delivery_app/modules/order_details_module/widgets/order_info_row.dart';
import 'package:petcure_delivery_app/modules/order_details_module/widgets/order_product_item.dart';
import 'package:petcure_delivery_app/modules/shop_q_r_scanner_module/view/shop_q_r_scanner_page.dart';

class OrderDetailsPage extends StatefulWidget {
  final Order order;
  const OrderDetailsPage({super.key, required this.order});

  static route({required Order order}) =>
      MaterialPageRoute(builder: (context) => OrderDetailsPage(order: order));

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late final OrderDetailsHelper _orderDetailsHelper;

  @override
  void initState() {
    super.initState();
    _orderDetailsHelper = OrderDetailsHelper(
      context: context,
      order: widget.order,
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('MMM dd, yyyy');
    final DateFormat timeFormat = DateFormat('HH:mm');
    final statusColor = _orderDetailsHelper.getStatusColor(
      widget.order.orderDeliveryStatus,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, ShopQRScannerPage.route());
            },
            icon: Icon(Icons.qr_code),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order Header Card
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order #${widget.order.orderId.split('-').last}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: statusColor),
                                ),
                                child: Text(
                                  _orderDetailsHelper.getStatusText(
                                    widget.order.orderDeliveryStatus,
                                  ),
                                  style: TextStyle(
                                    color: statusColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Ordered: ${dateFormat.format(widget.order.orderDate)} at ${timeFormat.format(widget.order.orderDate)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Est. Delivery: ${dateFormat.format(widget.order.estimatedDeliveryDate)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Customer Information Card
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Customer Information',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          OrderInfoRow(
                            icon: Icons.person,
                            label: 'Name',
                            value: widget.order.userName,
                          ),
                          const SizedBox(height: 8),

                          // Phone number row with call button
                          OrderInfoRow(
                            icon: Icons.phone,
                            label: 'Phone',
                            value: widget.order.phoneNumber,
                          ),

                          const SizedBox(height: 8),
                          OrderInfoRow(
                            icon: Icons.location_on,
                            label: 'Address',
                            value: widget.order.address,
                          ),
                          const SizedBox(height: 8),
                          OrderInfoRow(
                            icon: Icons.my_location,
                            label: 'Coordinates',
                            value:
                                '${widget.order.location.latitude.toStringAsFixed(6)}, ${widget.order.location.longitude.toStringAsFixed(6)}',
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Products Ordered Card
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Products Ordered',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...widget.order.productsOrdered.map(
                            (item) => OrderProductItem(item: item),
                          ),

                          const Divider(height: 24),

                          // Total
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Amount',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\u{20B9}${widget.order.totalRate.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Action Buttons Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Call Button
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _orderDetailsHelper.makePhoneCall(),
                    icon: const Icon(Icons.phone, size: 20),
                    label: const Text('Call Customer'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Maps Button
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _orderDetailsHelper.openMap(),
                    icon: const Icon(Icons.map, size: 20),
                    label: const Text('Open Maps'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
