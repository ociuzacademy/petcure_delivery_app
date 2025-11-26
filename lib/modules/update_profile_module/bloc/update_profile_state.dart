part of 'update_profile_bloc.dart';

@freezed
sealed class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState.initial() = UpdateProfileInitial;
  const factory UpdateProfileState.updateProfileLoading() =
      UpdateProfileLoading;
  const factory UpdateProfileState.updateProfileError(String errorMessage) =
      UpdateProfileError;
  const factory UpdateProfileState.updateProfileSuccess(
    UpdateProfileResponseModel response,
  ) = UpdateProfileSuccess;
}
