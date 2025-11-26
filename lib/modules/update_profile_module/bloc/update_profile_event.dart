part of 'update_profile_bloc.dart';

@freezed
sealed class UpdateProfileEvent with _$UpdateProfileEvent {
  const factory UpdateProfileEvent.started() = _Started;
  const factory UpdateProfileEvent.updatingDeliveryAgentProfile(
    UpdateAgentProfileData updatedProfileData,
  ) = _UpdatingDeliveryAgentProfile;
}
