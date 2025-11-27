part of 'complete_delivery_bloc.dart';

@freezed
sealed class CompleteDeliveryEvent with _$CompleteDeliveryEvent {
  const factory CompleteDeliveryEvent.started() = _Started;
  const factory CompleteDeliveryEvent.completingDelivery(int orderId) =
      _CompletingDelivery;
}
