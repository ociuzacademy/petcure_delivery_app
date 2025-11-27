import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_delivery_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_delivery_app/modules/home_module/models/delivery_order_list_model.dart';
import 'package:petcure_delivery_app/modules/home_module/services/home_module_services.dart';

part 'order_list_state.dart';
part 'order_list_cubit.freezed.dart';

class OrderListCubit extends Cubit<OrderListState> {
  OrderListCubit() : super(const OrderListState.initial());

  Future<void> getDeliveryOrderList() async {
    emit(const OrderListState.orderListLoading());
    try {
      final agentId = await AuthStorageFunctions.getAgentId();
      final response = await HomeModuleServices.getDeliveryOrderList(
        agentId: agentId,
      );
      emit(OrderListState.orderListSuccess(response));
    } catch (e) {
      emit(OrderListState.orderListError(e.toString()));
    }
  }
}
