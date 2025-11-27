part of 'order_list_cubit.dart';

@freezed
sealed class OrderListState with _$OrderListState {
  const factory OrderListState.initial() = OrderListInitial;
  const factory OrderListState.orderListLoading() = OrderListLoading;
  const factory OrderListState.orderListError(String errorMessage) =
      OrderListError;
  const factory OrderListState.orderListSuccess(
    DeliveryOrderListModel orderListData,
  ) = OrderListSuccess;
}
