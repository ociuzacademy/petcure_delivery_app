part of 'register_bloc.dart';

@freezed
sealed class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.deliveryAgentRegistering(
    DeliveryAgentRegisterData deliveryAgentRegisterData,
  ) = _DeliveryAgentRegistering;
}
