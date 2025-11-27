part of 'complete_delivery_bloc.dart';

@freezed
sealed class CompleteDeliveryState with _$CompleteDeliveryState {
  const factory CompleteDeliveryState.initial() = CompleteDeliveryInitial;
  const factory CompleteDeliveryState.loading() = CompleteDeliveryLoading;
  const factory CompleteDeliveryState.success(
    ConfirmDeliveryResponseModel response,
  ) = CompleteDeliverySuccess;
  const factory CompleteDeliveryState.error(String error) =
      CompleteDeliveryError;
}
