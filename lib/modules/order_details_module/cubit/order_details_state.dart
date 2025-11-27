part of 'order_details_cubit.dart';

@freezed
sealed class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.initial() = OrderDetailsInitial;
  const factory OrderDetailsState.orderDetailsLoading() = OrderDetailsLoading;
  const factory OrderDetailsState.orderDetailsSuccess(OrderDetailsModel order) =
      OrderDetailsSuccess;
  const factory OrderDetailsState.orderDetailsError(String errorMessage) =
      OrderDetailsError;
}
