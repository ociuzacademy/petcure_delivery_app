part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.logoutSuccess() = LogoutSuccess;
  const factory AuthState.error(String errorMessage) = AuthError;
}
