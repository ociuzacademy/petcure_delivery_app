// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_delivery_app/core/helpers/fake_data.dart';
import 'package:petcure_delivery_app/core/models/order.dart';
import 'package:petcure_delivery_app/modules/home_module/utils/orders_today_helper.dart';
import 'package:petcure_delivery_app/modules/home_module/widgets/order_list_builder.dart';
import 'package:petcure_delivery_app/modules/home_module/widgets/orders_compact_stat.dart';

class OrdersTodayWidget extends StatefulWidget {
  const OrdersTodayWidget({super.key});

  @override
  State<OrdersTodayWidget> createState() => _OrdersTodayWidgetState();
}

class _OrdersTodayWidgetState extends State<OrdersTodayWidget>
    with SingleTickerProviderStateMixin {
  late final OrdersTodayHelper _ordersTodayHelper;
  late ValueNotifier<List<Order>> _ordersToday;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _ordersTodayHelper = OrdersTodayHelper();
    _ordersToday = ValueNotifier<List<Order>>(
      FakeData.generateFakeOrders(count: 8),
    );
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Orders"),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _ordersToday.value = FakeData.generateFakeOrders(count: 8);
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(
              icon: Icon(Icons.delivery_dining, size: 20),
              text: 'On the Way',
            ),
            Tab(icon: Icon(Icons.check_circle, size: 20), text: 'Delivered'),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _ordersToday,
        builder: (context, ordersToday, child) {
          final onTheWayOrders = _ordersTodayHelper.getOnTheWayOrders(
            ordersToday,
          );
          final deliveredOrders = _ordersTodayHelper.getDeliveredOrders(
            ordersToday,
          );

          return Column(
            children: [
              // Compact summary card
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OrdersCompactStat(
                      count: ordersToday.length.toString(),
                      label: 'Total',
                      color: Colors.blue,
                    ),
                    OrdersCompactStat(
                      count: onTheWayOrders.length.toString(),
                      label: 'In Progress',
                      color: Colors.orange,
                    ),
                    OrdersCompactStat(
                      count: deliveredOrders.length.toString(),
                      label: 'Completed',
                      color: Colors.green,
                    ),
                  ],
                ),
              ),

              // Tab content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // On the Way Tab
                    OrderListBuilder(
                      orders: onTheWayOrders,
                      refreshOrders: () async {
                        _ordersToday.value = FakeData.generateFakeOrders(
                          count: 8,
                        );
                      },
                      getStatusColor: _ordersTodayHelper.getStatusColor,
                      getStatusIcon: _ordersTodayHelper.getStatusIcon,
                      getStatusText: _ordersTodayHelper.getStatusText,
                    ),

                    // Delivered Tab
                    OrderListBuilder(
                      orders: deliveredOrders,
                      refreshOrders: () async {
                        _ordersToday.value = FakeData.generateFakeOrders(
                          count: 8,
                        );
                      },
                      getStatusColor: _ordersTodayHelper.getStatusColor,
                      getStatusIcon: _ordersTodayHelper.getStatusIcon,
                      getStatusText: _ordersTodayHelper.getStatusText,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
