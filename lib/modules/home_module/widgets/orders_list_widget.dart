// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_delivery_app/core/exports/bloc_exports.dart';

import 'package:petcure_delivery_app/modules/home_module/models/delivery_order_list_model.dart';
import 'package:petcure_delivery_app/modules/home_module/utils/orders_list_helper.dart';
import 'package:petcure_delivery_app/modules/home_module/widgets/order_list_builder.dart';
import 'package:petcure_delivery_app/modules/home_module/widgets/orders_compact_stat.dart';
import 'package:petcure_delivery_app/widgets/custom_error_widget.dart';
import 'package:petcure_delivery_app/widgets/loaders/list_item_loading_widget.dart';

class OrdersListWidget extends StatefulWidget {
  const OrdersListWidget({super.key});

  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget>
    with SingleTickerProviderStateMixin {
  late final OrdersListHelper _ordersListHelper;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _ordersListHelper = OrdersListHelper(context: context);

    _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ordersListHelper.getOrders();
    });
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
        title: const Text('Delivery Orders'),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _ordersListHelper.getOrders();
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
      body: BlocBuilder<OrderListCubit, OrderListState>(
        builder: (context, state) {
          switch (state) {
            case OrderListLoading _:
              return const ListItemLoadingWidget(itemCount: 5);
            case OrderListError(:final errorMessage):
              return CustomErrorWidget(
                onRetry: _ordersListHelper.getOrders,
                errorMessage: errorMessage,
              );
            case OrderListSuccess(:final orderListData):
              final List<Order> onTheWayOrders = orderListData.onTheWayOrders;
              final List<Order> deliveredOrders = orderListData.deliveredOrders;
              final int totalOrders =
                  onTheWayOrders.length + deliveredOrders.length;
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
                          count: totalOrders.toString(),
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
                            _ordersListHelper.getOrders();
                          },
                          getStatusColor: OrdersListHelper.getStatusColor,
                          getStatusIcon: OrdersListHelper.getStatusIcon,
                          getStatusText: OrdersListHelper.getStatusText,
                        ),

                        // Delivered Tab
                        OrderListBuilder(
                          orders: deliveredOrders,
                          refreshOrders: () async {
                            _ordersListHelper.getOrders();
                          },
                          getStatusColor: OrdersListHelper.getStatusColor,
                          getStatusIcon: OrdersListHelper.getStatusIcon,
                          getStatusText: OrdersListHelper.getStatusText,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
