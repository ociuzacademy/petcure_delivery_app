part of 'register_bloc.dart';

@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitial;
  const factory RegisterState.registerLoading() = RegisterLoading;
  const factory RegisterState.registerError(String errorMessage) =
      RegisterError;
  const factory RegisterState.registerSuccess(
    DeliveryRegistrationResponseModel response,
  ) = RegisterSuccess;
}
