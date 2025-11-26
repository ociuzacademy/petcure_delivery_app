part of 'delivery_agent_profile_cubit.dart';

@freezed
sealed class DeliveryAgentProfileState with _$DeliveryAgentProfileState {
  const factory DeliveryAgentProfileState.initial() =
      DeliveryAgentProfileInitial;
  const factory DeliveryAgentProfileState.deliveryAgentProfileLoading() =
      DeliveryAgentProfileLoading;
  const factory DeliveryAgentProfileState.deliveryAgentProfileError(
    String errorMessage,
  ) = DeliveryAgentProfileError;
  const factory DeliveryAgentProfileState.deliveryAgentProfileSuccess(
    DeliveryAgentProfileModel agentProfileData,
  ) = DeliveryAgentProfileSuccess;
}
