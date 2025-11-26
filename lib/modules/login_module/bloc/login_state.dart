part of 'login_bloc.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginError(String errorMessage) = LoginError;
  const factory LoginState.loginSuccess(
    DeliveryAgentLoginResponseModel response,
  ) = LoginSuccess;
}
