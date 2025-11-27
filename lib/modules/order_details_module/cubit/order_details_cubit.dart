import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_delivery_app/modules/order_details_module/models/order_details_model.dart';
import 'package:petcure_delivery_app/modules/order_details_module/services/order_details_services.dart';

part 'order_details_state.dart';
part 'order_details_cubit.freezed.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(const OrderDetailsState.initial());

  Future<void> getOrderDetails({required int orderId}) async {
    emit(const OrderDetailsState.orderDetailsLoading());
    try {
      final OrderDetailsModel orderDetails =
          await OrderDetailsServices.getOrderDetails(orderId: orderId);
      emit(OrderDetailsState.orderDetailsSuccess(orderDetails));
    } catch (e) {
      emit(OrderDetailsState.orderDetailsError(e.toString()));
    }
  }
}
